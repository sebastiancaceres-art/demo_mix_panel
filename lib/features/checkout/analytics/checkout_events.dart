import 'package:demo_mix_panel/core/observability/analytics/analytics_context.dart';
import 'package:demo_mix_panel/core/observability/analytics/analytics_event.dart';

class CheckoutStartedEvent extends AnalyticsEvent {
  @override
  String get name => 'checkout_started';

  @override
  AnalyticsContext get context => const AnalyticsContext(
        screen: 'checkout',
        feature: 'payments',
      );

  @override
  Map<String, dynamic> get properties => {};
}

class CheckoutCompletedEvent extends AnalyticsEvent {
  @override
  String get name => 'checkout_completed';

  @override
  AnalyticsContext get context => const AnalyticsContext(
        screen: 'checkout',
        feature: 'payments',
      );

  @override
  Map<String, dynamic> get properties => {};
}
