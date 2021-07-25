import 'package:flutter/material.dart';

class CardMessages extends StatelessWidget {
  final double textScale;
  final MediaQueryData mediaQuery;
  final double containerHeight;

  CardMessages(this.textScale, this.mediaQuery, this.containerHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaQuery.size.width * 0.7,
      height: containerHeight * 0.4,
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //ListTile é usada em ListView, Columns and Drawers
            //fit: FlexFit.tight,
            ListTile(
              enableFeedback: true,
              horizontalTitleGap: 8,
              leading: CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: FittedBox(
                child: Text(
                  'Leonardo Fagundes',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              subtitle: Text(
                '34 min',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic',
                  textAlign: TextAlign.justify,
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.forward_rounded,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
