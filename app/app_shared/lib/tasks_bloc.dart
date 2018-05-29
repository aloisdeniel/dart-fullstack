import 'dart:async';
import 'package:api/api.dart';
import 'package:rxdart/subjects.dart';
import 'package:grpc/grpc.dart';

class TasksBloc {

  TaskServiceClient api; // TODO inject

  TasksBloc() {

    final channel = new ClientChannel('localhost',
      port: 50051,
      options: const ChannelOptions(credentials: const ChannelCredentials.insecure())
    );

    api = new TaskServiceClient(channel);

    _refresh.stream.listen((_) async {
      print("refresh");
      var all = await api.all(Empty.getDefault());
      print("received:" + all.tasks.length.toString());
      _items.add(all.tasks);
    });

    _toggle.stream.listen((task) async {
      print("toggle");
      var index = _items.value.indexOf(task);
      await api.toggle(new TaskAtIndex()..index = index);
      refresh.add(null);
    });

    _add.stream.listen((task) async {
      print("add: " + task.description);
      await api.add(task);
      refresh.add(null);
    });

    // initialize
    refresh.add(null);
  }

  // Properties

  final BehaviorSubject<List<Task>> _items = new BehaviorSubject<List<Task>>(seedValue: new List<Task>());

  Stream<List<Task>> get items => _items.stream;

  // Commands

  final _refresh = new StreamController();

  final _toggle = new StreamController<Task>();

  final  _add = new StreamController<Task>();

  Sink<Task> get toggle => _toggle.sink;

  Sink<Task> get add => _add.sink;

  Sink get refresh => _refresh.sink;

}