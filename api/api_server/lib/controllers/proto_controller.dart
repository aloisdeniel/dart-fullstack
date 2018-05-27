import '../api_server.dart';
import 'package:protobuf/protobuf.dart';

abstract class ProtoController extends HTTPController {

  ProtoController() {
      acceptedContentTypes = [ContentType.JSON, ContentType.BINARY];
  }

  Response messageResponse(GeneratedMessage message) {
    if(request.acceptableContentTypes.any((x) =>  x.mimeType == ContentType.BINARY.mimeType)) {
      return new Response.ok(message.writeToBuffer())
            ..contentType = ContentType.BINARY;
    }

    if(request.acceptableContentTypes.any((x) =>  x.mimeType == ContentType.JSON.mimeType)) {
      return new Response.ok(message.writeToJsonMap())
            ..contentType = ContentType.JSON;
    }

    return new Response.notFound();
  }

  bool readBody(GeneratedMessage message) {
    if(request.body.contentType.mimeType == ContentType.BINARY.mimeType) {
      message.mergeFromBuffer(request.body.asBytes());
      return true;
    }
    else if(request.body.contentType.mimeType == ContentType.JSON.mimeType) {
      message.mergeFromJsonMap(request.body.asMap());
      return true;
    }
    return false;
  }
}
