import 'package:escola/widgets/card_messages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/saudacao.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blueAccent,
        buttonColor: Colors.blueGrey,
        //definir o theme dos Text
      ),
      home: MyHomePage(title: 'Digital Notebook'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    final mediaQuery = MediaQuery.of(context);
    final textScale = MediaQuery.of(context).textScaleFactor;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          //mensagem de saudação
          Container(
            //height: mediaQuery.size.height * 0.1,
            child: Saudacao(textScale),
          ),
          //FOTO DO ALUNO(A)
          Container(
            //height: mediaQuery.size.height * 0.1,
            child: Stack(
              children: [
                CircleAvatar(
                  maxRadius: 40,
                  child: IconButton(
                    //ADD FOTO DO ALUNO
                    onPressed: () {},
                    icon: Icon(Icons.add_a_photo),
                  ),
                ),
              ],
            ),
          ),
          //espaço vazio
          //BOTÕES DE MENU
          Container(
            decoration: BoxDecoration(),
            //height: mediaQuery.size.height * 0.12,
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
          Container(
            width: mediaQuery.size.width * 0.7,
            height: mediaQuery.size.height * 0.3,
            child: CardMessages(textScale),
          ),
          //lista vertical
          Container(
            //padding: EdgeInsets.only(left: 5, right: 5),
            width: mediaQuery.size.width * 0.9,
            //height: mediaQuery.size.height * 0.1,
            child: Card(
                elevation: 5,
                child: ListTile(
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        maxRadius: 15,
                        child: Icon(Icons.person),
                      ),
                      Text(
                        'Leonardo',
                        style: TextStyle(fontSize: 10 * textScale),
                      ),
                    ],
                  ),
                  title: Text(
                    'Present Continuous',
                    style: TextStyle(fontSize: 12 * textScale),
                  ),
                  subtitle: Text(
                    'Something here about present continuous',
                    style: TextStyle(fontSize: 12 * textScale),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  trailing: Text(
                    '${DateTime.now().day.toString()} th',
                    style: TextStyle(fontSize: 12 * textScale),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
