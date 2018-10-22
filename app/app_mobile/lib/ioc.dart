import 'package:api/generated/tasks.pbgrpc.dart';
import 'package:flutter/widgets.dart';
import 'package:app_shared/blocs.dart';
import 'package:grpc/grpc.dart';

class Ioc extends InheritedWidget {
  Blocs blocs;
  TaskServiceClient _client;

  Ioc({
    Key key, Widget child,
  }) : super(key: key, child: child)
  {
    final channel = ClientChannel('localhost',
      port: 50051,
      options: ChannelOptions(credentials: ChannelCredentials.insecure())
    );

    _client = TaskServiceClient(channel);

    this.blocs = Blocs(_client);
  }

  TaskServiceClient client() => _client;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static Ioc of(BuildContext context) => (context.inheritFromWidgetOfExactType(Ioc) as Ioc);
}