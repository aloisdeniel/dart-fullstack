
import 'package:api/generated/tasks.pb.dart';

import 'package:react/react.dart';

class TaskTile extends Component {

  TaskTile(this.model);

  final Task model;

  @override
  render() {
    return li({}, model.description);
  }

}