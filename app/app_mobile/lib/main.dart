import 'package:flutter/material.dart';
import 'widgets/widgets.dart';
import 'tasks_provider.dart';


void main() => runApp(new TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return TasksProvider(
          child: MaterialApp(
            home: Scaffold(
              appBar: AppBar(title: Text('Tasks'),),
              body: HomePage()
            ),
          ),
    );
  }
}
