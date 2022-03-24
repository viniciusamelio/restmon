import 'package:flutter_test/flutter_test.dart';

import 'package:fpdart/fpdart.dart';
import 'package:string_validator/string_validator.dart';
import 'package:mocktail/mocktail.dart';

import 'package:restmon/domain/exceptions/exceptions.dart';
import 'package:restmon/domain/entities/entities.dart';
import 'package:restmon/domain/entities/request.dart';
import 'package:restmon/domain/protocols/http_repository.dart';

abstract class GetUsecase {
  GetUsecase({required HttpRepository httpRepository})
      : _httpRepository = httpRepository;

  // ignore: unused_field
  final HttpRepository _httpRepository;

  Future<Either<Exception, Response>> call(Request request);
}

class Get implements GetUsecase {
  Get({
    required HttpRepository httpRepository,
  }) : _httpRepository = httpRepository;

  @override
  final HttpRepository _httpRepository;

  @override
  Future<Either<Exception, Response>> call(Request request) async {
    if (!isURL(request.url, {
      "require_protocol": true,
    })) {
      return left(UnexpectedURLFormatException());
    }
    final response = await _httpRepository.get(request);
    return response.fold(
      (exception) => Left(exception),
      (data) => Right(data),
    );
  }
}

class MockedHttpRepository extends Mock implements HttpRepository {}

void main() {
  late final GetUsecase sut;
  late final HttpRepository httpRepository;
  setUpAll(() {
    httpRepository = MockedHttpRepository();
    sut = Get(
      httpRepository: httpRepository,
    );
  });

  test(
      "Should throw an UnexpectedURLFormatException when url given does not follow expected format",
      () async {
    final request = Request("mock.com");

    final response = await sut(request);

    expect(
      response.fold(
        (l) => l,
        (r) => r,
      ),
      isA<UnexpectedURLFormatException>(),
    );
  });
}
