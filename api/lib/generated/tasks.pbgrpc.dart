///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes

import 'dart:async';

import 'package:grpc/grpc.dart';

import 'tasks.pb.dart';
export 'tasks.pb.dart';

class TaskServiceClient extends Client {
  static final _$add = new ClientMethod<Task, TaskAtIndex>(
      '/TaskService/add',
      (Task value) => value.writeToBuffer(),
      (List<int> value) => new TaskAtIndex.fromBuffer(value));
  static final _$toggle = new ClientMethod<TaskAtIndex, Task>(
      '/TaskService/toggle',
      (TaskAtIndex value) => value.writeToBuffer(),
      (List<int> value) => new Task.fromBuffer(value));
  static final _$all = new ClientMethod<Empty, TaskList>(
      '/TaskService/all',
      (Empty value) => value.writeToBuffer(),
      (List<int> value) => new TaskList.fromBuffer(value));

  TaskServiceClient(ClientChannel channel, {CallOptions options})
      : super(channel, options: options);

  ResponseFuture<TaskAtIndex> add(Task request, {CallOptions options}) {
    final call = $createCall(_$add, new Stream.fromIterable([request]),
        options: options);
    return new ResponseFuture(call);
  }

  ResponseFuture<Task> toggle(TaskAtIndex request, {CallOptions options}) {
    final call = $createCall(_$toggle, new Stream.fromIterable([request]),
        options: options);
    return new ResponseFuture(call);
  }

  ResponseFuture<TaskList> all(Empty request, {CallOptions options}) {
    final call = $createCall(_$all, new Stream.fromIterable([request]),
        options: options);
    return new ResponseFuture(call);
  }
}

abstract class TaskServiceBase extends Service {
  String get $name => 'TaskService';

  TaskServiceBase() {
    $addMethod(new ServiceMethod<Task, TaskAtIndex>(
        'add',
        add_Pre,
        false,
        false,
        (List<int> value) => new Task.fromBuffer(value),
        (TaskAtIndex value) => value.writeToBuffer()));
    $addMethod(new ServiceMethod<TaskAtIndex, Task>(
        'toggle',
        toggle_Pre,
        false,
        false,
        (List<int> value) => new TaskAtIndex.fromBuffer(value),
        (Task value) => value.writeToBuffer()));
    $addMethod(new ServiceMethod<Empty, TaskList>(
        'all',
        all_Pre,
        false,
        false,
        (List<int> value) => new Empty.fromBuffer(value),
        (TaskList value) => value.writeToBuffer()));
  }

  Future<TaskAtIndex> add_Pre(ServiceCall call, Future request) async {
    return add(call, await request);
  }

  Future<Task> toggle_Pre(ServiceCall call, Future request) async {
    return toggle(call, await request);
  }

  Future<TaskList> all_Pre(ServiceCall call, Future request) async {
    return all(call, await request);
  }

  Future<TaskAtIndex> add(ServiceCall call, Task request);
  Future<Task> toggle(ServiceCall call, TaskAtIndex request);
  Future<TaskList> all(ServiceCall call, Empty request);
}
