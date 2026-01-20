import 'package:demo_mix_panel/core/observability/analytics/analytics_event.dart';
import 'package:demo_mix_panel/core/observability/analytics/analytics_service.dart';

class NoopAnalyticsService implements AnalyticsService {
  @override
  Future<void> init() async {}

  @override
  void track(AnalyticsEvent event) {}

  @override
  void identify(String userId) {}

  @override
  void setUserProperties(Map<String, dynamic> properties) {}

  @override
  void reset() {}
}