import 'package:flutter/material.dart';
import 'widgets/widgets.dart';
import 'ioc.dart';


void main() => runApp(new TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return Ioc(
          child: MaterialApp(
            home: Scaffold(
              appBar: AppBar(title: Text('Tasks'),),
              body: HomePage()
            ),
          ),
    );
  }
}
