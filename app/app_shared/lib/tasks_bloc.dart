import 'dart:async';
import 'package:api_client/api.dart';
import 'package:api_messages/api_messages.dart';
import 'package:rxdart/subjects.dart';

class TasksBloc {

  final Api api = new Api("http://localhost:8081");

  TasksBloc() {

    _refresh.stream.listen((_) async {
      print("refresh");
      var all = await api.tasks.all();
      print("received:" + all.tasks.length.toString());
      _items.add(all.tasks);
    });

    _toggle.stream.listen((task) async {
      print("toggle");
      var index = _items.value.indexOf(task);
      await api.tasks.toggle(index);
      refresh.add(null);
    });

    _add.stream.listen((task) async {
      print("add: " + task.description);
      await api.tasks.add(task);
      refresh.add(null);
    });

    // initialize
    refresh.add(null);
  }

  // Properties

  final BehaviorSubject<List<Task>> _items = new BehaviorSubject<List<Task>>(seedValue: new List<Task>());

  Stream get items => _items.stream;

  // Commands

  final _refresh = new StreamController();

  final _toggle = new StreamController<Task>();

  final  _add = new StreamController<Task>();

  Sink<Task> get toggle => _toggle.sink;

  Sink<Task> get add => _add.sink;

  Sink get refresh => _refresh.sink;

}