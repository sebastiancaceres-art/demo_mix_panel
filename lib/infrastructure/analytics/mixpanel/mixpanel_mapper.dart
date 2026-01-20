
import 'package:demo_mix_panel/core/observability/analytics/analytics_event.dart';

class MixpanelMapper {
  static Map<String, dynamic> toProperties(AnalyticsEvent event) {
    return {
      'event_version': event.version,
      ...?event.context?.toMap(),
      ...event.properties,
    };
  }
}