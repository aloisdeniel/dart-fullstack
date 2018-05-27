import 'dart:async';
import 'package:api_client/api.dart';
import 'package:api_messages/api_messages.dart';
import 'package:rxdart/subjects.dart';

class TaskListBloc {

  final Api api = new Api("http://localhost:8081");

  TaskListBloc() {

    _refresh.stream.listen((_) async {
      var all = await api.tasks.all();
      _tasks.add(all.tasks);
    });

    _toggle.stream.listen((task) async {
      var index = _tasks.value.indexOf(task);
      await api.tasks.toggle(index);
      refresh.add(null);
    });

    _add.stream.listen((task) async {
      await api.tasks.add(task);
      refresh.add(null);
    });

    // initialize
    refresh.add(null);
  }

  // Properties

  final BehaviorSubject<List<Task>> _tasks = new BehaviorSubject<List<Task>>(seedValue: new List<Task>());

  // Commands

  final StreamController _refresh = new StreamController();

  final StreamController<Task> _toggle = new StreamController<Task>();

  final StreamController<Task> _add = new StreamController<Task>();

  Sink<Task> get toggle => _toggle.sink;

  Sink<Task> get add => _add.sink;

  Sink get refresh => _refresh.sink;

}