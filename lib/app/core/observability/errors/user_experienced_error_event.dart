import 'package:demo_mix_panel/app/core/observability/analytics/analytics_event.dart';
import 'package:demo_mix_panel/app/core/observability/errors/app_error.dart';

class UserExperiencedErrorEvent extends AnalyticsEvent {
  final AppError error;
  final Map<String, dynamic>? extra;

  UserExperiencedErrorEvent(this.error, this.extra);

  @override
  String get name => 'user_experienced_error';

  @override
  Map<String, dynamic> get properties => {
        'error_code': error.code,
        'category': error.category,
        'is_blocking': error.isBlocking,
        'can_retry': error.canRetry,
        ...?extra,
      };
}