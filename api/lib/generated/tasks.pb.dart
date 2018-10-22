///
//  Generated code. Do not modify.
//  source: tasks.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart' as $pb;

class TaskAtIndex extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('TaskAtIndex')
    ..a<int>(1, 'index', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  TaskAtIndex() : super();
  TaskAtIndex.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  TaskAtIndex.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  TaskAtIndex clone() => new TaskAtIndex()..mergeFromMessage(this);
  TaskAtIndex copyWith(void Function(TaskAtIndex) updates) => super.copyWith((message) => updates(message as TaskAtIndex));
  $pb.BuilderInfo get info_ => _i;
  static TaskAtIndex create() => new TaskAtIndex();
  static $pb.PbList<TaskAtIndex> createRepeated() => new $pb.PbList<TaskAtIndex>();
  static TaskAtIndex getDefault() => _defaultInstance ??= create()..freeze();
  static TaskAtIndex _defaultInstance;
  static void $checkItem(TaskAtIndex v) {
    if (v is! TaskAtIndex) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  int get index => $_get(0, 0);
  set index(int v) { $_setSignedInt32(0, v); }
  bool hasIndex() => $_has(0);
  void clearIndex() => clearField(1);
}

class Empty extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Empty')
    ..hasRequiredFields = false
  ;

  Empty() : super();
  Empty.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Empty.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Empty clone() => new Empty()..mergeFromMessage(this);
  Empty copyWith(void Function(Empty) updates) => super.copyWith((message) => updates(message as Empty));
  $pb.BuilderInfo get info_ => _i;
  static Empty create() => new Empty();
  static $pb.PbList<Empty> createRepeated() => new $pb.PbList<Empty>();
  static Empty getDefault() => _defaultInstance ??= create()..freeze();
  static Empty _defaultInstance;
  static void $checkItem(Empty v) {
    if (v is! Empty) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }
}

class Task extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Task')
    ..aOB(1, 'isToggled')
    ..aOS(3, 'description')
    ..hasRequiredFields = false
  ;

  Task() : super();
  Task.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Task.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Task clone() => new Task()..mergeFromMessage(this);
  Task copyWith(void Function(Task) updates) => super.copyWith((message) => updates(message as Task));
  $pb.BuilderInfo get info_ => _i;
  static Task create() => new Task();
  static $pb.PbList<Task> createRepeated() => new $pb.PbList<Task>();
  static Task getDefault() => _defaultInstance ??= create()..freeze();
  static Task _defaultInstance;
  static void $checkItem(Task v) {
    if (v is! Task) $pb.checkItemFailed(v, _i.qualifiedMessageName);
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

class TaskList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('TaskList')
    ..pp<Task>(1, 'tasks', $pb.PbFieldType.PM, Task.$checkItem, Task.create)
    ..hasRequiredFields = false
  ;

  TaskList() : super();
  TaskList.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  TaskList.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  TaskList clone() => new TaskList()..mergeFromMessage(this);
  TaskList copyWith(void Function(TaskList) updates) => super.copyWith((message) => updates(message as TaskList));
  $pb.BuilderInfo get info_ => _i;
  static TaskList create() => new TaskList();
  static $pb.PbList<TaskList> createRepeated() => new $pb.PbList<TaskList>();
  static TaskList getDefault() => _defaultInstance ??= create()..freeze();
  static TaskList _defaultInstance;
  static void $checkItem(TaskList v) {
    if (v is! TaskList) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  List<Task> get tasks => $_getList(0);
}

