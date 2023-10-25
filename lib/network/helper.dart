import 'package:bike_price_prediction/network/api.dart';

import 'manager.dart';
import 'model.dart';

class Helper {
  Future<Manager> connection({
    required String brand,
    required String manufacturedYear,
    required String travel,
    required String engine,
  }) async {
    try {
      PredictModel predictModel = await GetPrice().apiCall(
          brand: brand,
          manufacturedYear: manufacturedYear,
          travel: travel,
          engine: engine);
      return Manager(isOkay: true, price: predictModel.predictedPrice!);
    } on Exception {
      return Manager(isOkay: false, price: 0);
    }
  }
}
