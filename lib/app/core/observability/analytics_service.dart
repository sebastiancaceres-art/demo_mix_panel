import 'package:demo_mix_panel/app/core/observability/analytics_event.dart';

abstract interface class AnalyticsService {
  Future<void> init();

  void track(AnalyticsEvent event);

  void identify(String userId);

  void setUserProperties(Map<String, dynamic> properties);

  void reset();
}
