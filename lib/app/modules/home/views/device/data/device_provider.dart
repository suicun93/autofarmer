import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/const.dart';
import '../../../../../common/preferences.dart';
import 'device_clone_model.dart';
import 'device_model.dart';

class DeviceProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => DeviceResponse.fromJson(map);
  }

  Future<Response<DeviceResponse>> getDevices({
    @required int page,
  }) async {
    String token = await Preference.getToken();
    return await post(
      '$endpointApi/devices/all',
      {
        'limit': limit,
        'page': page,
      },
      headers: {
        'Content-Type': 'application/json',
        'token': token,
      },
    );
  }

  Future<Response<CloneDeviceResponse>> getDeviceClone({
    @required String imei,
  }) async {
    String token = await Preference.getToken();
    return await post(
      '$endpointApi/devices/all-clone',
      {
        "limit": 120,
        "page": 1,
        "IMEI": imei,
      },
      headers: {
        'Content-Type': 'application/json',
        'token': token,
      },
      decoder: (map) => CloneDeviceResponse.fromJson(map),
    );
  }
}
