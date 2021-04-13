import 'package:get/get.dart';

import '../../../../../common/const.dart';
import '../../../../../common/preferences.dart';
import 'history_model.dart';

class HistoryProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => HistoryResponse.fromJson(map);
  }

  Future<Response<HistoryResponse>> getHistory() async {
    String token = await Preference.getToken();
    return await post(
      '$endpointApi/getHistory',
      {'data': '{\"token\":\"$token\"}'},
      headers: {'Content-Type': 'application/json'},
    );
  }
}
