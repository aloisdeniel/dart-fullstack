import 'package:app_shared/tasks_bloc.dart';
import 'package:flutter/material.dart';
import 'package:api/api.dart';

class TaskInput extends StatelessWidget {

  TaskInput(this.bloc);

  final TasksBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: TextField(
        onSubmitted: (text) {
          this.bloc.add.add(new Task()..description = text);
        },
      ),
    );
  }
}