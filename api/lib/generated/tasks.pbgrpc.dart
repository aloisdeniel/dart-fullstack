///
//  Generated code. Do not modify.
//  source: tasks.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

import 'dart:async' as $async;

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
    final call = $createCall(_$add, new $async.Stream.fromIterable([request]),
        options: options);
    return new ResponseFuture(call);
  }

  ResponseFuture<Task> toggle(TaskAtIndex request, {CallOptions options}) {
    final call = $createCall(
        _$toggle, new $async.Stream.fromIterable([request]),
        options: options);
    return new ResponseFuture(call);
  }

  ResponseStream<TaskList> all(Empty request, {CallOptions options}) {
    final call = $createCall(_$all, new $async.Stream.fromIterable([request]),
        options: options);
    return new ResponseStream(call);
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
        true,
        (List<int> value) => new Empty.fromBuffer(value),
        (TaskList value) => value.writeToBuffer()));
  }

  $async.Future<TaskAtIndex> add_Pre(
      ServiceCall call, $async.Future request) async {
    return add(call, await request);
  }

  $async.Future<Task> toggle_Pre(
      ServiceCall call, $async.Future request) async {
    return toggle(call, await request);
  }

  $async.Stream<TaskList> all_Pre(
      ServiceCall call, $async.Future request) async* {
    yield* all(call, (await request) as Empty);
  }

  $async.Future<TaskAtIndex> add(ServiceCall call, Task request);
  $async.Future<Task> toggle(ServiceCall call, TaskAtIndex request);
  $async.Stream<TaskList> all(ServiceCall call, Empty request);
}
