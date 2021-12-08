import 'package:escola/models/aula.dart';
import 'package:escola/providers/aulas.dart';
import 'package:escola/widgets/class_list.dart';
import 'package:escola/widgets/class_tabs.dart';
import 'package:escola/widgets/master_background.dart';
import 'package:escola/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../enums/filters_class.dart';

class ClassOverview extends StatefulWidget {
  @override
  _ClassOverviewState createState() => _ClassOverviewState();
}

class _ClassOverviewState extends State<ClassOverview>
    with SingleTickerProviderStateMixin {
  //fazem parte do search
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _searchController = TextEditingController();
  var _isSearchPressed = false;
  late List<Aula> _aulas;
  List<Aula> _foundAulas = [];
  //fazem parte da animação do search
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _opacityAnimation;

  var _showKeyboard = true;

  //Buttons
  var _classFilter = Filters.UNDONE;

  var _isInit = true;

  //Provider
  late final Aulas _aulasData;

  @override
  void dispose() {
    _searchController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset(1.5, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticIn,
      ),
    );
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      //carrega as aulas
      _aulasData = Provider.of<Aulas>(context, listen: false);
      _setFilterProvider();
      _foundAulas = _aulas;
      print('Aulas: ${_foundAulas.length}');
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void _runFilter(String enteredKeyword) {
    List<Aula> results = [];
    if (enteredKeyword.isEmpty) {
      results = _aulas;
    } else {
      results = _aulas
          .where(
            (aula) => aula.title.toLowerCase().contains(
                  enteredKeyword.toLowerCase(),
                ),
          )
          .toList();
    }
    setState(() {
      _foundAulas = results;
    });
  }

  void _handleDoneButton() {
    _classFilter = Filters.DONE;
    _setFilterProvider();
  }

  void _handleUndoneButton() {
    _classFilter = Filters.UNDONE;
    _setFilterProvider();
  }

  void _handleFavoriteButton() {
    _classFilter = Filters.FAVORITES;
    _setFilterProvider();
  }

  void _setFilterProvider() {
    if (_classFilter == Filters.DONE)
      _aulas = _aulasData.doneClasses;
    else if (_classFilter == Filters.UNDONE)
      _aulas = _aulasData.undoneClasses;
    else
      _aulas = _aulasData.favoriteClasses;
    setState(() {
      _foundAulas = _aulas;
    });

    print('Aulas: ${_aulas.length}');
  }

  void _switchSearchButton() {
    setState(() {
      _isSearchPressed = !_isSearchPressed;
    });
    if (_isSearchPressed) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  void _resetIsSearchPressed() {
    if (_isSearchPressed) {
      setState(() {
        _isSearchPressed = false;
        _foundAulas = _aulas;
      });
    }
  }

  void _onSubmitted() {
    _showKeyboard = false;
    _foundAulas = _aulas;
  }

  @override
  Widget build(BuildContext context) {
    print('Buildei a ClassesOverview');
    return Scaffold(
      //evita que o softkeyboard traga tudo para cima
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 45,
        title: Text(
          'Classes',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [
          IconButton(
            onPressed: _switchSearchButton,
            icon: Icon(
              _isSearchPressed ? Icons.close : Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: MasterBackground(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 2,
              child: _isSearchPressed
                  ? Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SearchField(
                        _formKey,
                        _runFilter,
                        _onSubmitted,
                        _slideAnimation,
                        _opacityAnimation,
                      ),
                    )
                  : ClassTabs(
                      handleDoneButton: _handleDoneButton,
                      handleUndoneButton: _handleUndoneButton,
                      handleFavoriteButton: _handleFavoriteButton,
                      status: _classFilter,
                    ),
            ),
            Expanded(
              flex: 10,
              child: ClassList(_foundAulas, _resetIsSearchPressed),
            ),
          ],
        ),
      ),
    );
  }
}
