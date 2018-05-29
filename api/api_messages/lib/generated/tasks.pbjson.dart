///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes

const TaskAtIndex$json = const {
  '1': 'TaskAtIndex',
  '2': const [
    const {'1': 'index', '3': 1, '4': 1, '5': 5, '10': 'index'},
  ],
};

const Empty$json = const {
  '1': 'Empty',
};

const Task$json = const {
  '1': 'Task',
  '2': const [
    const {'1': 'isToggled', '3': 1, '4': 1, '5': 8, '10': 'isToggled'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
  ],
};

const TaskList$json = const {
  '1': 'TaskList',
  '2': const [
    const {'1': 'tasks', '3': 1, '4': 3, '5': 11, '6': '.Task', '10': 'tasks'},
  ],
};

const TaskService$json = const {
  '1': 'TaskService',
  '2': const [
    const {'1': 'add', '2': '.Task', '3': '.TaskAtIndex', '4': const {}},
    const {'1': 'toggle', '2': '.TaskAtIndex', '3': '.Task', '4': const {}},
    const {'1': 'all', '2': '.Empty', '3': '.TaskList', '4': const {}},
  ],
};

const TaskService$messageJson = const {
  '.Task': Task$json,
  '.TaskAtIndex': TaskAtIndex$json,
  '.Empty': Empty$json,
  '.TaskList': TaskList$json,
};

