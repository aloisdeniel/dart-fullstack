import 'dart:async';
import 'proto_controller.dart';
import 'package:http/http.dart' as http;
import 'package:api_messages/api_messages.dart';

class TaskController extends ProtoController {

  TaskController(String root) : super(root);

  Future<TaskList> all() async {
    var response = await http.get(root, headers: { 'Accept': 'application/octet-stream' });
    return readBody<TaskList>(response, new TaskList());
  }

  Future<bool> toggle(int index) async {
    var response = await http.put(root + "?toggle=$index");
    return response.body == "true";
  }

  Future<int> add(Task task) async {
    var response = await http.post(root, body: writeBody(task), headers: {'content-type': 'application/octet-stream'});
    print("r:"+response.body);
    return int.parse(response.body);
  }
}