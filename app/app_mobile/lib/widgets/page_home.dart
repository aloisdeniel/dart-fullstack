import 'package:flutter/material.dart';
import 'package:api/api.dart';
import '../tasks_provider.dart';
import 'widgets.dart';

class HomePage extends StatelessWidget {

  Widget body(BuildContext context) {
    final provider = TasksProvider.of(context);
    return StreamBuilder<List<Task>>(
            stream: provider.items,
            builder: (context, snapshot) {
              
              if (snapshot.data == null || snapshot.data.isEmpty) {
                return Center(
                    child: Text('Empty',
                        style: Theme.of(context).textTheme.display1));
              }

              return ListView(
                  children: snapshot.data
                      .map((item) => TaskTile(item))
                      .toList());
            });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      new TaskInput(),
      new Expanded(child: body(context)),
    ]);
  }

}

