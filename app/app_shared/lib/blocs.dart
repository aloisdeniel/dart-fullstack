
import 'package:api/generated/tasks.pbgrpc.dart';
import 'package:app_shared/tasks_bloc.dart';

class Blocs {

  TasksBloc _tasks;

  Blocs(TaskServiceClient client) {
    this._tasks = TasksBloc(client);
  }

  TasksBloc tasks() => _tasks;
}