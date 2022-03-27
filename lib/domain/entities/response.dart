import './request.dart';
import '../../core/types.dart';

class Response {
  Response({
    required this.status,
    required this.response,
    this.headers,
    required this.request,
  });

  int status;
  JsonMap response;
  JsonMap? headers;
  Request request;
}
