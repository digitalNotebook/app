import 'package:flutter/material.dart';

class MenuMessage extends StatelessWidget {
  const MenuMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                            child: Text('5'),
                            top: 0,
                            right: 0,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Teacher Leonardo'),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          'The Column widget does not scroll (and in general it is considered an error to have more children in a Column than will fit in the available room). If you have a line of widgets and want them to be able to scroll if there is insufficient room, consider using a ListView.',
                          softWrap: true,
                          maxLines: 4,
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
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
