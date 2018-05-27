import '../api_server.dart';
import 'proto_controller.dart';
import 'package:api_messages/api_messages.dart';

class TaskController extends ProtoController {
  
  static final TaskList tasks = new TaskList()..tasks.add(new Task()..description = "test"..isToggled=true);

  @httpGet
  Future<Response> all() async => this.messageResponse(tasks);

  @httpPut
  Future<Response> toggle(@HTTPQuery("toggle") int index) async {
    var task = tasks.tasks.elementAt(index);
    task.isToggled = !task.isToggled;
    return new Response.ok(task.isToggled);
  }

  @httpPost
  Future<Response> add() async {
    var newTask = new Task();

    if(this.readBody(newTask)) {
      tasks.tasks.add(newTask);
      return new Response.ok(tasks.tasks.length - 1);
    }

    return new Response.notFound();
  }
}
