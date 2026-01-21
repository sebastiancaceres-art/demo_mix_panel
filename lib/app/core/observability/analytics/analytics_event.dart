import 'package:demo_mix_panel/app/core/observability/analytics/analytics_context.dart';

abstract class AnalyticsEvent {
  String get name;

  Map<String, dynamic> get properties;

  int get version => 1;

  AnalyticsContext? get context => null;
}
