abstract class DomainException implements Exception {
  DomainException({
    required this.message,
    this.stackTracing,
  });
  num code = 1;
  final dynamic stackTracing;
  final String message;
}
