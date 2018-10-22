import 'dart:html';

import 'package:app_shared/tasks_bloc.dart';
import 'package:react/react_client.dart' as react_client;
import 'package:react/react.dart';
import 'package:react/react_dom.dart' as react_dom;

import 'components/page_home.dart';

main() {
  react_client.setClientConfiguration();
  var component = HomePage(TasksBloc());
  react_dom.render(component, querySelector('#react_mount_point'));
}