// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Horizontal Reorderable Scrolling List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List array = [4, 2, 5, 1, 3, 8, 9, 6, 7];

  void _update(old, ew) {
    setState(() {
      var el = array[old];
      if (old < ew) {
        ew = ew - 1;
      }
      array.removeAt(old);
      array.insert(ew, el);
      print(array);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Prueba"),
        ),
        body: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 250,
          ),
          child: ReorderableListView(
            padding: EdgeInsets.only(bottom: 100),
            scrollDirection: Axis.horizontal,
            children: [
              for (final item in array)
                Container(
                  key: ValueKey(item),
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 4,
                        ),
                      ]),
                  child: Center(
                    child: Text('Page $item'),
                  ),
                ),
            ],
            onReorder: _update,
          ),
        ));
  }
}
