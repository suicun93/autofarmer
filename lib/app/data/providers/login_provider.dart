import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../app/common/const.dart';
import '../../../app/data/models/login_model.dart';

class LoginProvider extends GetConnect {
  @override
  void onInit() {}

  Future<Response<LoginResponse>> logIn({
    @required String username,
    @required String password,
  }) async =>
      await post(
        '$endpointApi/login',
        {
          'username': username,
          'password': password,
          'device_id': 'ABC',
        },
        decoder: (map) => LoginResponse.fromJson(map),
      );
}
