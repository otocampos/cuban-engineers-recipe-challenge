class Measurement {
  final double? amount;
  final String? unitShort;
  final String? unitLong;

  Measurement({
    this.amount,
    this.unitShort,
    this.unitLong,
  });

  factory Measurement.fromJson(Map<String, dynamic> json) {
    return Measurement(
      amount: json['amount'],
      unitShort: json['unitShort'],
      unitLong: json['unitLong'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'unitShort': unitShort,
      'unitLong': unitLong,
    };
  }
}