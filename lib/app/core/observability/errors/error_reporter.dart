import 'package:demo_mix_panel/app/core/observability/errors/app_error.dart';

abstract interface class ErrorReporter {
  void report(AppError error, {Map<String, dynamic>? context});
}