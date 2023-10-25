import 'measurement.dart';

class Measures {
  final Measurement? us;
  final Measurement? metric;

  Measures({
    this.us,
    this.metric,
  });

  factory Measures.fromJson(Map<String, dynamic> json) {
    return Measures(
      us: Measurement.fromJson(json['us']),
      metric: Measurement.fromJson(json['metric']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'us': us?.toJson(),
      'metric': metric?.toJson(),
    };
  }
}
