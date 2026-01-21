import 'package:demo_mix_panel/app/core/observability/errors/app_error.dart';
import 'package:demo_mix_panel/app/core/observability/errors/error_reporter.dart';

class ExampleErrorReporter implements ErrorReporter {
  @override
  void report(AppError error, {Map<String, dynamic>? context}) {}
}