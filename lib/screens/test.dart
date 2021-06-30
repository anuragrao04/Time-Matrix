import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:time_app/helpers/DB_funcs.dart';
import 'package:time_app/helpers/help_functions.dart';

import '../helpers/database_helper.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

_query() async {
  // get a reference to the database
  DatabaseHelper helper = await DatabaseHelper.instance;
  Database db = await helper.database;

  //await db.delete("my_table");
  // raw query
  //List<Map> result = await db.rawQuery("PRAGMA table_info([my_table]);");
  List<Map> result = await db.rawQuery("SELECT * FROM my_table");

  // print the results
  result.forEach((row) => print(row['date']));
  // {_id: 2, name: Mary, age: 32}
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Row(
          children: [
            ElevatedButton(
              child: Text('Read'),
              onPressed: () async {
                //DatabaseHelper dbHelper = await DatabaseHelper.instance;
                await _query();
              },
            )
          ],
        ),
      ),
    );
  }
}