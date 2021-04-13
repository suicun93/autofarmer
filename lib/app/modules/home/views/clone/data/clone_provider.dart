import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/const.dart';
import '../../../../../common/preferences.dart';
import 'clone_model.dart';

class CloneProvider extends GetConnect {
  @override
  void onInit() {}

  Future<Response<CloneResponse>> getClones({
    @required int page,
    @required RequestType requestType,
  }) async {
    String token = await Preference.getToken();
    final Response<CloneResponse> response = await post(
      '$endpointApi/GetClone',
      {
        "data":
            "{\"limit\":$limit,\"page\":$page,\"token\":\"$token\",\"action\":\"${requestTypeMap[requestType]}\"}"
      },
      headers: {'Content-Type': 'application/json'},
      decoder: (map) => CloneResponse.fromJson(map),
    );
    response.body.requestType = requestType;
    return response;
  }

  Future<Response<dynamic>> getCloneImage({
    @required String id,
  }) async {
    return await get(
      'https://graph.facebook.com/$id/picture?type=normal',
      // headers: {'Content-Type': 'application/json'},
    );
  }

  Future<Response> deleteAllClone(List<String> listClone) async {
    String token = await Preference.getToken();
    final listCloneExtended = listClone.map((clone) => '\"$clone\"');
    return await post(
      '$endpointApi/DeleteCloneAll',
      {
        'data':
            '{\"dataClone\":[${listCloneExtended.join(',')}],\"token\":\"$token\"}'
      },
      headers: {'Content-Type': 'application/json'},
    );
  }

  Future<Response> resetCloneLive(List<String> listClone) async {
    String token = await Preference.getToken();
    final listCloneExtended = listClone.map((clone) => '\"$clone\"');
    return await post(
      '$endpointApi/ResetCloneLive',
      {
        'data':
            '{\"dataClone\":[${listCloneExtended.join(',')}],\"token\":\"$token\"}'
      },
      headers: {'Content-Type': 'application/json'},
    );
  }
}

enum RequestType { ALL, LIVE, STORED, CHECK_POINT }

Map<RequestType, String> requestTypeMap = {
  RequestType.ALL: '/clone',
  RequestType.LIVE: 'live',
  RequestType.STORED: 'stored',
  RequestType.CHECK_POINT: 'checkpoint',
};

extension Parsing on RequestType {
  String toStr() {
    switch (this) {
      case RequestType.ALL:
        return 'All';
      case RequestType.LIVE:
        return 'Live';
      case RequestType.STORED:
        return 'Đã dùng';
      case RequestType.CHECK_POINT:
        return 'Check point';
    }
    return 'Unknown Status';
  }

  Color toColor() {
    switch (this) {
      case RequestType.ALL:
        return Colors.blueGrey;
      case RequestType.LIVE:
        return Colors.lightGreen;
      case RequestType.STORED:
        return Colors.indigoAccent;
      case RequestType.CHECK_POINT:
        return Colors.redAccent;
    }
    return Colors.black26;
  }
}
