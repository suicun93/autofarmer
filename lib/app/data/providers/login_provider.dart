import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../app/common/const.dart';
import '../../../app/data/models/login_model.dart';

class LoginProvider extends GetConnect {
  @override
  void onInit() {}

  Future<Response<Login>> logIn({
    @required String username,
    @required String password,
  }) async =>
      await post(
        '$endpointApi/checkLogin',
        {
          'data': "{\"username\":\"$username\",\"password\":\"$password\"}",
        },
        decoder: (map) => Login.fromJson(map),
      );
}
