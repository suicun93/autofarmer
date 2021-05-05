class HistoryResponse {
  HistoryResponse({
    this.code,
    this.message,
    this.listHistory,
  });

  int code;
  String message;
  List<History> listHistory;

  factory HistoryResponse.fromJson(Map<String, dynamic> json) =>
      HistoryResponse(
        code: json["code"] == null ? null : json["code"],
        message: json["message"] == null ? null : json["message"],
        listHistory: json["data"] == null
            ? null
            : List<History>.from(json["data"].map((x) => History.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "message": message == null ? null : message,
        "data": listHistory == null
            ? null
            : List<dynamic>.from(listHistory.map((x) => x.toJson())),
      };
}

class History {
  History({
    this.id,
    this.closedTime,
    this.token,
    this.amount,
    this.status,
    this.accountName,
    this.bankName,
    this.bankNumber,
    this.resonanceCode,
    this.fullname,
    this.username,
    this.statusNumber,
    this.updatedDate,
  });

  String id;
  int closedTime;
  dynamic token;
  int amount;
  dynamic status;
  dynamic accountName;
  dynamic bankName;
  String bankNumber;
  String resonanceCode;
  dynamic fullname;
  String username;
  int statusNumber;
  DateTime updatedDate;

  factory History.fromJson(Map<String, dynamic> json) => History(
        id: json["id"] == null ? null : json["id"],
        closedTime: json["closedTime"] == null ? null : json["closedTime"],
        token: json["token"] == null ? null : json["token"],
        amount: json["amount"] == null ? null : json["amount"],
        status: json["status"] == null ? null : json["status"],
        accountName: json["AccountName"] == null ? null : json["AccountName"],
        bankName: json["BankName"] == null ? null : json["BankName"],
        bankNumber: json["BankNumber"] == null ? null : json["BankNumber"],
        resonanceCode:
            json["ResonanceCode"] == null ? null : json["ResonanceCode"],
        fullname: json["fullname"] == null ? null : json["fullname"],
        username: json["username"] == null ? null : json["username"],
        statusNumber: json["statusNumber"] == null ? 0 : json["statusNumber"],
        updatedDate: json["updated_date"] == null
            ? null
            : DateTime.parse(json["updated_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "closedTime": closedTime == null ? null : closedTime,
        "token": token == null ? null : token,
        "amount": amount == null ? null : amount,
        "status": status == null ? null : status,
        "AccountName": accountName == null ? null : accountName,
        "BankName": bankName == null ? null : bankName,
        "BankNumber": bankNumber == null ? null : bankNumber,
        "ResonanceCode": resonanceCode == null ? null : resonanceCode,
        "fullname": fullname == null ? null : fullname,
        "username": username == null ? null : username,
        "statusNumber": statusNumber == null ? null : statusNumber,
        "updated_date":
            updatedDate == null ? null : updatedDate.toIso8601String(),
      };
}
