class Failure {
  final String errorMessage;
  final StackTrace? stackTrace;

  Failure({
    required this.errorMessage,
    this.stackTrace,
  });
}