import 'package:get/get.dart';

import '../../../../../common/const.dart';
import '../../../../../common/preferences.dart';
import 'farmer_model.dart';

class FarmerProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => FarmerResponse.fromJson(map);
  }

  Future<Response<FarmerResponse>> getFarmer() async {
    String token = await Preference.getToken();
    return await get(
      '$endpointApi/detail',
      headers: {
        'Content-Type': 'application/json',
        'token': token,
      },
    );
  }
}
