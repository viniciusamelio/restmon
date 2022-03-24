import 'package:fpdart/fpdart.dart';
import 'package:restmon/domain/entities/entities.dart';
import 'package:restmon/domain/entities/request.dart';

abstract class HttpRepository {
  Future<Either<Exception, Response>> get(Request request);
}
