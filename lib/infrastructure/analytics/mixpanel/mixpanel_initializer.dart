import 'package:mixpanel_flutter/mixpanel_flutter.dart';

class MixpanelInitializer {
  static Future<Mixpanel> init(String token) {
    return Mixpanel.init(
      token,
      trackAutomaticEvents: false,
    );
  }
}