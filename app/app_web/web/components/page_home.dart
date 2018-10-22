import 'package:api/api.dart';
import 'package:app_shared/tasks_bloc.dart';
import 'package:react/react.dart';

import '../base/stream_builder.dart';
import 'task_input.dart';
import 'task_tile.dart';

class HomePage extends Component {

  HomePage(this.bloc);

  TasksBloc bloc;

  dynamic body() {
    return StreamBuilder<List<Task>>(
            stream: this.bloc.items,
            builder: (snapshot) {
              
              if (snapshot.data == null || snapshot.data.isEmpty) {
                return div({}, 'Empty');
              }

              return ul({}, snapshot.data
                      .map((item) => TaskTile(item))
                      .toList());
            });
  }

  render() => div({}, [
    TaskInput(this.bloc),
    body(),
  ]);
}