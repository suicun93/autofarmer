import 'package:get/get.dart';

import '../../../../../common/preferences.dart';
import 'today_model.dart';

class TodayProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => TodayResponse.fromJson(map);
  }

  Future<Response<TodayResponse>> getToday() async {
    String token = await Preference.getUserToken();
    final date = DateTime.now();
    final dateTimeFrom = DateTime(date.year, date.month, date.day).toLocal();
    final dateTimeTo = DateTime(date.year, date.month, date.day)
        .add(Duration(hours: 24))
        .toLocal();
    return await post(
      'https://adminapi-autolike.congaubeo.us/public-api/v1/employees/daily-today/all',
      {
        "from_time": dateTimeFrom.millisecondsSinceEpoch,
        "to_time": dateTimeTo.millisecondsSinceEpoch,
        "token": token,
      },
      headers: {
        'Content-Type': 'application/json',
        'mobile-secret-key': '3953390b-42bb-11eb-9f8b-1111914b71be',
      },
    );
  }
}
