class CloneDeviceResponse {
  CloneDeviceResponse({
    this.code,
    this.message,
    this.listClone,
  });

  int code;
  String message;
  List<Clone> listClone;

  factory CloneDeviceResponse.fromJson(Map<String, dynamic> json) =>
      CloneDeviceResponse(
        code: json["code"] == null ? null : json["code"],
        message: json["message"] == null ? null : json["message"],
        listClone: json["data"] == null
            ? null
            : List<Clone>.from(json["data"].map((x) => Clone.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "message": message == null ? null : message,
        "data": listClone == null
            ? null
            : List<dynamic>.from(listClone.map((x) => x.toJson())),
      };
}

class Clone {
  Clone({
    this.id,
    this.email,
    this.uid,
    this.token,
    this.androidId,
    this.imei,
    this.aliveStatus,
    this.action,
    this.fa,
    this.password,
    this.phoneNumber,
    this.secretkey,
    this.language,
    this.country,
    this.appname,
    this.isAutofarmer,
    this.novery,
    this.passmail,
    this.cookie,
    this.settingSecretkey,
    this.settingAvatar,
    this.settingCover,
    this.settingLang,
    this.mz,
    this.cz,
    this.createdAt,
    this.updatedAt,
    this.createdDate,
    this.updatedDate,
    this.updateLastTime,
  });

  String id;
  String email;
  String uid;
  String token;
  String androidId;
  String imei;
  String aliveStatus;
  String action;
  String fa;
  String password;
  String phoneNumber;
  String secretkey;
  String language;
  String country;
  String appname;
  bool isAutofarmer;
  bool novery;
  String passmail;
  String cookie;
  bool settingSecretkey;
  bool settingAvatar;
  bool settingCover;
  bool settingLang;
  bool mz;
  bool cz;
  int updateLastTime;
  int createdAt;
  int updatedAt;
  DateTime createdDate;
  DateTime updatedDate;

  factory Clone.fromJson(Map<String, dynamic> json) => Clone(
        id: json["id"] == null ? null : json["id"],
        email: json["email"] == null ? null : json["email"],
        uid: json["uid"] == null ? null : json["uid"],
        token: json["token"] == null ? null : json["token"],
        androidId: json["android_id"] == null ? null : json["android_id"],
        imei: json["IMEI"] == null ? null : json["IMEI"],
        aliveStatus: json["alive_status"] == null ? null : json["alive_status"],
        action: json["action"] == null ? null : json["action"],
        fa: json["fa"] == null ? null : json["fa"],
        password: json["password"] == null ? null : json["password"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        secretkey: json["secretkey"] == null ? null : json["secretkey"],
        language: json["language"] == null ? null : json["language"],
        country: json["country"] == null ? null : json["country"],
        appname: json["appname"] == null ? null : json["appname"],
        isAutofarmer:
            json["is_autofarmer"] == null ? null : json["is_autofarmer"],
        novery: json["novery"] == null ? null : json["novery"],
        passmail: json["passmail"] == null ? null : json["passmail"],
        cookie: json["cookie"] == null ? null : json["cookie"],
        settingSecretkey: json["setting_secretkey"] == null
            ? null
            : json["setting_secretkey"],
        settingAvatar:
            json["setting_avatar"] == null ? null : json["setting_avatar"],
        settingCover:
            json["setting_cover"] == null ? null : json["setting_cover"],
        settingLang: json["setting_lang"] == null ? null : json["setting_lang"],
        mz: json["mz"] == null ? null : json["mz"],
        cz: json["cz"] == null ? null : json["cz"],
        updateLastTime:
            json["updateLastTime"] == null ? null : json["updateLastTime"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
        createdDate: json["created_date"] == null
            ? null
            : DateTime.parse(json["created_date"]),
        updatedDate: json["updated_date"] == null
            ? null
            : DateTime.parse(json["updated_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "email": email == null ? null : email,
        "uid": uid == null ? null : uid,
        "token": token == null ? null : token,
        "android_id": androidId == null ? null : androidId,
        "IMEI": imei == null ? null : imei,
        "alive_status": aliveStatus == null ? null : aliveStatus,
        "action": action == null ? null : action,
        "fa": fa == null ? null : fa,
        "password": password == null ? null : password,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "secretkey": secretkey == null ? null : secretkey,
        "language": language == null ? null : language,
        "country": country == null ? null : country,
        "appname": appname == null ? null : appname,
        "is_autofarmer": isAutofarmer == null ? null : isAutofarmer,
        "novery": novery == null ? null : novery,
        "passmail": passmail == null ? null : passmail,
        "cookie": cookie == null ? null : cookie,
        "setting_secretkey": settingSecretkey == null ? null : settingSecretkey,
        "setting_avatar": settingAvatar == null ? null : settingAvatar,
        "setting_cover": settingCover == null ? null : settingCover,
        "setting_lang": settingLang == null ? null : settingLang,
        "mz": mz == null ? null : mz,
        "cz": cz == null ? null : cz,
        "updateLastTime": updateLastTime == null ? null : updateLastTime,
        "createdAt": createdAt == null ? null : createdAt,
        "updatedAt": updatedAt == null ? null : updatedAt,
        "created_date":
            createdDate == null ? null : createdDate.toIso8601String(),
        "updated_date":
            updatedDate == null ? null : updatedDate.toIso8601String(),
      };
}
