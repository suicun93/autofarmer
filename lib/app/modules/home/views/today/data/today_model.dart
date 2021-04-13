TodayResponse todayResponseFromJson(Map<String, dynamic> str) =>
    TodayResponse.fromJson(str);

Map<String, dynamic> todayResponseToJson(TodayResponse data) => data.toJson();

class TodayResponse {
  TodayResponse({
    this.result,
  });

  Result result;

  factory TodayResponse.fromJson(Map<String, dynamic> json) => TodayResponse(
        result: json['result'] == null ? null : Result.fromJson(json['result']),
      );

  Map<String, dynamic> toJson() => {
        'result': result == null ? null : result.toJson(),
      };
}

class Result {
  Result({
    this.success,
    this.listService,
    this.total,
  });

  bool success;
  List<Service> listService;
  int total;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        success: json['success'] == null ? null : json['success'],
        listService: json['data'] == null
            ? null
            : List<Service>.from(json['data'].map((x) => Service.fromJson(x))),
        total: json['total'] == null ? null : json['total'],
      );

  Map<String, dynamic> toJson() => {
        'success': success == null ? null : success,
        'data': listService == null
            ? null
            : List<dynamic>.from(listService.map((x) => x.toJson())),
        'total': total == null ? null : total,
      };
}

class Service {
  Service({
    this.id,
    this.serviceCode,
    this.token,
    this.amount,
    this.closedTime,
    this.closedTimeIso,
    this.finishTime,
    this.finishTimeIso,
    this.price,
    this.status,
    this.total,
    this.type,
    this.updatedAt,
  });

  String id;
  String serviceCode;
  String token;
  int amount;
  int closedTime;
  DateTime closedTimeIso;
  int finishTime;
  DateTime finishTimeIso;
  int price;
  Status status;
  int total;
  Type type;
  int updatedAt;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json['_id'] == null ? null : json['_id'],
        serviceCode: json['service_code'] == null ? null : json['service_code'],
        token: json['token'] == null ? null : json['token'],
        amount: json['amount'] == null ? null : json['amount'],
        closedTime: json['closedTime'] == null ? null : json['closedTime'],
        closedTimeIso: json['closedTimeISO'] == null
            ? null
            : DateTime.parse(json['closedTimeISO']),
        finishTime: json['finishTime'] == null ? null : json['finishTime'],
        finishTimeIso: json['finishTimeISO'] == null
            ? null
            : DateTime.parse(json['finishTimeISO']),
        price: json['price'] == null ? null : json['price'],
        status:
            json['status'] == null ? null : statusValues.map[json['status']],
        total: json['total'] == null ? null : json['total'],
        type: json['type'] == null ? null : typeValues.map[json['type']],
        updatedAt: json['updated_at'] == null ? null : json['updated_at'],
      );

  Map<String, dynamic> toJson() => {
        '_id': id == null ? null : id,
        'service_code': serviceCode == null ? null : serviceCode,
        'token': token == null
            ? null
            : null
                ? null
                : token,
        'amount': amount == null ? null : amount,
        'closedTime': closedTime == null ? null : closedTime,
        'closedTimeISO':
            closedTimeIso == null ? null : closedTimeIso.toIso8601String(),
        'finishTime': finishTime == null ? null : finishTime,
        'finishTimeISO':
            finishTimeIso == null ? null : finishTimeIso.toIso8601String(),
        'price': price == null ? null : price,
        'status': status == null ? null : statusValues.reverse[status],
        'total': total == null ? null : total,
        'type': type == null ? null : typeValues.reverse[type],
        'updated_at': updatedAt == null ? null : updatedAt,
      };
}

enum Status { SUCCESS, ACTIVE, PAUSE }

final statusValues = EnumValues({
  'Active': Status.ACTIVE,
  'Pause': Status.PAUSE,
  'Success': Status.SUCCESS
});

enum Type { BUFFCOMMENT, BUFFLIKE, FOLLOW, LIKEPAGE, VIPLIKE_SERVICE }

final typeValues = EnumValues({
  'buffcomment': Type.BUFFCOMMENT,
  'bufflike': Type.BUFFLIKE,
  'follow': Type.FOLLOW,
  'likepage': Type.LIKEPAGE,
  'viplikeService': Type.VIPLIKE_SERVICE
});

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
