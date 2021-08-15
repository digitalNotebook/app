import 'package:escola/screens/message_screen_detail.dart';
import 'package:flutter/material.dart';

import '../mediaQuery/size_config.dart';

class MenuMessage extends StatelessWidget {
  const MenuMessage({Key? key}) : super(key: key);

  final mensagem =
      'The Column widget does not scroll (and in general it is considered an error to have more children in a Column than will fit in the available room). If you have a line of widgets and want them to be able to scroll if there is insufficient room, consider using a ListView';

  Widget createMessageBox(double height, double textScale) {
    return height > 800
        ? Text(mensagem,
            softWrap: true,
            maxLines: 6,
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: textScale * 3))
        : Text(
            mensagem,
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
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),

        Flexible(
          fit: FlexFit.tight,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(MessageDetailScreen.pageName, arguments: mensagem);
            },
            child: Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(8),
                child: ListView(
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
                                '5',
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
                              'Teacher Leonardo',
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
                          child: createMessageBox(SizeConfig.screenHeight!,
                              SizeConfig.blockSizeVertical!),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_forward),
        ),
      ],
    );
  }
}
