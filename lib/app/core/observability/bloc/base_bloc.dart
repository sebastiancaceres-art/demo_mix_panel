import 'package:demo_mix_panel/app/core/observability/analytics/analytics_event.dart';
import 'package:demo_mix_panel/app/core/observability/errors/app_error.dart';
import 'package:demo_mix_panel/app/core/observability/observability.dart';
import 'package:flutter/material.dart';

abstract class BaseBloc {
  BaseBloc(this.observability);

  @protected
  final Observability? observability;

  @protected
  void trackEvent(AnalyticsEvent event) {
    observability?.track(event);
  }

  @protected
  void trackError(
    AppError error, {
    Map<String, dynamic>? context,
  }) {
    observability?.reportError(
      error,
      context: context,
    );
  }

  @protected
  void startPerformance(String trace) {
    observability?.performance.start(trace);
  }

  @protected
  void stopPerformance(String trace) {
    observability?.performance.stop(trace);
  }
}