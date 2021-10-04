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
  //solução nova
  late PageController _controller;
  int _currentCard = 0;

  //scroll da solução antiga
  var _isInit = true;
  late List<Message> _items;
  var _index = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = PageController(
      initialPage: _currentCard,
      keepPage: false,
      viewportFraction: 0.75,
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _items = Provider.of<Messages>(context, listen: false).items;
      _index = _items.length > 0 ? (_items.length - 1) : 0;
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  // void _nextMessage() {
  //   print('Index atual: $_index, próximo index: ${_index + 1}');
  //   if (!(_index + 1 >= _items.length)) {
  //     setState(() {
  //       _index++;
  //       _displayMessage = _items[_index];
  //     });
  //   }
  //   return;
  // }

  // void _previousMessage() {
  //   print('Index atual: $_index, index anterior: ${_index - 1}');
  //   if (!(_index - 1 < 0)) {
  //     setState(() {
  //       _index--;
  //       _displayMessage = _items[_index];
  //     });
  //   }
  //   return;
  // }

  Widget _buildListMessages(int index) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (ctx, child) {
        double value = 1.0;
        if (_controller.position.haveDimensions) {
          value = _controller.page! - index;
          value = (1 - (value.abs() * .25)).clamp(0.0, 1.0);
        }

        return Center(
          child: Container(
            height: Curves.easeOut.transform(value) * 300,
            width: Curves.easeOut.transform(value) * 250,
            child: child,
          ),
        );
      },
      child: Card(
        elevation: index == _currentCard ? 7 : 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(index == _currentCard ? 20 : 10),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              CardHeader(
                message: _items[index],
              ),
              SizedBox(
                height: 16,
              ),
              Flexible(
                child: _createMessageBox(
                  SizeConfig.screenHeight!,
                  SizeConfig.blockSizeVertical!,
                  _items[index].description,
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // return ListView.builder(
    //   scrollDirection: Axis.horizontal,
    //   itemCount: _items.length,
    //   itemBuilder: (ctx, index) => Container(
    //     width: (SizeConfig.screenWidth! - 100),
    //     margin: EdgeInsets.symmetric(horizontal: 5),
    //     child: Card(
    //       elevation: 5,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.all(
    //           Radius.circular(20),
    //         ),
    //       ),
    //       child: Container(
    //         padding: const EdgeInsets.all(8),
    //         child: Column(
    //           children: [
    //             CardHeader(
    //               message: _items[index],
    //             ),
    //             SizedBox(
    //               height: 16,
    //             ),
    //             _createMessageBox(SizeConfig.screenHeight!,
    //                 SizeConfig.blockSizeVertical!, _items[index].description),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }

  Widget _createMessageBox(double height, double textScale, String message) {
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
    // print(SizeConfig.screenHeight);
    // print(SizeConfig.screenWidth);
    return PageView.builder(
      itemCount: _items.length,
      itemBuilder: (ctx, index) => _buildListMessages(index),
      controller: _controller,
      onPageChanged: (value) {
        setState(() {
          _currentCard = value;
        });
      },
    );
    // return LayoutBuilder(
    //   builder: (ctx, constraints) => GestureDetector(
    //     onTap: () => pushNewScreenWithRouteSettings(
    //       context,
    //       pageTransitionAnimation: PageTransitionAnimation.sizeUp,
    //       screen: MessageDetailScreen(),
    //       settings: RouteSettings(
    //           name: MessageDetailScreen.pageName,
    //           arguments: _items[_index].description),
    //     ),
    //     child: _buildListMessages(
    //       constraints.maxHeight,
    //     ),
    //   ),
    // );
  }
}

class CardHeader extends StatelessWidget {
  const CardHeader({
    Key? key,
    required Message message,
  })  : _message = message,
        super(key: key);

  final Message _message;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            CircleAvatar(
              child: Icon(Icons.person),
            ),
            Positioned(
              child: Text(
                '1',
                style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal! * 5),
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
            fit: BoxFit.contain,
            child: Text(
              _message.teacherName,
              style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal! * 4),
              overflow: TextOverflow.fade,
            ),
          ),
        )
      ],
    );
  }
}
// return Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [
//     // //seta
//     // IconButton(
//     //   onPressed: _previousMessage,
//     //   icon: const Icon(Icons.arrow_back),
//     // ),

//     // Flexible(
//     //   fit: FlexFit.tight,
//     //   child: GestureDetector(
//     //     onTap: () {
//     //       pushNewScreenWithRouteSettings(
//     //         context,
//     //         pageTransitionAnimation: PageTransitionAnimation.sizeUp,
//     //         screen: MessageDetailScreen(),
//     //         settings: RouteSettings(
//     //             name: MessageDetailScreen.pageName,
//     //             arguments: _displayMessage.description),
//     //       );
//     //       // Navigator.of(context)
//     //       //     .pushNamed(MessageDetailScreen.pageName, arguments: mensagem);
//     //     },
//     //     child: AnimatedSwitcher(
//     //       duration: Duration(milliseconds: 500),
//     //       child: Card(
//     //         key: ValueKey<String>(_displayMessage.id),
//     //         elevation: 5,
//     //         shape: RoundedRectangleBorder(
//     //           borderRadius: BorderRadius.all(
//     //             Radius.circular(20),
//     //           ),
//     //         ),
//     //         child: Container(
//     //           padding: EdgeInsets.all(8),
//     //           child: Column(
//     //             children: [
//     //               Row(
//     //                 children: [
//     //                   Stack(
//     //                     children: [
//     //                       CircleAvatar(
//     //                         child: Icon(Icons.person),
//     //                       ),
//     //                       Positioned(
//     //                         child: Text(
//     //                           '1',
//     //                           style: TextStyle(
//     //                               fontSize:
//     //                                   SizeConfig.blockSizeHorizontal! * 5),
//     //                         ),
//     //                         top: 0,
//     //                         right: 0,
//     //                       ),
//     //                     ],
//     //                   ),
//     //                   SizedBox(
//     //                     width: 15,
//     //                   ),
//     //                   Flexible(
//     //                     child: FittedBox(
//     //                       fit: BoxFit.fitWidth,
//     //                       child: Text(
//     //                         _displayMessage.teacherName,
//     //                         style: TextStyle(
//     //                             fontSize:
//     //                                 SizeConfig.blockSizeHorizontal! * 6),
//     //                       ),
//     //                     ),
//     //                   ),
//     //                 ],
//     //               ),
//     //               SizedBox(
//     //                 height: 16,
//     //               ),
//     //               Row(
//     //                 children: [
//     //                   Flexible(
//     //                     fit: FlexFit.tight,
//     //                     child: createMessageBox(
//     //                         SizeConfig.screenHeight!,
//     //                         SizeConfig.blockSizeVertical!,
//     //                         _displayMessage.description),
//     //                   ),
//     //                 ],
//     //               ),
//     //             ],
//     //           ),
//     //         ),
//     //       ),
//     //     ),
//     //   ),
//     // ),

//     // IconButton(
//     //   onPressed: _nextMessage,
//     //   icon: const Icon(Icons.arrow_forward),
//     // ),
//   ],
// );
