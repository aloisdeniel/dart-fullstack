import 'package:http/http.dart' as http;
import 'package:protobuf/protobuf.dart';

abstract class ProtoController {

  ProtoController(this.root);

  final String root;

  T readBody<T extends GeneratedMessage>(http.Response response, T message) {
    var contentType = response.headers["content-type"];
    if(contentType != null){
      if(contentType.startsWith("application/json")) {
        message.mergeFromJson(response.body);
        return message;
      }
      if(contentType.startsWith("application/octet-stream")) {
        message.mergeFromBuffer(response.bodyBytes);
        return message;
      }
    }

    throw new Error(); //"Failed to read body (bad content type)"
  }

  dynamic writeBody(GeneratedMessage message, {bool asJson = false}) {
    if(asJson) {
      return message.writeToJsonMap();
    }
    return message.writeToBuffer();
  }
}