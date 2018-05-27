///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

class Task extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('Task')
    ..a<bool>(1, 'isToggled', PbFieldType.QB)
    ..aQS(3, 'description')
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

