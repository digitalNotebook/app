import 'package:escola/models/aula.dart';
import 'package:escola/providers/aulas.dart';
import 'package:escola/widgets/class_list.dart';
import 'package:escola/widgets/class_tabs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../enums/filters_class.dart';

class ClassOverview extends StatefulWidget {
  @override
  _ClassOverviewState createState() => _ClassOverviewState();
}

class _ClassOverviewState extends State<ClassOverview> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _searchController = TextEditingController();
  var _isSearchPressed = false;
  late List<Aula> _aulas;
  List<Aula> _foundAulas = [];
  var _classFilter = Filters.UNDONE;
  var _isInit = true;
  late final _aulasData;

  @override
  void dispose() {
    _searchController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _aulasData = Provider.of<Aulas>(context, listen: false);
      _setFilterProvider();
      _foundAulas = _aulas;
    }
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
      print('FOUND CLASS: ${results.length}');
    }
    setState(() {
      _foundAulas = results;
    });
  }

  void _handleDoneButton() {
    setState(() {
      _classFilter = Filters.DONE;
      _setFilterProvider();
    });
  }

  void _handleUndoneButton() {
    setState(() {
      _classFilter = Filters.UNDONE;
      _setFilterProvider();
    });
  }

  void _handleFavoriteButton() {
    setState(() {
      _classFilter = Filters.FAVORITES;
      _setFilterProvider();
    });
  }

  void _setFilterProvider() {
    if (_classFilter == Filters.DONE)
      _aulas = _aulasData.doneClasses;
    else if (_classFilter == Filters.UNDONE)
      _aulas = _aulasData.undoneClasses;
    else
      _aulas = _aulasData.favoriteClasses;
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
          style: TextStyle(
            fontFamily: 'IndieFlower',
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isSearchPressed = !_isSearchPressed;
              });
            },
            icon: Icon(
              _isSearchPressed ? Icons.close : Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 2,
                  child: _isSearchPressed
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            key: _formKey,
                            child: TextField(
                              onChanged: (text) => _runFilter(text),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: 'Search',
                                border: OutlineInputBorder(),
                                suffixIcon: Icon(Icons.search),
                                hintText: 'Insert class name here',
                              ),
                            ),
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
                  child: ClassList(_foundAulas),
                ),
              ],
            )
          ],
          // child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.stretch,
          //   children: [
          //     SizedBox(
          //       height: deviceSize.height * 0.01,
          //     ),
          //     _isSearchPressed
          //         ? Form(
          //             key: _formKey,
          //             child: TextField(
          //               keyboardType: TextInputType.text,
          //               decoration: InputDecoration(
          //                 labelText: 'Search',
          //                 border: OutlineInputBorder(),
          //               ),
          //               controller: _searchController,
          //             ),
          //           )
          //         : SizedBox(),
          //     //BUTTONS
          //     _isSearchPressed
          //         ? SizedBox(
          //             height: 20,
          //           )
          //         : Expanded(
          //             flex: 2,
          //             child: ClassTabs(
          //               handleDoneButton: _handleDoneButton,
          //               handleUndoneButton: _handleUndoneButton,
          //               handleFavoriteButton: _handleFavoriteButton,
          //               status: _classFilter,
          //             ),
          //           ),
          //     //CONTAINER COM AS AULAS
          //     _isSearchPressed
          //         ? SingleChildScrollView(
          //             child: Container(
          //                 height: deviceSize.height * 0.6,
          //                 child: ClassList(_classFilter)),
          //           )
          //         : Expanded(
          //             flex: 8,
          //             child: ClassList(_classFilter),
          //           ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
