
import 'package:app_shared/tasks_bloc.dart';

import 'package:react/react.dart';

class TaskInput extends Component {

  TaskInput(this.bloc);

  final TasksBloc bloc;

  @override
  render() {
    return input();
  }
}