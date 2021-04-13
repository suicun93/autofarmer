import 'package:get/get.dart';

import '../../../../../common/const.dart';
import '../../../../../common/preferences.dart';
import 'today_model.dart';

class TodayProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => TodayResponse.fromJson(map);
  }

  Future<Response<TodayResponse>> getToday() async {
    String token = await Preference.getToken();
    final date = DateTime.now();
    final dateTime = DateTime(date.year, date.month, date.day).toLocal();
    return await post(
      '$endpointApi/getServiceTypeHistory',
      {
        'data':
            '{\"token\":\"$token\",\"type\":\"today\",\"status\":2,\"time\":${dateTime.millisecondsSinceEpoch.toString()}}'
      },
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }
}
