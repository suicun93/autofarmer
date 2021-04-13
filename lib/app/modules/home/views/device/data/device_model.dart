import '../../../../../common/timeago.dart' as timeago;
import 'device_clone_model.dart';

DeviceResponse deviceResponseFromJson(Map<String, dynamic> str) =>
    DeviceResponse.fromJson(str);

Map<String, dynamic> deviceResponseToJson(DeviceResponse data) => data.toJson();

class DeviceResponse {
  DeviceResponse({
    this.result,
  });

  Result result;

  factory DeviceResponse.fromJson(Map<String, dynamic> json) => DeviceResponse(
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result == null ? null : result.toJson(),
      };
}

class Result {
  Result({
    this.success,
    this.message,
    this.total,
    this.data,
  });

  bool success;
  String message;
  int total;
  Data data;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        total: json["total"] == null ? null : json["total"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "message": message == null ? null : message,
        "total": total == null ? null : total,
        "data": data == null ? null : data.toJson(),
      };
}

class Data {
  Data({
    this.deviceList,
    this.friendList,
    this.groupList,
    this.pageList,
    this.actionProfileList,
  });

  List<DeviceList> deviceList;
  List<dynamic> friendList;
  List<dynamic> groupList;
  List<dynamic> pageList;
  List<ActionProfileList> actionProfileList;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        deviceList: json["deviceList"] == null
            ? null
            : List<DeviceList>.from(
                json["deviceList"].map((x) => DeviceList.fromJson(x))),
        friendList: json["friendList"] == null
            ? null
            : List<dynamic>.from(json["friendList"].map((x) => x)),
        groupList: json["groupList"] == null
            ? null
            : List<dynamic>.from(json["groupList"].map((x) => x)),
        pageList: json["pageList"] == null
            ? null
            : List<dynamic>.from(json["pageList"].map((x) => x)),
        actionProfileList: json["actionProfileList"] == null
            ? null
            : List<ActionProfileList>.from(json["actionProfileList"]
                .map((x) => ActionProfileList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "deviceList": deviceList == null
            ? null
            : List<dynamic>.from(deviceList.map((x) => x.toJson())),
        "friendList": friendList == null
            ? null
            : List<dynamic>.from(friendList.map((x) => x)),
        "groupList": groupList == null
            ? null
            : List<dynamic>.from(groupList.map((x) => x)),
        "pageList": pageList == null
            ? null
            : List<dynamic>.from(pageList.map((x) => x)),
        "actionProfileList": actionProfileList == null
            ? null
            : List<dynamic>.from(actionProfileList.map((x) => x.toJson())),
      };
}

class ActionProfileList {
  ActionProfileList({
    this.id,
    this.feedLike,
    this.watch,
    this.vipLike,
    this.likePage,
    this.pageLike,
    this.friendLike,
    this.subFollow,
    this.addFriendSuggest,
    this.addFriendUid,
    this.confirmFriend,
    this.joinGroup,
    this.shareGroup,
    this.shareNow,
    this.groupLike,
    this.changePassword,
    this.avatar,
    this.cover,
    this.token,
    this.name,
    this.updatedAt,
    this.comment,
    this.likeComment,
    this.likeSubMoney,
    this.postStatus,
    this.postStatusImage,
    this.randomLike,
    this.actionProfileListUpdatedAt,
    this.type,
    this.v,
  });

  String id;
  AddFriendSuggest feedLike;
  AddFriendSuggest watch;
  AddFriendSuggest vipLike;
  AddFriendSuggest likePage;
  AddFriendSuggest pageLike;
  AddFriendSuggest friendLike;
  AddFriendSuggest subFollow;
  AddFriendSuggest addFriendSuggest;
  AddFriendSuggest addFriendUid;
  AddFriendSuggest confirmFriend;
  AddFriendSuggest joinGroup;
  Avatar shareGroup;
  Avatar shareNow;
  AddFriendSuggest groupLike;
  Avatar changePassword;
  Avatar avatar;
  Avatar cover;
  String token;
  String name;
  int updatedAt;
  dynamic comment;
  dynamic likeComment;
  dynamic likeSubMoney;
  dynamic postStatus;
  dynamic postStatusImage;
  dynamic randomLike;
  DateTime actionProfileListUpdatedAt;
  String type;
  int v;

  factory ActionProfileList.fromJson(Map<String, dynamic> json) =>
      ActionProfileList(
        id: json["_id"] == null ? null : json["_id"],
        feedLike: json["FeedLike"] == null
            ? null
            : AddFriendSuggest.fromJson(json["FeedLike"]),
        watch: json["Watch"] == null
            ? null
            : AddFriendSuggest.fromJson(json["Watch"]),
        vipLike: json["VipLike"] == null
            ? null
            : AddFriendSuggest.fromJson(json["VipLike"]),
        likePage: json["LikePage"] == null
            ? null
            : AddFriendSuggest.fromJson(json["LikePage"]),
        pageLike: json["PageLike"] == null
            ? null
            : AddFriendSuggest.fromJson(json["PageLike"]),
        friendLike: json["FriendLike"] == null
            ? null
            : AddFriendSuggest.fromJson(json["FriendLike"]),
        subFollow: json["SubFollow"] == null
            ? null
            : AddFriendSuggest.fromJson(json["SubFollow"]),
        addFriendSuggest: json["AddFriendSuggest"] == null
            ? null
            : AddFriendSuggest.fromJson(json["AddFriendSuggest"]),
        addFriendUid: json["AddFriendUid"] == null
            ? null
            : AddFriendSuggest.fromJson(json["AddFriendUid"]),
        confirmFriend: json["ConfirmFriend"] == null
            ? null
            : AddFriendSuggest.fromJson(json["ConfirmFriend"]),
        joinGroup: json["JoinGroup"] == null
            ? null
            : AddFriendSuggest.fromJson(json["JoinGroup"]),
        shareGroup: json["ShareGroup"] == null
            ? null
            : Avatar.fromJson(json["ShareGroup"]),
        shareNow:
            json["ShareNow"] == null ? null : Avatar.fromJson(json["ShareNow"]),
        groupLike: json["GroupLike"] == null
            ? null
            : AddFriendSuggest.fromJson(json["GroupLike"]),
        changePassword: json["ChangePassword"] == null
            ? null
            : Avatar.fromJson(json["ChangePassword"]),
        avatar: json["Avatar"] == null ? null : Avatar.fromJson(json["Avatar"]),
        cover: json["Cover"] == null ? null : Avatar.fromJson(json["Cover"]),
        token: json["token"] == null ? null : json["token"],
        name: json["name"] == null ? null : json["name"],
        updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
        comment: json["Comment"],
        likeComment: json["LikeComment"],
        likeSubMoney: json["LikeSubMoney"],
        postStatus: json["PostStatus"],
        postStatusImage: json["PostStatusImage"],
        randomLike: json["RandomLike"],
        actionProfileListUpdatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        type: json["type"] == null ? null : json["type"],
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "FeedLike": feedLike == null ? null : feedLike.toJson(),
        "Watch": watch == null ? null : watch.toJson(),
        "VipLike": vipLike == null ? null : vipLike.toJson(),
        "LikePage": likePage == null ? null : likePage.toJson(),
        "PageLike": pageLike == null ? null : pageLike.toJson(),
        "FriendLike": friendLike == null ? null : friendLike.toJson(),
        "SubFollow": subFollow == null ? null : subFollow.toJson(),
        "AddFriendSuggest":
            addFriendSuggest == null ? null : addFriendSuggest.toJson(),
        "AddFriendUid": addFriendUid == null ? null : addFriendUid.toJson(),
        "ConfirmFriend": confirmFriend == null ? null : confirmFriend.toJson(),
        "JoinGroup": joinGroup == null ? null : joinGroup.toJson(),
        "ShareGroup": shareGroup == null ? null : shareGroup.toJson(),
        "ShareNow": shareNow == null ? null : shareNow.toJson(),
        "GroupLike": groupLike == null ? null : groupLike.toJson(),
        "ChangePassword":
            changePassword == null ? null : changePassword.toJson(),
        "Avatar": avatar == null ? null : avatar.toJson(),
        "Cover": cover == null ? null : cover.toJson(),
        "token": token == null ? null : token,
        "name": name == null ? null : name,
        "updatedAt": updatedAt == null ? null : updatedAt,
        "Comment": comment,
        "LikeComment": likeComment,
        "LikeSubMoney": likeSubMoney,
        "PostStatus": postStatus,
        "PostStatusImage": postStatusImage,
        "RandomLike": randomLike,
        "updated_at": actionProfileListUpdatedAt == null
            ? null
            : actionProfileListUpdatedAt.toIso8601String(),
        "type": type == null ? null : type,
        "__v": v == null ? null : v,
      };
}

class AddFriendSuggest {
  AddFriendSuggest({
    this.check,
    this.timeOut,
    this.reRun,
    this.des,
  });

  bool check;
  dynamic timeOut;
  dynamic reRun;
  String des;

  factory AddFriendSuggest.fromJson(Map<String, dynamic> json) =>
      AddFriendSuggest(
        check: json["check"] == null ? null : json["check"],
        timeOut: json["time_out"],
        reRun: json["re_run"],
        des: json["des"] == null ? null : json["des"],
      );

  Map<String, dynamic> toJson() => {
        "check": check == null ? null : check,
        "time_out": timeOut,
        "re_run": reRun,
        "des": des == null ? null : des,
      };
}

class Avatar {
  Avatar({
    this.check,
    this.timeOut,
    this.reRun,
    this.des,
  });

  bool check;
  dynamic timeOut;
  dynamic reRun;
  String des;

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
        check: json["check"] == null ? null : json["check"],
        timeOut: json["time_out"] == null ? null : json["time_out"],
        reRun: json["re_run"] == null ? null : json["re_run"],
        des: json["des"] == null ? null : json["des"],
      );

  Map<String, dynamic> toJson() => {
        "check": check == null ? null : check,
        "time_out": timeOut == null ? null : timeOut,
        "re_run": reRun == null ? null : reRun,
        "des": des == null ? null : des,
      };
}

class DeviceList {
  DeviceList({
    this.id,
    this.actionProfileId,
    this.groupId,
    this.friendId,
    this.pageId,
    this.connectivity,
    this.token,
    this.device,
    this.imei,
    this.name,
    this.reset3G,
    this.timeOut,
    this.updatedAt,
  });

  String id;
  dynamic actionProfileId;
  dynamic groupId;
  dynamic friendId;
  dynamic pageId;
  String connectivity;
  String token;
  Device device;
  String imei;
  String name;
  String reset3G;
  int timeOut;
  DateTime updatedAt;

  factory DeviceList.fromJson(Map<String, dynamic> json) => DeviceList(
        id: json["_id"] == null ? null : json["_id"],
        actionProfileId: json["action_profile_id"] == null
            ? null
            : json["action_profile_id"],
        groupId: json["group_id"] == null ? null : json["group_id"],
        friendId: json["friend_id"] == null ? null : json["friend_id"],
        pageId: json["page_id"],
        connectivity:
            json["Connectivity"] == null ? null : json["Connectivity"],
        token: json["token"] == null ? null : json["token"],
        device: json["device"] == null ? null : Device.fromJson(json["device"]),
        imei: json["IMEI"] == null ? null : json["IMEI"],
        name: json["name"] == null ? null : json["name"],
        reset3G: json["reset_3g"] == null ? null : json["reset_3g"],
        timeOut: json["time_out"] == null ? null : json["time_out"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "action_profile_id": actionProfileId == null ? null : actionProfileId,
        "group_id": groupId == null ? null : groupId,
        "friend_id": friendId == null ? null : friendId,
        "page_id": pageId,
        "Connectivity": connectivity == null ? null : connectivity,
        "token": token == null ? null : token,
        "device": device == null ? null : device.toJson(),
        "IMEI": imei == null ? null : imei,
        "name": name == null ? null : name,
        "reset_3g": reset3G == null ? null : reset3G,
        "time_out": timeOut == null ? null : timeOut,
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}

class Device {
  Device({
    this.isSimulator,
    this.hasRoot,
    this.deviceName,
    this.imei,
    this.googleSf,
    this.baseBand,
    this.board,
    this.fingerprint,
    this.manufacturer,
    this.model,
    this.product,
    this.bootloader,
    this.host,
    this.display,
    this.abi,
    this.api,
    this.androidVersion,
    this.androidId,
    this.timeZone,
    this.dpi,
    this.width,
    this.height,
    this.appVersionName,
    this.macAddress,
  });

  bool isSimulator;
  bool hasRoot;
  String deviceName;
  String imei;
  String googleSf;
  String baseBand;
  String board;
  String fingerprint;
  String manufacturer;
  String model;
  String product;
  String bootloader;
  String host;
  String display;
  String abi;
  String api;
  String androidVersion;
  String androidId;
  String timeZone;
  String dpi;
  String width;
  String height;
  String appVersionName;
  String macAddress;
  bool loading = true;
  bool error = false;
  int cloneCount = 0;
  String lastOnlineString = '';
  int _lastOnlineSecond = 0;
  bool get lastOnlineTooLong => (_lastOnlineSecond ~/ 1000) > 300;
  bool get isOffline => loading || error || lastOnlineTooLong;

  void lastOnlineCount(List<Clone> listCLone) {
    // Empty list
    if (listCLone.isEmpty) {
      lastOnlineString = 'Not online';
      _lastOnlineSecond = -1;
      return;
    }

    // Get Last Time
    int lastTime = listCLone[0].updatedAt;
    for (var clone in listCLone) {
      if (clone.updatedAt > lastTime) lastTime = clone.updatedAt;
    }

    // Calculate
    final lastDatetime = DateTime.fromMillisecondsSinceEpoch(lastTime);
    lastOnlineString = timeago.format(
      lastDatetime,
      locale: 'vi_short',
    );
    _lastOnlineSecond = timeago.elapsed(lastDatetime);
  }

  factory Device.fromJson(Map<String, dynamic> json) => Device(
        isSimulator: json["isSimulator"] == null ? null : json["isSimulator"],
        hasRoot: json["hasRoot"] == null ? null : json["hasRoot"],
        deviceName: json["DeviceName"] == null ? null : json["DeviceName"],
        imei: json["IMEI"] == null ? null : json["IMEI"],
        googleSf: json["GoogleSF"] == null ? null : json["GoogleSF"],
        baseBand: json["BaseBand"] == null ? null : json["BaseBand"],
        board: json["Board"] == null ? null : json["Board"],
        fingerprint: json[" Fingerprint"] == null ? null : json[" Fingerprint"],
        manufacturer:
            json["Manufacturer"] == null ? null : json["Manufacturer"],
        model: json["Model"] == null ? null : json["Model"],
        product: json["Product"] == null ? null : json["Product"],
        bootloader: json["Bootloader"] == null ? null : json["Bootloader"],
        host: json["Host"] == null ? null : json["Host"],
        display: json["DISPLAY"] == null ? null : json["DISPLAY"],
        abi: json["ABI"] == null ? null : json["ABI"],
        api: json["API"] == null ? null : json["API"],
        androidVersion:
            json["AndroidVersion"] == null ? null : json["AndroidVersion"],
        androidId: json["AndroidId"] == null ? null : json["AndroidId"],
        timeZone: json["TimeZone"] == null ? null : json["TimeZone"],
        dpi: json["Dpi"] == null ? null : json["Dpi"],
        width: json["Width"] == null ? null : json["Width"],
        height: json["Height"] == null ? null : json["Height"],
        appVersionName:
            json["AppVersionName"] == null ? null : json["AppVersionName"],
        macAddress: json["MacAddress"] == null ? null : json["MacAddress"],
      );

  Map<String, dynamic> toJson() => {
        "isSimulator": isSimulator == null ? null : isSimulator,
        "hasRoot": hasRoot == null ? null : hasRoot,
        "DeviceName": deviceName == null ? null : deviceName,
        "IMEI": imei == null ? null : imei,
        "GoogleSF": googleSf == null ? null : googleSf,
        "BaseBand": baseBand == null ? null : baseBand,
        "Board": board == null ? null : board,
        " Fingerprint": fingerprint == null ? null : fingerprint,
        "Manufacturer": manufacturer == null ? null : manufacturer,
        "Model": model == null ? null : model,
        "Product": product == null ? null : product,
        "Bootloader": bootloader == null ? null : bootloader,
        "Host": host == null ? null : host,
        "DISPLAY": display == null ? null : display,
        "ABI": abi == null ? null : abi,
        "API": api == null ? null : api,
        "AndroidVersion": androidVersion == null ? null : androidVersion,
        "AndroidId": androidId == null ? null : androidId,
        "TimeZone": timeZone == null ? null : timeZone,
        "Dpi": dpi == null ? null : dpi,
        "Width": width == null ? null : width,
        "Height": height == null ? null : height,
        "AppVersionName": appVersionName == null ? null : appVersionName,
        "MacAddress": macAddress == null ? null : macAddress,
      };
}

class GroupList {
  GroupList({
    this.id,
    this.name,
    this.token,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String name;
  String token;
  DateTime createdAt;
  DateTime updatedAt;

  factory GroupList.fromJson(Map<String, dynamic> json) => GroupList(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        token: json["token"] == null ? null : json["token"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "token": token == null ? null : token,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
