import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/aula.dart';

class ClassItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final aula = Provider.of<Aula>(context);
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(30),
          topRight: const Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(30),
                    topRight: const Radius.circular(30),
                  ),
                  child: Placeholder(
                    fallbackHeight: 70,
                  )
                  //   Image.network(
                  //   aula.imagesUrl,
                  //   fit: BoxFit.fitWidth,
                  //   width: double.infinity,
                  //   height: 100,
                  // ),
                  ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_border),
              ),
            ],
          ),
          Row(
            children: [
              Text('${aula.title} - ${aula.subtitle}'),
            ],
          )
        ],
      ),
    );
  }
}
