import 'package:demo_mix_panel/app/app_config.dart';
import 'package:demo_mix_panel/core/observability/analytics/analytics_event.dart';
import 'package:demo_mix_panel/core/observability/analytics/analytics_service.dart';
import 'package:demo_mix_panel/infrastructure/analytics/mixpanel/mixpanel_initializer.dart';
import 'package:demo_mix_panel/infrastructure/analytics/mixpanel/mixpanel_mapper.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

class MixpanelAnalyticsService implements AnalyticsService {
  late final Mixpanel _mixpanel;

  @override
  Future<void> init() async {
    _mixpanel = await MixpanelInitializer.init(AppConfig.mixpanelToken);
  }

  @override
  void track(AnalyticsEvent event) {
    _mixpanel.track(event.name, properties: MixpanelMapper.toProperties(event));
  }

  @override
  void identify(String userId) {
    _mixpanel.identify(userId);
  }

  @override
  void setUserProperties(Map<String, dynamic> properties) {
    final people = _mixpanel.getPeople();

    for (final entry in properties.entries) {
      people.set(entry.key, entry.value);
    }
  }

  @override
  void reset() => _mixpanel.reset();
}
