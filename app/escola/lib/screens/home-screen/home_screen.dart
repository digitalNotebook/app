import 'package:flutter/material.dart';

import 'widgets/card_messages.dart';
import 'widgets/saudacao.dart';
import '/screens/home-screen/widgets/last_classes.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/home-screen';

  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //mostra um dialog no centro da tela
  Future<void> _showDialog(MediaQueryData mediaQuery) {
    return showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Título do alert'),
          content: Text('${mediaQuery.size.height}'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //capturamos informações do dispositivo
    final mediaQuery = MediaQuery.of(context);
    //capturamos informações do textScaleFactor do dispositivo
    final textScale = MediaQuery.of(context).textScaleFactor;
    final seedId = ModalRoute.of(context)?.settings.arguments as String;

    final appBar = AppBar(
      centerTitle: true,
      elevation: 5,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.menu),
      ),
      title: Text(widget.title),
    );

    final containerHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

    return Scaffold(
      drawer: Drawer(
        semanticLabel: 'Menu',
        child: ListView(
          children: [
            Text('teste 1'),
            Text('teste 2'),
          ],
        ),
      ),
      appBar: appBar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              //MENSAGEM DE SAUDAÇÃO
              Saudacao(textScale, containerHeight),
              //FOTO DO ALUNO(A)
              Stack(
                children: [
                  Container(
                    color: Colors.black12,
                    height: containerHeight * 0.1,
                  ),
                  Container(
                    height: containerHeight * 0.09,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          child: IconButton(
                            //ADD FOTO DO ALUNO
                            onPressed: () {},
                            icon: Icon(Icons.add_a_photo),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              //BOTÕES DE MENU
              Container(
                color: Colors.black12,
                height: containerHeight * 0.13,
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () => _showDialog(mediaQuery),
                        child: Column(
                          children: [
                            Icon(Icons.calendar_today),
                            Text(
                              'Calendar',
                              style: TextStyle(fontSize: 12 * textScale),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Column(
                          children: [
                            Icon(Icons.message_outlined),
                            Text(
                              'Messages',
                              style: TextStyle(fontSize: 12 * textScale),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Column(
                          children: [
                            Icon(Icons.note_outlined),
                            Text(
                              'Classes',
                              style: TextStyle(fontSize: 12 * textScale),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Column(
                          children: [
                            Icon(Icons.home_work_outlined),
                            Text(
                              'Homework',
                              style: TextStyle(fontSize: 12 * textScale),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //MENSAGENS DE AVISO
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    height: containerHeight * 0.4,
                    color: Colors.black12,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CardMessages(textScale, mediaQuery, containerHeight),
                        CardMessages(textScale, mediaQuery, containerHeight),
                        CardMessages(textScale, mediaQuery, containerHeight),
                        CardMessages(textScale, mediaQuery, containerHeight)
                      ],
                    ),
                  ),
                ],
              ),
              //lista vertical
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    height: containerHeight * 0.27,
                    color: Colors.black12,
                  ),
                  Column(
                    children: [
                      ClassList(
                        textScale: textScale,
                        teacherName: 'Leonardo',
                        className: 'Present Continuos',
                        classDescription: 'Something about present continuos',
                      ),
                      ClassList(
                        textScale: textScale,
                        teacherName: 'Leonardo',
                        className: 'Present Continuos',
                        classDescription: 'Something about present continuos',
                      ),
                      ClassList(
                        textScale: textScale,
                        teacherName: 'Leonardo',
                        className: 'Present Continuos',
                        classDescription: 'Something about present continuos',
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
