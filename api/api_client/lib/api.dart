
import 'controllers/task_controller.dart';

export 'api.dart';

class Api {
  Api(this.host) : 
    tasks = new TaskController(host + "/tasks");

  final String host;
  final TaskController tasks;
}