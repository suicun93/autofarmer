class CloneDeviceResponse {
  CloneDeviceResponse({
    this.result,
  });

  Result result;

  factory CloneDeviceResponse.fromJson(Map<String, dynamic> json) =>
      CloneDeviceResponse(
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result == null ? null : result.toJson(),
      };
}

class Result {
  Result({
    this.success,
    this.total,
    this.listClone,
  });

  bool success;
  int total;
  List<Clone> listClone;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        success: json["success"] == null ? null : json["success"],
        total: json["total"] == null ? null : json["total"],
        listClone: json["data"] == null
            ? null
            : List<Clone>.from(json["data"].map((x) => Clone.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "total": total == null ? null : total,
        "data": listClone == null
            ? null
            : List<dynamic>.from(listClone.map((x) => x.toJson())),
      };
}

class Clone {
  Clone({
    this.id,
    this.uid,
    this.token,
    this.type,
    this.country,
    this.isAutofarmerClone,
    this.updateLastTime,
    this.action,
    this.createdAt,
    this.updatedAt,
    this.email,
    this.actionLive,
    this.cookie,
    this.avatar,
    this.language,
    this.prefix,
    this.value,
    this.updateDateTime,
    this.setting2Fa,
    this.aliveStatus,
    this.mz,
    this.imei,
    this.timeStore,
    this.settingLang,
    this.action1,
    this.action2,
    this.action3,
    this.action4,
    this.countJoinGroup,
    this.dataAction,
    this.dataGroup,
    this.datumUpdatedAt,
  });

  String id;
  String uid;
  String token;
  String type;
  String country;
  bool isAutofarmerClone;
  int updateLastTime;
  String action;
  int createdAt;
  int updatedAt;
  String email;
  dynamic actionLive;
  String cookie;
  bool avatar;
  String language;
  String prefix;
  String value;
  int updateDateTime;
  bool setting2Fa;
  String aliveStatus;
  bool mz;
  String imei;
  int timeStore;
  bool settingLang;
  bool action1;
  bool action2;
  bool action3;
  bool action4;
  int countJoinGroup;
  DataAction dataAction;
  String dataGroup;
  dynamic datumUpdatedAt;

  factory Clone.fromJson(Map<String, dynamic> json) => Clone(
        id: json["_id"] == null ? null : json["_id"],
        uid: json["uid"] == null ? null : json["uid"],
        token: json["token"] == null ? null : json["token"],
        type: json["type"] == null ? null : json["type"],
        country: json["country"] == null ? null : json["country"],
        isAutofarmerClone: json["isAutofarmerClone"] == null
            ? null
            : json["isAutofarmerClone"],
        updateLastTime:
            json["updateLastTime"] == null ? null : json["updateLastTime"],
        action: json["action"] == null ? null : json["action"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
        email: json["email"] == null ? null : json["email"],
        actionLive: json["action_live"],
        cookie: json["cookie"] == null ? null : json["cookie"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        language: json["language"] == null ? null : json["language"],
        prefix: json["prefix"] == null ? null : json["prefix"],
        value: json["value"] == null ? null : json["value"],
        updateDateTime:
            json["updateDateTime"] == null ? null : json["updateDateTime"],
        setting2Fa: json["Setting2FA"] == null ? null : json["Setting2FA"],
        aliveStatus: json["alive_status"] == null ? null : json["alive_status"],
        mz: json["mz"] == null ? null : json["mz"],
        imei: json["IMEI"] == null ? null : json["IMEI"],
        timeStore: json["TimeStore"] == null ? null : json["TimeStore"],
        settingLang: json["SettingLang"] == null ? null : json["SettingLang"],
        action1: json["action1"] == null ? null : json["action1"],
        action2: json["action2"] == null ? null : json["action2"],
        action3: json["action3"] == null ? null : json["action3"],
        action4: json["action4"] == null ? null : json["action4"],
        countJoinGroup:
            json["countJoinGroup"] == null ? null : json["countJoinGroup"],
        dataAction: json["dataAction"] == null
            ? null
            : DataAction.fromJson(json["dataAction"]),
        dataGroup: json["dataGroup"] == null ? null : json["dataGroup"],
        datumUpdatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "uid": uid == null ? null : uid,
        "token": token == null ? null : token,
        "type": type == null ? null : type,
        "country": country == null ? null : country,
        "isAutofarmerClone":
            isAutofarmerClone == null ? null : isAutofarmerClone,
        "updateLastTime": updateLastTime == null ? null : updateLastTime,
        "action": action == null ? null : action,
        "createdAt": createdAt == null ? null : createdAt,
        "updatedAt": updatedAt == null ? null : updatedAt,
        "email": email == null ? null : email,
        "action_live": actionLive,
        "cookie": cookie == null ? null : cookie,
        "avatar": avatar == null ? null : avatar,
        "language": language == null ? null : language,
        "prefix": prefix == null ? null : prefix,
        "value": value == null ? null : value,
        "updateDateTime": updateDateTime == null ? null : updateDateTime,
        "Setting2FA": setting2Fa == null ? null : setting2Fa,
        "alive_status": aliveStatus == null ? null : aliveStatus,
        "mz": mz == null ? null : mz,
        "IMEI": imei == null ? null : imei,
        "TimeStore": timeStore == null ? null : timeStore,
        "SettingLang": settingLang == null ? null : settingLang,
        "action1": action1 == null ? null : action1,
        "action2": action2 == null ? null : action2,
        "action3": action3 == null ? null : action3,
        "action4": action4 == null ? null : action4,
        "countJoinGroup": countJoinGroup == null ? null : countJoinGroup,
        "dataAction": dataAction == null ? null : dataAction.toJson(),
        "dataGroup": dataGroup == null ? null : dataGroup,
        "updated_at": datumUpdatedAt,
      };
}

class DataAction {
  DataAction({
    this.feed,
    this.follow,
    this.addFriendSuggest,
    this.bufflike,
    this.likepage,
    this.feedLike,
    this.postStatus,
    this.viplikeService,
    this.confirmFriend,
    this.buffcomment,
  });

  int feed;
  int follow;
  int addFriendSuggest;
  int bufflike;
  int likepage;
  int feedLike;
  int postStatus;
  int viplikeService;
  int confirmFriend;
  int buffcomment;

  factory DataAction.fromJson(Map<String, dynamic> json) => DataAction(
        feed: json["Feed"] == null ? null : json["Feed"],
        follow: json["follow"] == null ? null : json["follow"],
        addFriendSuggest:
            json["AddFriendSuggest"] == null ? null : json["AddFriendSuggest"],
        bufflike: json["bufflike"] == null ? null : json["bufflike"],
        likepage: json["likepage"] == null ? null : json["likepage"],
        feedLike: json["FeedLike"] == null ? null : json["FeedLike"],
        postStatus: json["PostStatus"] == null ? null : json["PostStatus"],
        viplikeService:
            json["viplikeService"] == null ? null : json["viplikeService"],
        confirmFriend:
            json["ConfirmFriend"] == null ? null : json["ConfirmFriend"],
        buffcomment: json["buffcomment"] == null ? null : json["buffcomment"],
      );

  Map<String, dynamic> toJson() => {
        "Feed": feed == null ? null : feed,
        "follow": follow == null ? null : follow,
        "AddFriendSuggest": addFriendSuggest == null ? null : addFriendSuggest,
        "bufflike": bufflike == null ? null : bufflike,
        "likepage": likepage == null ? null : likepage,
        "FeedLike": feedLike == null ? null : feedLike,
        "PostStatus": postStatus == null ? null : postStatus,
        "viplikeService": viplikeService == null ? null : viplikeService,
        "ConfirmFriend": confirmFriend == null ? null : confirmFriend,
        "buffcomment": buffcomment == null ? null : buffcomment,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
