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
      '$endpointApi/clones/search',
      {
        "limit": limit,
        "page": page,
        "alive_status": requestTypeMap[requestType],
      },
      headers: {
        'Content-Type': 'application/json',
        'token': token,
      },
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

  Future<Response> deleteClone(String cloneId) async {
    String token = await Preference.getToken();
    return await post(
      '$endpointApi/clones/delete',
      {
        'clone_id': cloneId,
        'action': 'delete',
      },
      headers: {
        'Content-Type': 'application/json',
        'token': token,
      },
    );
  }

  Future<Response> resetCloneLive(String cloneId) async {
    String token = await Preference.getToken();
    return await post(
      '$endpointApi/clones/reset',
      {
        'clone_id': cloneId,
      },
      headers: {
        'Content-Type': 'application/json',
        'token': token,
      },
    );
  }
}

enum RequestType { ALL, LIVE, STORED, CHECK_POINT }

Map<RequestType, List<String>> requestTypeMap = {
  RequestType.ALL: ["live", "verifying", "checkpoint", "stored"],
  RequestType.LIVE: ["live"],
  RequestType.STORED: ["stored"],
  RequestType.CHECK_POINT: ["checkpoint"],
};

extension Parsing on RequestType {
  String toStr() {
    switch (this) {
      case RequestType.ALL:
        return 'All';
      case RequestType.LIVE:
        return 'Ch??a d??ng';
      case RequestType.STORED:
        return '???? d??ng';
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
