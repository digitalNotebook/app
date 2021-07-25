import 'package:escola/screens/home-screen/home_screen.dart';
import 'package:flutter/material.dart';

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
        .pushReplacementNamed(MyHomePage.routeName, arguments: seed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Digital Notebook',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Enter a seed',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter with a seed';
                  }
                  if ('Leo' != value) {
                    return 'Seed doesn\'t match';
                  }
                  this.seed = value;
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
                  child: const Text('Submit'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
