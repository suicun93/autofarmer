import '../../../../../common/timeago.dart' as timeago;

class DeviceResponse {
  DeviceResponse({
    this.code,
    this.message,
    this.data,
  });

  int code;
  String message;
  Data data;

  factory DeviceResponse.fromJson(Map<String, dynamic> json) => DeviceResponse(
        code: json["code"] == null ? null : json["code"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "message": message == null ? null : message,
        "data": data == null ? null : data.toJson(),
      };
}

class Data {
  Data({
    this.lastOffset,
    this.total,
    this.deviceList,
  });

  String lastOffset;
  int total;
  List<DeviceList> deviceList;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        lastOffset: json["last_offset"] == null ? null : json["last_offset"],
        total: json["total"] == null ? null : json["total"],
        deviceList: json["data"] == null
            ? null
            : List<DeviceList>.from(
                json["data"].map((x) => DeviceList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "last_offset": lastOffset == null ? null : lastOffset,
        "total": total == null ? null : total,
        "data": deviceList == null
            ? null
            : List<dynamic>.from(deviceList.map((x) => x.toJson())),
      };
}

class DeviceList {
  DeviceList({
    this.id,
    this.token,
    this.imei,
    this.device,
    this.name,
    this.lastUpdateTime,
  });

  String id;
  String token;
  String imei;
  Device device;
  String name;
  int lastUpdateTime;

  factory DeviceList.fromJson(Map<String, dynamic> json) => DeviceList(
        id: json["id"] == null ? null : json["id"],
        token: json["token"] == null ? null : json["token"],
        imei: json["IMEI"] == null ? null : json["IMEI"],
        device: json["device"] == null ? null : Device.fromJson(json["device"]),
        name: json["name"] == null ? null : json["name"],
        lastUpdateTime:
            json["last_update_time"] == null ? null : json["last_update_time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "token": token == null ? null : token,
        "IMEI": imei == null ? null : imei,
        "device": device == null ? null : device.toJson(),
        "name": name == null ? null : name,
        "last_update_time": lastUpdateTime == null ? null : lastUpdateTime,
      };
}

class Device {
  Device({
    this.deviceName,
    this.imei,
    this.model,
  });

  String deviceName;
  String imei;
  String model;

  bool loading = true;
  bool error = false;
  int cloneCount = 0;
  String lastOnlineString = '';
  int _lastOnlineSecond = 0;

  int get lastOnlineTooLong => _lastOnlineSecond ~/ 1000;

  bool get isOffline => loading || error || lastOnlineTooLong > 1800;

  String get displayName => imei?.substring(imei.length - 7) ?? '';

  void lastOnlineCount(int lastTime) {
    // // Empty list
    // if (listCLone.isEmpty) {
    //   lastOnlineString = 'Not online';
    //   _lastOnlineSecond = -1;
    //   return;
    // }
    //
    // // Get Last Time
    // for (var clone in listCLone) {
    //   if (clone.updatedAt > lastTime) lastTime = clone.updatedAt;
    // }

    // Calculate
    final lastDatetime = DateTime.fromMillisecondsSinceEpoch(lastTime);
    lastOnlineString = timeago.format(
      lastDatetime,
      locale: 'vi_short',
    );
    _lastOnlineSecond = timeago.elapsed(lastDatetime);
  }

  factory Device.fromJson(Map<String, dynamic> json) => Device(
        deviceName: json["DeviceName"] == null ? null : json["DeviceName"],
        imei: json["IMEI"] == null ? null : json["IMEI"],
        model: json["Model"] == null ? null : json["Model"],
      );

  Map<String, dynamic> toJson() => {
        "DeviceName": deviceName == null ? null : deviceName,
        "IMEI": imei == null ? null : imei,
        "Model": model == null ? null : model,
      };
}
