import 'package:flutter/widgets.dart';
import 'package:app_shared/tasks_bloc.dart';

class TasksProvider extends InheritedWidget {
  final TasksBloc cartBloc;

  TasksProvider({
    Key key,
    TasksBloc cartBloc,
    Widget child,
  })  : cartBloc = cartBloc ?? TasksBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static TasksBloc of(BuildContext context) => (context.inheritFromWidgetOfExactType(TasksProvider) as TasksProvider).cartBloc;
}