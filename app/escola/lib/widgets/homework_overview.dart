import 'package:escola/models/homework.dart';
import 'package:escola/models/subject.dart';
import 'package:escola/providers/homeworks.dart';
import 'package:escola/widgets/master_background.dart';
import 'package:escola/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/homework_list.dart';
import '../widgets/homework_tabs.dart';
import '../enums/filters_class.dart';

class HomeworkOverview extends StatefulWidget {
  const HomeworkOverview({Key? key}) : super(key: key);

  @override
  _HomeworkOverviewState createState() => _HomeworkOverviewState();
}

class _HomeworkOverviewState extends State<HomeworkOverview>
    with SingleTickerProviderStateMixin {
  //fazem parte do search
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _searchController = TextEditingController();
  var _isSearchPressed = false;
  late List<Homework> _homeworks;
  List<Homework> _foundHomeworks = [];
  //fazem parte da animação do search
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _opacityAnimation;

  var _showKeyboard = true;

  var _filter = Filters.UNDONE;

  var _isInit = true;

  //Provider
  late Homeworks _provider;

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
      _provider = Provider.of<Homeworks>(context, listen: false);
      _homeworks = _provider.getHomeworksWithThisFilter(_filter);
      _foundHomeworks = _homeworks;
      print('Homeworks: ${_foundHomeworks.length}');
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void _runFilter(String enteredKeyword) {
    List<Homework> results = [];
    if (enteredKeyword.isEmpty) {
      results = _homeworks;
    } else {
      results = _homeworks
          .where(
            (homework) => homework.title.toLowerCase().contains(
                  enteredKeyword.toLowerCase(),
                ),
          )
          .toList();
    }
    setState(() {
      _foundHomeworks = results;
    });
  }

  void _handleToDo() {
    _filter = Filters.UNDONE;
    getHomeworksWithThisFilter(_filter);
  }

  void _handleFavorites() {
    _filter = Filters.FAVORITES;
    getFavorites();
  }

  void _handleDone() {
    _filter = Filters.DONE;
    getHomeworksWithThisFilter(_filter);
  }

  void getHomeworksWithThisFilter(Filters filter) {
    _homeworks = _provider.getHomeworksWithThisFilter(filter);
    setState(() {
      _foundHomeworks = _homeworks;
    });
  }

  void getFavorites() {
    setState(() {
      _homeworks = _provider.favoriteClasses;
      _foundHomeworks = _homeworks;
    });
  }

  void _switchSearchButton() {
    setState(() {
      _isSearchPressed = !_isSearchPressed;
    });
    //starta a animação
    if (_isSearchPressed) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  void _onSubmitted() {
    _showKeyboard = false;
    _foundHomeworks = _homeworks;
  }

  void _resetIsSearchPressed() {
    if (_isSearchPressed) {
      setState(() {
        _isSearchPressed = false;
        _foundHomeworks = _homeworks;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Homeworks build');
    return Scaffold(
      //evita que o softkeyboard traga tudo para cima
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 45,
        title: Text(
          'Homeworks',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [
          IconButton(
            onPressed: _switchSearchButton,
            icon: Icon(
              _isSearchPressed ? Icons.close : Icons.search,
              color: Colors.white,
            ),
          )
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
                      padding: EdgeInsets.all(8),
                      child: SearchField(_formKey, _runFilter, _onSubmitted,
                          _slideAnimation, _opacityAnimation),
                    )
                  : HomeworkTabs(
                      _handleDone,
                      _handleFavorites,
                      _handleToDo,
                      _filter,
                    ),
            ),
            Expanded(
              flex: 10,
              child: HomeworkList(_foundHomeworks, _resetIsSearchPressed),
            ),
          ],
        ),
      ),
    );
  }
}
