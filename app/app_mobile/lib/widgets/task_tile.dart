import 'package:app_shared/tasks_bloc.dart';
import 'package:flutter/material.dart';
import 'package:api/api.dart';

class TaskTile extends StatelessWidget {

  TaskTile(this.bloc,  this.model);

  final Task model;
  final TasksBloc bloc;

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: new Checkbox(
        value: this.model.isToggled,
        onChanged: (v) {
          this.bloc.toggle.add(this.model);
        }),
       title: new Text(this.model.description),
    );
  }
}