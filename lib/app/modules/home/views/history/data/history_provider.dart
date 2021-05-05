import 'package:get/get.dart';

import '../../../../../common/preferences.dart';
import 'history_model.dart';

class HistoryProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => HistoryResponse.fromJson(map);
  }

  Future<Response<HistoryResponse>> getHistory() async {
    String token = await Preference.getUserToken();
    return await post(
      'https://adminapi-autolike.congaubeo.us/public-api/v1/employees/financial/all',
      {
        "status_number": 2,
        "token": token,
      },
      headers: {
        'Content-Type': 'application/json',
        'mobile-secret-key': '3953390b-42bb-11eb-9f8b-1111914b71be',
      },
    );
  }
}
