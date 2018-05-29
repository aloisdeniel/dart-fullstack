import 'dart:async';

import 'package:api_messages/api_client.dart';
import 'package:grpc/grpc.dart';
import 'package:api_messages/generated/tasks.pb.dart';

class TaskService extends TaskServiceBase {

  static final TaskList tasks = new TaskList()..tasks.add(new Task()..description = "test"..isToggled=true);

  @override
  Future<TaskAtIndex> add(ServiceCall ctx, Task request) async {
    tasks.tasks.add(request);
    return new TaskAtIndex()..index = tasks.tasks.length - 1;
  }

  @override
  Future<TaskList> all(ServiceCall ctx, Empty request) async {
    return tasks;
  }

  @override
  Future<Task> toggle(ServiceCall ctx, TaskAtIndex request) async {
    var task = tasks.tasks.elementAt(request.index);
    task.isToggled = !task.isToggled;
    return task;
  }
}