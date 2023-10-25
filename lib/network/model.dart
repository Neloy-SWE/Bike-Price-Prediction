import 'dart:convert';

class PredictModel {
  final int? predictedPrice;

  PredictModel({
    this.predictedPrice,
  });

  factory PredictModel.fromJson(String str) => PredictModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PredictModel.fromMap(Map<String, dynamic> json) => PredictModel(
    predictedPrice: json["predicted_price"],
  );

  Map<String, dynamic> toMap() => {
    "predicted_price": predictedPrice,
  };
}
