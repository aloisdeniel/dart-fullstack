import 'package:flutter/material.dart';
import 'package:api_messages/api_messages.dart';
import '../tasks_provider.dart';

class TaskTile extends StatelessWidget {

  TaskTile(this.model);

  final Task model;

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: new Checkbox(
        value: this.model.isToggled,
        onChanged: (v) {
          final tasks = TasksProvider.of(context);
          tasks.toggle.add(this.model);
        }),
       title: new Text(this.model.description),
    );
  }
}