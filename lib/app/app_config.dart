class AppConfig {
  static const bool enableAnalytics = true;

  static const String mixpanelToken = String.fromEnvironment('MIXPANEL_TOKEN');
}
