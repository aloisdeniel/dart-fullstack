import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:api/api.dart';
import 'package:grpc/grpc.dart';
import 'package:api/generated/tasks.pb.dart';

class TaskService extends TaskServiceBase {

  static final TaskList initalTasks = new TaskList()..tasks.add(new Task()..description = "test"..isToggled=true);

  final BehaviorSubject<TaskList> _tasksSubject = BehaviorSubject<TaskList>(seedValue: initalTasks);

  void _updateList(Function(TaskList) updateList) {
    var newList = _tasksSubject.value.copyWith(updateList);
    _tasksSubject.add(newList);
  }
 
  @override
  Future<TaskAtIndex> add(ServiceCall ctx, Task request) async {
    this._updateList((value) => value.tasks.add(request));
    return new TaskAtIndex()..index = _tasksSubject.value.tasks.length - 1;
  }

  @override
  Stream<TaskList> all(ServiceCall ctx, Empty request) {
    return _tasksSubject.stream;
  }

  @override
  Future<Task> toggle(ServiceCall ctx, TaskAtIndex request) async {
    var newTask = _tasksSubject.value.tasks.elementAt(request.index).copyWith((value) => value.isToggled = !value.isToggled);
    this._updateList((value) => value.tasks.replaceRange(request.index, request.index + 1, [newTask]));
    return newTask;
  }
}