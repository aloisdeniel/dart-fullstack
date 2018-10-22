import 'package:app_mobile/ioc.dart';
import 'package:app_shared/tasks_bloc.dart';
import 'package:flutter/material.dart';
import 'package:api/api.dart';
import 'widgets.dart';

class HomePage extends StatelessWidget {

  Widget body(TasksBloc bloc, BuildContext context) {
    return StreamBuilder<List<Task>>(
            stream: bloc.items,
            builder: (context, snapshot) {
              
              if (snapshot.data == null || snapshot.data.isEmpty) {
                return Center(
                    child: Text('Empty',
                        style: Theme.of(context).textTheme.display1));
              }

              return ListView(
                  children: snapshot.data
                      .map((item) => TaskTile(bloc, item))
                      .toList());
            });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Ioc.of(context);
    final bloc = provider.blocs.tasks();
    
    return Column(children: <Widget>[
      new TaskInput(bloc),
      new Expanded(child: body(bloc, context)),
    ]);
  }

}

