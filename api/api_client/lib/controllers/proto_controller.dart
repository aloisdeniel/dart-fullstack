import 'package:http/http.dart' as http;
import 'package:protobuf/protobuf.dart';

abstract class ProtoController {

  ProtoController(this.root);

  final String root;

  T readBody<T extends GeneratedMessage>(http.Response response, T message) {
    var contentType = response.headers["Content-Type"];
    if(contentType.startsWith("application/json")) {
      message.mergeFromJson(response.body);
    }
    if(contentType.startsWith("application/octet-stream")) {
      message.mergeFromBuffer(response.bodyBytes);
    }
    return message;
  }

  dynamic writeBody(GeneratedMessage message, {bool asJson = false}) {
    if(asJson) {
      return message.writeToJsonMap();
    }
    return message.writeToBuffer();
  }

}