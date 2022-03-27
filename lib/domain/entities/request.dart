import 'package:restmon/core/enums.dart';
import 'package:restmon/core/types.dart';

class Request {
  Request(
    this.url, {
    this.queryParameters,
    this.data,
    this.headers,
    this.method = HttpMethod.get,
  });
  String url;
  JsonMap? queryParameters;
  JsonMap? data;
  JsonMap? headers;
  HttpMethod? method;
}
