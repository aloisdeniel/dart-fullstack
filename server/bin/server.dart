import 'dart:async';
import 'package:grpc/grpc.dart';
import '../services/tasks.dart';

Future<Null> main(List<String> args) async {
  final Service tasks = new TaskService();
  final server = new Server([tasks]);
  await server.serve(port: 50051);
  print('Server listening on port ${server.port}...');
}