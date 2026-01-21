class AnalyticsContext {
  final String screen;
  final String? flow;
  final String? feature;

  const AnalyticsContext({required this.screen, this.flow, this.feature});

  Map<String, dynamic> toMap() => {
    'screen': screen,
    if (flow != null) 'flow': flow,
    if (feature != null) 'feature': feature,
  };
}
