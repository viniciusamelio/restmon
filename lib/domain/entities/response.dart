import '../../core/types.dart';

class Response {
  Response({
    required this.status,
    required this.response,
    this.headers,
  });

  int status;
  JsonMap response;
  JsonMap? headers;
}
