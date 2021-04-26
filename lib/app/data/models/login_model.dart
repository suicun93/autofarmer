// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.code,
    this.message,
    this.user,
  });

  int code;
  String message;
  User user;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        code: json['code'] == null ? null : json['code'],
        message: json['message'] == null ? null : json['message'],
        user: json['data'] == null ? null : User.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'code': code == null ? null : code,
        'message': message == null ? null : message,
        'data': user == null ? null : user.toJson(),
      };
}

class User {
  User({
    this.accountName,
    this.bankName,
    this.bankNumber,
    this.connectivity,
    this.resonanceCode,
    this.agentCode,
    this.balance,
    this.checkApp,
    this.email,
    this.fblink,
    this.fullname,
    this.id,
    this.isLikeSub,
    this.isReg,
    this.role,
    this.shareLiveStream,
    this.status,
    this.token,
    this.user100App,
    this.userInviteCode,
    this.userToken,
    this.username,
  });

  String accountName;
  String bankName;
  String bankNumber;
  String connectivity;
  String resonanceCode;
  String agentCode;
  int balance;
  bool checkApp;
  String email;
  String fblink;
  String fullname;
  String id;
  bool isLikeSub;
  bool isReg;
  int role;
  bool shareLiveStream;
  String status;
  String token;
  bool user100App;
  String userInviteCode;
  String userToken;
  String username;

  factory User.fromJson(Map<String, dynamic> json) => User(
        accountName: json['AccountName'] == null ? null : json['AccountName'],
        bankName: json['BankName'] == null ? null : json['BankName'],
        bankNumber: json['BankNumber'] == null ? null : json['BankNumber'],
        connectivity:
            json['Connectivity'] == null ? null : json['Connectivity'],
        resonanceCode:
            json['ResonanceCode'] == null ? null : json['ResonanceCode'],
        agentCode: json['agent_code'] == null ? null : json['agent_code'],
        balance: json['balance'] == null ? null : json['balance'],
        checkApp: json['check_app'] == null ? null : json['check_app'],
        email: json['email'] == null ? null : json['email'],
        fblink: json['fblink'] == null ? null : json['fblink'],
        fullname: json['fullname'] == null ? null : json['fullname'],
        id: json['id'] == null ? null : json['id'],
        isLikeSub: json['isLikeSub'] == null ? null : json['isLikeSub'],
        isReg: json['is_reg'] == null ? null : json['is_reg'],
        role: json['role'] == null ? null : json['role'],
        shareLiveStream: json['share_live_stream'] == null
            ? null
            : json['share_live_stream'],
        status: json['status'] == null ? null : json['status'],
        token: json['token'] == null ? null : json['token'],
        user100App: json['user_100_app'] == null ? null : json['user_100_app'],
        userInviteCode:
            json['user_invite_code'] == null ? null : json['user_invite_code'],
        userToken: json['user_token'] == null ? null : json['user_token'],
        username: json['username'] == null ? null : json['username'],
      );

  Map<String, dynamic> toJson() => {
        'AccountName': accountName == null ? null : accountName,
        'BankName': bankName == null ? null : bankName,
        'BankNumber': bankNumber == null ? null : bankNumber,
        'Connectivity': connectivity == null ? null : connectivity,
        'ResonanceCode': resonanceCode == null ? null : resonanceCode,
        'agent_code': agentCode == null ? null : agentCode,
        'balance': balance == null ? null : balance,
        'check_app': checkApp == null ? null : checkApp,
        'email': email == null ? null : email,
        'fblink': fblink == null ? null : fblink,
        'fullname': fullname == null ? null : fullname,
        'id': id == null ? null : id,
        'isLikeSub': isLikeSub == null ? null : isLikeSub,
        'is_reg': isReg == null ? null : isReg,
        'role': role == null ? null : role,
        'share_live_stream': shareLiveStream == null ? null : shareLiveStream,
        'status': status == null ? null : status,
        'token': token == null ? null : token,
        'user_100_app': user100App == null ? null : user100App,
        'user_invite_code': userInviteCode == null ? null : userInviteCode,
        'user_token': userToken == null ? null : userToken,
        'username': username == null ? null : username,
      };
}
