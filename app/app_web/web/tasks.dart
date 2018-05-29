import 'package:api/api.dart';
import 'package:angular/angular.dart';
import 'package:app_shared/tasks_bloc.dart';

@Directive(
	selector: '[tasks-controller]',
	exportAs: 'tasks'
)
class TasksController {
  final TasksBloc bloc = new TasksBloc(); // Should be injected
	Task newItem = new Task();
  List<Task> items= new List<Task>();

	TasksController() {
    bloc.items.listen((newItems) {
        items.clear();
        items.addAll(newItems);
    });
  }

	void add() => this.bloc.add.add(newItem.clone());

}