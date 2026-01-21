import 'package:demo_mix_panel/app/core/observability/bloc/base_bloc.dart';
import 'package:demo_mix_panel/app/core/observability/errors/app_error.dart';
import 'package:demo_mix_panel/app/features/checkout/analytics/checkout_event.dart';

class CheckoutBloc extends BaseBloc {
  CheckoutBloc(super.observability);

  Future<void> onPayPressed() async {
    trackEvent(CheckoutStartedEvent());

    startPerformance('checkout_flow');

    try {
      await Future.delayed(const Duration(seconds: 2));

      trackEvent(CheckoutCompletedEvent());
    } catch (e) {
      trackError(
        AppError(
          code: 'CHECKOUT_FAILED',
          message: 'No se pudo completar el pago',
          category: 'checkout',
          isBlocking: true,
          canRetry: true,
        ),
      );
    } finally {
      stopPerformance('checkout_flow');
    }
  }
}
