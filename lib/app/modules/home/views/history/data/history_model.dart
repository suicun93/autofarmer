HistoryResponse historyResponseFromJson(Map<String, dynamic> str) =>
    HistoryResponse.fromJson(str);

Map<String, dynamic> historyResponseToJson(HistoryResponse data) =>
    data.toJson();

class HistoryResponse {
  HistoryResponse({
    this.result,
  });

  Result result;

  factory HistoryResponse.fromJson(Map<String, dynamic> json) =>
      HistoryResponse(
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result == null ? null : result.toJson(),
      };
}

class Result {
  Result({
    this.success,
    this.listHistory,
  });

  bool success;
  List<History> listHistory;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        success: json["success"] == null ? null : json["success"],
        listHistory: json["data"] == null
            ? null
            : List<History>.from(json["data"].map((x) => History.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
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
    this.closedTimeIso,
    this.countServiceCode,
    this.percent,
    this.status,
    this.statusNumber,
    this.total,
    this.totalAmount,
    this.totalDevice,
    this.totalLog,
    this.updatedAt,
    this.accountName,
    this.bankName,
    this.bankNumber,
    this.resonanceCode,
    this.fullname,
    this.username,
    this.amountWarranty,
    this.totalLogCheckpoint,
    this.updateAt,
    this.createdAt,
  });

  String id;
  int closedTime;
  dynamic token;
  int amount;
  String closedTimeIso;
  int countServiceCode;
  int percent;
  dynamic status;
  int statusNumber;
  int total;
  int totalAmount;
  int totalDevice;
  int totalLog;
  int updatedAt;
  dynamic accountName;
  dynamic bankName;
  String bankNumber;
  String resonanceCode;
  dynamic fullname;
  String username;
  int amountWarranty;
  int totalLogCheckpoint;
  int updateAt;
  int createdAt;

  factory History.fromJson(Map<String, dynamic> json) => History(
        id: json["_id"] == null ? null : json["_id"],
        closedTime: json["closedTime"] == null ? null : json["closedTime"],
        token: json["token"] == null ? null : json["token"],
        amount: json["amount"] == null ? null : json["amount"],
        closedTimeIso:
            json["closedTimeISO"] == null ? null : json["closedTimeISO"],
        countServiceCode: json["count_service_code"] == null
            ? null
            : json["count_service_code"],
        percent: json["percent"] == null ? null : json["percent"],
        status: json["status"] == null ? null : json["status"],
        statusNumber:
            json["statusNumber"] == null ? null : json["statusNumber"],
        total: json["total"] == null ? null : json["total"],
        totalAmount: json["total_amount"] == null ? null : json["total_amount"],
        totalDevice: json["total_device"] == null ? null : json["total_device"],
        totalLog: json["total_log"] == null ? null : json["total_log"],
        updatedAt: json["updated_at"] == null ? null : json["updated_at"],
        accountName: json["AccountName"] == null ? null : json["AccountName"],
        bankName: json["BankName"] == null ? null : json["BankName"],
        bankNumber: json["BankNumber"] == null ? null : json["BankNumber"],
        resonanceCode:
            json["ResonanceCode"] == null ? null : json["ResonanceCode"],
        fullname: json["fullname"] == null ? null : json["fullname"],
        username: json["username"] == null ? null : json["username"],
        amountWarranty:
            json["amount_warranty"] == null ? null : json["amount_warranty"],
        totalLogCheckpoint: json["total_log_checkpoint"] == null
            ? null
            : json["total_log_checkpoint"],
        updateAt: json["update_at"] == null ? null : json["update_at"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "closedTime": closedTime == null ? null : closedTime,
        "token": token == null ? null : token,
        "amount": amount == null ? null : amount,
        "closedTimeISO": closedTimeIso == null ? null : closedTimeIso,
        "count_service_code":
            countServiceCode == null ? null : countServiceCode,
        "percent": percent == null ? null : percent,
        "status": status == null ? null : status,
        "statusNumber": statusNumber == null ? null : statusNumber,
        "total": total == null ? null : total,
        "total_amount": totalAmount == null ? null : totalAmount,
        "total_device": totalDevice == null ? null : totalDevice,
        "total_log": totalLog == null ? null : totalLog,
        "updated_at": updatedAt == null ? null : updatedAt,
        "AccountName": accountName == null ? null : accountName,
        "BankName": bankName == null ? null : bankName,
        "BankNumber": bankNumber == null ? null : bankNumber,
        "ResonanceCode": resonanceCode == null ? null : resonanceCode,
        "fullname": fullname == null ? null : fullname,
        "username": username == null ? null : username,
        "amount_warranty": amountWarranty == null ? null : amountWarranty,
        "total_log_checkpoint":
            totalLogCheckpoint == null ? null : totalLogCheckpoint,
        "update_at": updateAt == null ? null : updateAt,
        "created_at": createdAt == null ? null : createdAt,
      };
}
