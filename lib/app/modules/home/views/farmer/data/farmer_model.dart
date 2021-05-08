class FarmerResponse {
  FarmerResponse({
    this.code,
    this.message,
    this.farmer,
  });

  int code;
  String message;
  Farmer farmer;

  factory FarmerResponse.fromJson(Map<String, dynamic> json) => FarmerResponse(
        code: json["code"] == null ? null : json["code"],
        message: json["message"] == null ? null : json["message"],
        farmer: json["data"] == null ? null : Farmer.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "message": message == null ? null : message,
        "data": farmer == null ? null : farmer.toJson(),
      };
}

class Farmer {
  Farmer({
    this.id,
    this.fullname,
    this.username,
    this.token,
    this.accountName,
    this.resonanceCode,
    this.bankName,
    this.bankNumber,
    this.balance,
    this.timeout,
    this.debugMode,
    this.reset3G,
    this.connectivity,
    this.userType,
    this.shareLiveStream,
    this.user100App,
    this.checkApp,
    this.isReg,
    this.isLikeSub,
    this.role,
    this.inviteCode,
    this.userInviteCode,
    this.referenceCode,
    this.agentCode,
    this.fblink,
    this.email,
    this.status,
    this.createdAt,
  });

  String id;
  String fullname;
  String username;
  String token;
  String accountName;
  String resonanceCode;
  String bankName;
  String bankNumber;
  int balance;
  String timeout;
  String debugMode;
  String reset3G;
  String connectivity;
  String userType;
  bool shareLiveStream;
  bool user100App;
  bool checkApp;
  bool isReg;
  bool isLikeSub;
  int role;
  String inviteCode;
  String userInviteCode;
  String referenceCode;
  String agentCode;
  String fblink;
  String email;
  String status;
  dynamic createdAt;

  DateTime get ngayRaKhoi => createdAt == null
      ? DateTime.now()
      : (createdAt is String)
          ? DateTime.parse(createdAt)
          : DateTime.fromMillisecondsSinceEpoch(createdAt);

  factory Farmer.fromJson(Map<String, dynamic> json) => Farmer(
        id: json["id"] == null ? null : json["id"],
        fullname: json["fullname"] == null ? null : json["fullname"],
        username: json["username"] == null ? null : json["username"],
        token: json["token"] == null ? null : json["token"],
        accountName: json["AccountName"] == null ? null : json["AccountName"],
        resonanceCode:
            json["ResonanceCode"] == null ? null : json["ResonanceCode"],
        bankName: json["BankName"] == null ? null : json["BankName"],
        bankNumber: json["BankNumber"] == null ? null : json["BankNumber"],
        balance: json["balance"] == null ? null : json["balance"],
        timeout: json["timeout"] == null ? null : json["timeout"],
        debugMode: json["debug_mode"] == null ? null : json["debug_mode"],
        reset3G: json["Reset3G"] == null ? null : json["Reset3G"],
        connectivity:
            json["connectivity"] == null ? null : json["connectivity"],
        userType: json["user_type"] == null ? null : json["user_type"],
        shareLiveStream: json["share_live_stream"] == null
            ? null
            : json["share_live_stream"],
        user100App: json["user_100_app"] == null ? null : json["user_100_app"],
        checkApp: json["check_app"] == null ? null : json["check_app"],
        isReg: json["is_reg"] == null ? null : json["is_reg"],
        isLikeSub: json["isLikeSub"] == null ? null : json["isLikeSub"],
        role: json["role"] == null ? null : json["role"],
        inviteCode: json["invite_code"] == null ? null : json["invite_code"],
        userInviteCode:
            json["user_invite_code"] == null ? null : json["user_invite_code"],
        referenceCode:
            json["reference_code"] == null ? null : json["reference_code"],
        agentCode: json["agent_code"] == null ? null : json["agent_code"],
        fblink: json["fblink"] == null ? null : json["fblink"],
        email: json["email"] == null ? null : json["email"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "fullname": fullname == null ? null : fullname,
        "username": username == null ? null : username,
        "token": token == null ? null : token,
        "AccountName": accountName == null ? null : accountName,
        "ResonanceCode": resonanceCode == null ? null : resonanceCode,
        "BankName": bankName == null ? null : bankName,
        "BankNumber": bankNumber == null ? null : bankNumber,
        "balance": balance == null ? null : balance,
        "timeout": timeout == null ? null : timeout,
        "debug_mode": debugMode == null ? null : debugMode,
        "Reset3G": reset3G == null ? null : reset3G,
        "connectivity": connectivity == null ? null : connectivity,
        "user_type": userType == null ? null : userType,
        "share_live_stream": shareLiveStream == null ? null : shareLiveStream,
        "user_100_app": user100App == null ? null : user100App,
        "check_app": checkApp == null ? null : checkApp,
        "is_reg": isReg == null ? null : isReg,
        "isLikeSub": isLikeSub == null ? null : isLikeSub,
        "role": role == null ? null : role,
        "invite_code": inviteCode == null ? null : inviteCode,
        "user_invite_code": userInviteCode == null ? null : userInviteCode,
        "reference_code": referenceCode == null ? null : referenceCode,
        "agent_code": agentCode == null ? null : agentCode,
        "fblink": fblink == null ? null : fblink,
        "email": email == null ? null : email,
        "status": status == null ? null : status,
        "created_at": createdAt == null ? null : createdAt,
      };
}
