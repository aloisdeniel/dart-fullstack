///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes

import 'dart:async';
// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

class TaskAtIndex extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('TaskAtIndex')
    ..a<int>(1, 'index', PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  TaskAtIndex() : super();
  TaskAtIndex.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  TaskAtIndex.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  TaskAtIndex clone() => new TaskAtIndex()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static TaskAtIndex create() => new TaskAtIndex();
  static PbList<TaskAtIndex> createRepeated() => new PbList<TaskAtIndex>();
  static TaskAtIndex getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyTaskAtIndex();
    return _defaultInstance;
  }
  static TaskAtIndex _defaultInstance;
  static void $checkItem(TaskAtIndex v) {
    if (v is! TaskAtIndex) checkItemFailed(v, 'TaskAtIndex');
  }

  int get index => $_get(0, 0);
  set index(int v) { $_setSignedInt32(0, v); }
  bool hasIndex() => $_has(0);
  void clearIndex() => clearField(1);
}

class _ReadonlyTaskAtIndex extends TaskAtIndex with ReadonlyMessageMixin {}

class Empty extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('Empty')
    ..hasRequiredFields = false
  ;

  Empty() : super();
  Empty.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Empty.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Empty clone() => new Empty()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static Empty create() => new Empty();
  static PbList<Empty> createRepeated() => new PbList<Empty>();
  static Empty getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyEmpty();
    return _defaultInstance;
  }
  static Empty _defaultInstance;
  static void $checkItem(Empty v) {
    if (v is! Empty) checkItemFailed(v, 'Empty');
  }
}

class _ReadonlyEmpty extends Empty with ReadonlyMessageMixin {}

class Task extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('Task')
    ..aOB(1, 'isToggled')
    ..aOS(3, 'description')
    ..hasRequiredFields = false
  ;

  Task() : super();
  Task.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Task.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Task clone() => new Task()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static Task create() => new Task();
  static PbList<Task> createRepeated() => new PbList<Task>();
  static Task getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyTask();
    return _defaultInstance;
  }
  static Task _defaultInstance;
  static void $checkItem(Task v) {
    if (v is! Task) checkItemFailed(v, 'Task');
  }

  bool get isToggled => $_get(0, false);
  set isToggled(bool v) { $_setBool(0, v); }
  bool hasIsToggled() => $_has(0);
  void clearIsToggled() => clearField(1);

  String get description => $_getS(1, '');
  set description(String v) { $_setString(1, v); }
  bool hasDescription() => $_has(1);
  void clearDescription() => clearField(3);
}

class _ReadonlyTask extends Task with ReadonlyMessageMixin {}

class TaskList extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('TaskList')
    ..pp<Task>(1, 'tasks', PbFieldType.PM, Task.$checkItem, Task.create)
    ..hasRequiredFields = false
  ;

  TaskList() : super();
  TaskList.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  TaskList.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  TaskList clone() => new TaskList()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static TaskList create() => new TaskList();
  static PbList<TaskList> createRepeated() => new PbList<TaskList>();
  static TaskList getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyTaskList();
    return _defaultInstance;
  }
  static TaskList _defaultInstance;
  static void $checkItem(TaskList v) {
    if (v is! TaskList) checkItemFailed(v, 'TaskList');
  }

  List<Task> get tasks => $_getList(0);
}

class _ReadonlyTaskList extends TaskList with ReadonlyMessageMixin {}

class TaskServiceApi {
  RpcClient _client;
  TaskServiceApi(this._client);

  Future<TaskAtIndex> add(ClientContext ctx, Task request) {
    var emptyResponse = new TaskAtIndex();
    return _client.invoke<TaskAtIndex>(ctx, 'TaskService', 'add', request, emptyResponse);
  }
  Future<Task> toggle(ClientContext ctx, TaskAtIndex request) {
    var emptyResponse = new Task();
    return _client.invoke<Task>(ctx, 'TaskService', 'toggle', request, emptyResponse);
  }
  Future<TaskList> all(ClientContext ctx, Empty request) {
    var emptyResponse = new TaskList();
    return _client.invoke<TaskList>(ctx, 'TaskService', 'all', request, emptyResponse);
  }
}

