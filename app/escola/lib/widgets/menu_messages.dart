import 'package:escola/models/message.dart';
import 'package:escola/providers/messages.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'package:provider/provider.dart';
import '../screens/message_screen_detail.dart';
import '../mediaQuery/size_config.dart';

class MenuMessage extends StatefulWidget {
  const MenuMessage({Key? key}) : super(key: key);

  @override
  _MenuMessageState createState() => _MenuMessageState();
}

class _MenuMessageState extends State<MenuMessage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  var _isInit = true;
  late List<Message> _items;
  late Message _displayMessage;
  var _index = 0;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      _items = Provider.of<Messages>(context, listen: false).items;
      _index = _items.length > 0 ? (_items.length - 1) : 0;
      print('Qtde de messagens: ${_items.length}');
      _displayMessage = _items.length > 0
          ? _items[_index]
          : Message(
              'e1',
              'Nothing new',
              'System',
              DateTime.now(),
            );
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void _nextMessage() {
    print('Index atual: $_index, próximo index: ${_index + 1}');
    if (!(_index + 1 >= _items.length)) {
      setState(() {
        _index++;
        _displayMessage = _items[_index];
      });
    }
    return;
  }

  void _previousMessage() {
    print('Index atual: $_index, index anterior: ${_index - 1}');
    if (!(_index - 1 < 0)) {
      setState(() {
        _index--;
        _displayMessage = _items[_index];
      });
    }
    return;
  }

  Widget createMessageBox(double height, double textScale, String message) {
    return height > 800
        ? Text(message,
            softWrap: true,
            maxLines: 6,
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: textScale * 3))
        : Text(
            message,
            softWrap: true,
            maxLines: 5,
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: textScale * 2),
          );
  }

  @override
  Widget build(BuildContext context) {
    print(SizeConfig.screenHeight);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //seta
        IconButton(
          onPressed: _previousMessage,
          icon: const Icon(Icons.arrow_back),
        ),

        Flexible(
          fit: FlexFit.tight,
          child: GestureDetector(
            onTap: () {
              pushNewScreenWithRouteSettings(
                context,
                pageTransitionAnimation: PageTransitionAnimation.sizeUp,
                screen: MessageDetailScreen(),
                settings: RouteSettings(
                    name: MessageDetailScreen.pageName,
                    arguments: _displayMessage.description),
              );
              // Navigator.of(context)
              //     .pushNamed(MessageDetailScreen.pageName, arguments: mensagem);
            },
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: Card(
                key: ValueKey<String>(_displayMessage.id),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                child: Icon(Icons.person),
                              ),
                              Positioned(
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal! * 5),
                                ),
                                top: 0,
                                right: 0,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Flexible(
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                _displayMessage.teacherName,
                                style: TextStyle(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 6),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: createMessageBox(
                                SizeConfig.screenHeight!,
                                SizeConfig.blockSizeVertical!,
                                _displayMessage.description),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

        IconButton(
          onPressed: _nextMessage,
          icon: const Icon(Icons.arrow_forward),
        ),
      ],
    );
  }
}
