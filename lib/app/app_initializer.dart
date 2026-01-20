import 'package:demo_mix_panel/app/app_di.dart';
import 'package:demo_mix_panel/core/observability/analytics/analytics_service.dart';

class AppInitializer {
  static Future<void> init() async {
    registerAppDependencies();

    await getIt<AnalyticsService>().init();
  }
}