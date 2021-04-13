class FarmerResponse {
  FarmerResponse({
    this.result,
  });

  Result result;

  factory FarmerResponse.fromJson(Map<String, dynamic> json) => FarmerResponse(
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
    this.listFarmer,
  });

  bool success;
  int total;
  List<Farmer> listFarmer;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        success: json["success"] == null ? null : json["success"],
        total: json["total"] == null ? null : json["total"],
        listFarmer: json["data"] == null
            ? null
            : List<Farmer>.from(json["data"].map((x) => Farmer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "total": total == null ? null : total,
        "data": listFarmer == null
            ? null
            : List<dynamic>.from(listFarmer.map((x) => x.toJson())),
      };
}

class Farmer {
  Farmer({
    this.id,
    this.username,
    this.fullname,
    this.balance,
    this.token,
    this.role,
    this.status,
    this.referenceCode,
    this.password,
    this.debugMode,
    this.datumCreatedAt,
    this.createdAt,
    this.isLikeSub,
    this.updatedAt,
    this.user100App,
    this.accountName,
    this.bankName,
    this.bankNumber,
    this.resonanceCode,
    this.email,
    this.fblink,
    this.checkApp,
  });

  String id;
  String username;
  String fullname;
  int balance;
  String token;
  int role;
  String status;
  String referenceCode;
  String password;
  String debugMode;
  DateTime datumCreatedAt;
  int createdAt;
  bool isLikeSub;
  UpdatedAt updatedAt;
  bool user100App;
  String accountName;
  String bankName;
  String bankNumber;
  String resonanceCode;
  String email;
  String fblink;
  bool checkApp;

  factory Farmer.fromJson(Map<String, dynamic> json) => Farmer(
        id: json["_id"] == null ? null : json["_id"],
        username: json["username"] == null ? null : json["username"],
        fullname: json["fullname"] == null ? null : json["fullname"],
        balance: json["balance"] == null ? null : json["balance"],
        token: json["token"] == null ? null : json["token"],
        role: json["role"] == null ? null : json["role"],
        status: json["status"] == null ? null : json["status"],
        referenceCode:
            json["reference_code"] == null ? null : json["reference_code"],
        password: json["password"] == null ? null : json["password"],
        debugMode: json["debug_mode"] == null ? null : json["debug_mode"],
        datumCreatedAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        isLikeSub: json["isLikeSub"] == null ? null : json["isLikeSub"],
        updatedAt: json["updated_at"] == null
            ? null
            : UpdatedAt.fromJson(json["updated_at"]),
        user100App: json["user_100_app"] == null ? null : json["user_100_app"],
        accountName: json["AccountName"] == null ? null : json["AccountName"],
        bankName: json["BankName"] == null ? null : json["BankName"],
        bankNumber: json["BankNumber"] == null ? null : json["BankNumber"],
        resonanceCode:
            json["ResonanceCode"] == null ? null : json["ResonanceCode"],
        email: json["email"] == null ? null : json["email"],
        fblink: json["fblink"] == null ? null : json["fblink"],
        checkApp: json["check_app"] == null ? null : json["check_app"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "username": username == null ? null : username,
        "fullname": fullname == null ? null : fullname,
        "balance": balance == null ? null : balance,
        "token": token == null ? null : token,
        "role": role == null ? null : role,
        "status": status == null ? null : status,
        "reference_code": referenceCode == null ? null : referenceCode,
        "password": password == null ? null : password,
        "debug_mode": debugMode == null ? null : debugMode,
        "created_at":
            datumCreatedAt == null ? null : datumCreatedAt.toIso8601String(),
        "createdAt": createdAt == null ? null : createdAt,
        "isLikeSub": isLikeSub == null ? null : isLikeSub,
        "updated_at": updatedAt == null ? null : updatedAt.toJson(),
        "user_100_app": user100App == null ? null : user100App,
        "AccountName": accountName == null ? null : accountName,
        "BankName": bankName == null ? null : bankName,
        "BankNumber": bankNumber == null ? null : bankNumber,
        "ResonanceCode": resonanceCode == null ? null : resonanceCode,
        "email": email == null ? null : email,
        "fblink": fblink == null ? null : fblink,
        "check_app": checkApp == null ? null : checkApp,
      };
}

class UpdatedAt {
  UpdatedAt({
    this.date,
  });

  Date date;

  factory UpdatedAt.fromJson(Map<String, dynamic> json) => UpdatedAt(
        date: json["\u0024date"] == null
            ? null
            : Date.fromJson(json["\u0024date"]),
      );

  Map<String, dynamic> toJson() => {
        "\u0024date": date == null ? null : date.toJson(),
      };
}

class Date {
  Date({
    this.numberLong,
  });

  String numberLong;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        numberLong:
            json["\u0024numberLong"] == null ? null : json["\u0024numberLong"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024numberLong": numberLong == null ? null : numberLong,
      };
}
