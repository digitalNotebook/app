import 'package:escola/providers/aulas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/menu_calendar.dart';
import '../widgets/menu_messages.dart';
import '../widgets/menu_undone_class.dart';
import '../widgets/menu_saudacao.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  static const pageName = '/menu';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Aulas(),
        ),
        //demais providers aqui
      ],
      child: SafeArea(
        child: Column(
          children: [
            //SAUDAÇÃO
            Expanded(
              child: Saudacao(),
            ),

            Expanded(
              flex: 3,
              child: MenuMessage(),
            ),

            Expanded(
              flex: 3,
              child: MenuLastClass(),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 8),
                  child: Text(
                    'Homework: ',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 2,
              child: MenuCalendar(),
            ),
          ],
        ),
      ),
    );
  }
}
