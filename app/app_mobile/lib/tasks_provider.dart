import 'package:flutter/widgets.dart';
import 'package:app_shared/tasks_bloc.dart';

class TasksProvider extends InheritedWidget {
  final TasksBloc tasksBloc;

  TasksProvider({
    Key key,
    TasksBloc tasksBloc,
    Widget child,
  })  : tasksBloc = tasksBloc ?? TasksBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static TasksBloc of(BuildContext context) => (context.inheritFromWidgetOfExactType(TasksProvider) as TasksProvider).tasksBloc;
}