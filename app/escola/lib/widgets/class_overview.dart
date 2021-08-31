import 'package:escola/widgets/class_list.dart';
import 'package:escola/widgets/class_tabs.dart';
import 'package:flutter/material.dart';

import '../enums/filters_class.dart';

class ClassOverview extends StatefulWidget {
  @override
  _ClassOverviewState createState() => _ClassOverviewState();
}

class _ClassOverviewState extends State<ClassOverview> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _searchController = TextEditingController();
  var _isSearchPressed = false;

  var _classFilter = Filters.UNDONE;

  void _handleDoneButton() {
    setState(() {
      _classFilter = Filters.DONE;
    });
  }

  void _handleUndoneButton() {
    setState(() {
      _classFilter = Filters.UNDONE;
    });
  }

  void _handleFavoriteButton() {
    setState(() {
      _classFilter = Filters.FAVORITES;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Buildei a ClassesOverview');
    var deviceSize = MediaQuery.of(context).size;

    return Scaffold(
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
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
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
              children: [
                _isSearchPressed
                    ? SizedBox(
                        height: deviceSize.height * 0.05,
                      )
                    : SizedBox(),
                _isSearchPressed
                    ? Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            key: _formKey,
                            child: TextField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: 'Search',
                                border: OutlineInputBorder(),
                              ),
                              controller: _searchController,
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
                _isSearchPressed
                    ? SizedBox()
                    : Expanded(
                        flex: 2,
                        child: ClassTabs(
                          handleDoneButton: _handleDoneButton,
                          handleUndoneButton: _handleUndoneButton,
                          handleFavoriteButton: _handleFavoriteButton,
                          status: _classFilter,
                        ),
                      ),
                Expanded(
                  flex: _isSearchPressed ? 4 : 10,
                  child: ClassList(_classFilter),
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
