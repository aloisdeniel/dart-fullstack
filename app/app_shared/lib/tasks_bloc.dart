import 'dart:async';
import 'package:api/api.dart';
import 'package:rxdart/subjects.dart';
import 'package:grpc/grpc.dart';

class TasksBloc {

  TaskServiceClient api;

  TasksBloc(this.api) {

    _toggle.stream.listen((task) async {
      print("toggle");
      var index = _tasks.value.indexOf(task);
      await api.toggle(TaskAtIndex()..index = index);
    });

    _add.stream.listen((task) async {
      print("add: " + task.description);
      await api.add(task);
    });

    this._initialize();
  }

  Future _initialize() async {
    this._all = await api.all(Empty());
    this._all.listen((response) => _tasks.add(response.tasks));
  }

  ResponseStream<TaskList> _all;

  // Properties

  BehaviorSubject<List<Task>> _tasks = BehaviorSubject<List<Task>>(seedValue: []);

  Stream<List<Task>> get items => _tasks.stream;

  // Commands

  final _toggle = StreamController<Task>();

  final  _add = StreamController<Task>();

  Sink<Task> get toggle => _toggle.sink;

  Sink<Task> get add => _add.sink;

}