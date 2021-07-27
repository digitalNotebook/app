import 'package:flutter/material.dart';

class HomeworkScreen extends StatelessWidget {
  const HomeworkScreen({Key? key}) : super(key: key);

  static const pageName = '/homeworks';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('DONE'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('TO DO'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('FAVORITES'),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.black38),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                              child: Image.network(
                                'https://i0.wp.com/handluggageonly.co.uk/wp-content/uploads/2018/10/Hand-Luggage-Only-12.jpg?w=1600&ssl=1',
                                fit: BoxFit.fitWidth,
                                width: double.infinity,
                                height: 100,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.favorite_border),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Aula ${index + 1}'),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
