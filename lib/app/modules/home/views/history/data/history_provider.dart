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
      'https://us-central1-autofarmer-net-9f4b8.cloudfunctions.net/getHistory',
      {'data': '{\"token\":\"$token\"}'},
      headers: {'Content-Type': 'application/json'},
    );
  }
}
