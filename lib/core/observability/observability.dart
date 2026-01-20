import 'package:demo_mix_panel/core/observability/analytics/analytics_event.dart';
import 'package:demo_mix_panel/core/observability/analytics/analytics_service.dart';
import 'package:demo_mix_panel/core/observability/errors/user_experienced_error_event.dart';
import 'package:demo_mix_panel/core/observability/errors/app_error.dart';
import 'package:demo_mix_panel/core/observability/errors/error_reporter.dart';
import 'package:demo_mix_panel/core/observability/performance/performance_tracker.dart';

class Observability {
  final AnalyticsService analytics;
  final ErrorReporter errors;
  final PerformanceTracker performance;

  Observability({
    required this.analytics,
    required this.errors,
    required this.performance,
  });

  void track(AnalyticsEvent event) {
    analytics.track(event);
  }

  void reportError(
    AppError error, {
    Map<String, dynamic>? context,
  }) {
    errors.report(error, context: context);

    analytics.track(
      UserExperiencedErrorEvent(error, context),
    );
  }
}