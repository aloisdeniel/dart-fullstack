///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes

import 'dart:async';

import 'package:protobuf/protobuf.dart';

import 'tasks.pb.dart';
import 'tasks.pbjson.dart';

export 'tasks.pb.dart';

abstract class TaskServiceBase extends GeneratedService {
  Future<TaskAtIndex> add(ServerContext ctx, Task request);
  Future<Task> toggle(ServerContext ctx, TaskAtIndex request);
  Future<TaskList> all(ServerContext ctx, Empty request);

  GeneratedMessage createRequest(String method) {
    switch (method) {
      case 'add': return new Task();
      case 'toggle': return new TaskAtIndex();
      case 'all': return new Empty();
      default: throw new ArgumentError('Unknown method: $method');
    }
  }

  Future<GeneratedMessage> handleCall(ServerContext ctx, String method, GeneratedMessage request) {
    switch (method) {
      case 'add': return this.add(ctx, request);
      case 'toggle': return this.toggle(ctx, request);
      case 'all': return this.all(ctx, request);
      default: throw new ArgumentError('Unknown method: $method');
    }
  }

  Map<String, dynamic> get $json => TaskService$json;
  Map<String, Map<String, dynamic>> get $messageJson => TaskService$messageJson;
}

