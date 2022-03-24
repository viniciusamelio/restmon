import 'domain_exception.dart';

class UnexpectedURLFormatException extends DomainException {
  UnexpectedURLFormatException({
    String message =
        "Given String does not follow the following format: https://example.com",
  }) : super(message: message);
}
