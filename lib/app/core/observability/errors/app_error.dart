class AppError {
  final String code;
  final String message;
  final String category;
  final bool isBlocking;
  final bool canRetry;

  const AppError({
    required this.code,
    required this.message,
    required this.category,
    required this.isBlocking,
    required this.canRetry,
  });
}