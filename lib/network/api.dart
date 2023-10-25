import 'constants.dart';
import 'model.dart';
import 'package:http/http.dart' as http;

class GetPrice {
  Future<PredictModel> apiCall({
    required String brand,
    required String manufacturedYear,
    required String travel,
    required String engine,
  }) async {
    var request = http.MultipartRequest(
      Constant.post,
      Uri.parse(
        'https://bike-price-prediction-api-using-ml.onrender.com/predict_price',
      ),
    );
    request.fields.addAll({
      Constant.brand: brand,
      Constant.manufacturedYear: manufacturedYear,
      Constant.travel: travel,
      Constant.engine: engine
    });
    http.StreamedResponse response = await request.send();
    var str = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      return PredictModel.fromJson(str);
    }
    throw Exception();
  }
}
