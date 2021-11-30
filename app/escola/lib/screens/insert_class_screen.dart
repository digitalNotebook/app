import 'package:escola/models/aula.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class InsertClassScreen extends StatefulWidget {
  const InsertClassScreen({Key? key}) : super(key: key);
  static const pageName = '/insert-class';

  @override
  _InsertClassScreenState createState() => _InsertClassScreenState();
}

class _InsertClassScreenState extends State<InsertClassScreen> {
  //key do Form
  final _form = GlobalKey<FormState>();

  final _subtitleFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _horaInicioController = TextEditingController();
  final _horaFimController = TextEditingController();
  final _imageUrlController = TextEditingController();

  late final DateTime _dataSelecionada;
  var _isInit = true;

  @override
  void dispose() {
    _subtitleFocusNode.dispose();
    _imageUrlFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _horaInicioController.dispose();
    _horaFimController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _dataSelecionada = ModalRoute.of(context)!.settings.arguments as DateTime;
    }
    super.didChangeDependencies();
  }

  // ignore: unused_field
  var _aula = Aula(
    id: '',
    title: '',
    subtitle: '',
    imagesUrl: '',
    dataAula: DateTime.now(),
    description: '',
    videoUrl: '',
    status: Status.UNDONE,
    horaInicio: DateTime.now(),
    horaFim: DateTime.now(),
  );

  Future<String> _setHour() async {
    var horaInicio = '';
    var timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (timeOfDay != null) {
      horaInicio = timeOfDay.format(context);
    }
    return horaInicio;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.save),
          )
        ],
        title: Text(
          'New Class',
          style: TextStyle(fontFamily: 'IndieFlower'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _form,
          //para ter scroll
          child: ListView(
            children: [
              TextFormField(
                initialValue: DateFormat.MMMMEEEEd().format(_dataSelecionada),
                decoration: InputDecoration(labelText: 'Date'),
                enabled: false,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Title', hintText: 'Insert class title here'),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_subtitleFocusNode);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Title required';
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Subtitle'),
                keyboardType: TextInputType.text,
                focusNode: _subtitleFocusNode,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_imageUrlFocusNode);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Subtitle required';
                  }
                },
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      constraints: BoxConstraints(minHeight: 70),
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                      child: _imageUrlController.text.isEmpty
                          ? Text('Preview image')
                          : Image.network(_imageUrlController.text),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Image URL'),
                      keyboardType: TextInputType.text,
                      controller: _imageUrlController,
                      focusNode: _imageUrlFocusNode,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(_descriptionFocusNode);
                      },
                    ),
                  ),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                keyboardType: TextInputType.text,
                focusNode: _descriptionFocusNode,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(labelText: 'Hora Inicio'),
                      onTap: () async {
                        var horaInicio = await _setHour();
                        _horaInicioController.text = horaInicio;
                      },
                      controller: _horaInicioController,
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Hora Fim'),
                      readOnly: true,
                      controller: _horaFimController,
                      onTap: () async {
                        var horaFinal = await _setHour();
                        _horaFimController.text = horaFinal;
                      },
                    ),
                  ),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Video URL'),
                keyboardType: TextInputType.text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
