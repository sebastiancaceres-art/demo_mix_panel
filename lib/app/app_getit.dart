import 'package:demo_mix_panel/app/app_config.dart';
import 'package:demo_mix_panel/app/core/observability/analytics/analytics_service.dart';
import 'package:demo_mix_panel/app/core/observability/analytics/example_analytics_service.dart';
import 'package:demo_mix_panel/app/core/observability/errors/error_reporter.dart';
import 'package:demo_mix_panel/app/core/observability/errors/example_error_reporter.dart';
import 'package:demo_mix_panel/app/core/observability/observability.dart';
import 'package:demo_mix_panel/app/core/observability/performance/example_performance_tracker.dart';
import 'package:demo_mix_panel/app/core/observability/performance/performance_tracker.dart';
import 'package:demo_mix_panel/app/features/checkout/blocs/checkout_bloc.dart';
import 'package:demo_mix_panel/infrastructure/analytics/mix_panel/mix_panel_analytics_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void registerAppDependencies() {
  // Analytics
  getIt.registerLazySingleton<AnalyticsService>(
    () => AppConfig.enableAnalytics
        ? MixpanelAnalyticsService()
        : ExampleAnalyticsService(),
  );

  // Errors
  getIt.registerLazySingleton<ErrorReporter>(() => ExampleErrorReporter());

  // Performance
  getIt.registerLazySingleton<PerformanceTracker>(
    () => ExamplePerformanceTracker(),
  );

  // Facade
  getIt.registerLazySingleton(
    () => Observability(
      analytics: getIt(),
      errors: getIt(),
      performance: getIt(),
    ),
  );

  //bloc
  getIt.registerFactory<CheckoutBloc>(
    () => CheckoutBloc(getIt<Observability>()),
  );
}
