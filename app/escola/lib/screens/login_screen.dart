import 'package:flutter/material.dart';

import 'bottom_tabs_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final seedController = TextEditingController();
  late String seed;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void successSubmit(BuildContext ctx) {
    Navigator.of(ctx)
        .pushReplacementNamed(TabsScreen.pageName, arguments: seed);
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 60,
        title: Text(
          'Digital Notebook',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            height: deviceSize.height,
            width: deviceSize.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(100, 215, 100, 1).withOpacity(0.5),
                  Color.fromRGBO(100, 255, 255, 1).withOpacity(0.9),
                ],
              ),
            ),
          ),
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 20,
              child: Container(
                alignment: Alignment.center,
                height: deviceSize.height * 0.5,
                width: deviceSize.width,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Seed:',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Insert your seed',
                              border: OutlineInputBorder(),
                            ),
                            validator: (String? value) {
                              var textoInserido = value!.trim();
                              print(textoInserido);
                              if (textoInserido.isEmpty) {
                                return 'Please enter with a seed';
                              }
                              if ('Leo' != textoInserido) {
                                return 'Seed doesn\'t match';
                              }
                              this.seed = textoInserido;
                              return null;
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  successSubmit(context);
                                }
                              },
                              child: const Text(
                                'Login',
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
