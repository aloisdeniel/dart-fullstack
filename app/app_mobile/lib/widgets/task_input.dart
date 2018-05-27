import 'package:flutter/material.dart';
import 'package:api_messages/api_messages.dart';
import '../tasks_provider.dart';

class TaskInput extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
        child: TextField(
        onSubmitted: (text) {
          final tasks = TasksProvider.of(context);
          tasks.add.add(new Task()..description = text);
        },
      ),
    );
  }
}