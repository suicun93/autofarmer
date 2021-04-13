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
      '$endpointApi/GetDevice',
      {'data': '{\"limit\":$limit,\"page\":$page,\"token\":\"$token\"}'},
      headers: {'Content-Type': 'application/json'},
    );
  }

  Future<Response<CloneDeviceResponse>> getDeviceClone({
    @required String imei,
  }) async {
    String token = await Preference.getToken();
    return await post(
      '$endpointApi/GetCloneType',
      {
        'data':
            '{\"limit\":120,\"page\":1,\"token\":\"$token\",\"IMEI\":\"$imei\"}'
      },
      headers: {'Content-Type': 'application/json'},
      decoder: (map) => CloneDeviceResponse.fromJson(map),
    );
  }
}
