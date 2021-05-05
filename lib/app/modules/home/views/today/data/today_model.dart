class TodayResponse {
  TodayResponse({
    this.code,
    this.message,
    this.listService,
  });

  int code;
  String message;
  List<Service> listService;

  factory TodayResponse.fromJson(Map<String, dynamic> json) => TodayResponse(
        code: json['code'] == null ? null : json['code'],
        message: json['message'] == null ? null : json['message'],
        listService: json['data'] == null
            ? null
            : List<Service>.from(json['data'].map((x) => Service.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'code': code == null ? null : code,
        'message': message == null ? null : message,
        'data': listService == null
            ? null
            : List<dynamic>.from(listService.map((x) => x.toJson())),
      };
}

class Service {
  Service({
    this.id,
    this.token,
    this.amount,
    this.status,
    this.total,
    this.type,
    this.price,
    this.finishTime,
    this.closedTime,
    this.serviceCode,
    this.updatedAt,
  });

  String id;
  String token;
  int amount;
  Message status;
  int total;
  Type type;
  int price;
  int finishTime;
  int closedTime;
  String serviceCode;
  int updatedAt;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json['id'] == null ? null : json['id'],
        token: json['token'] == null ? null : json['token'],
        amount: json['amount'] == null ? null : json['amount'],
        status:
            json['status'] == null ? null : messageValues.map[json['status']],
        total: json['total'] == null ? null : json['total'],
        type: json['type'] == null ? null : typeValues.map[json['type']],
        price: json['price'] == null ? null : json['price'],
        finishTime: json['finishTime'] == null ? null : json['finishTime'],
        closedTime: json['closedTime'] == null ? null : json['closedTime'],
        serviceCode: json['service_code'] == null ? null : json['service_code'],
        updatedAt: json['updated_at'] == null ? null : json['updated_at'],
      );

  Map<String, dynamic> toJson() => {
        'id': id == null ? null : id,
        'token': token == null ? null : token,
        'amount': amount == null ? null : amount,
        'status': status == null ? null : messageValues.reverse[status],
        'total': total == null ? null : total,
        'type': type == null ? null : typeValues.reverse[type],
        'price': price == null ? null : price,
        'finishTime': finishTime == null ? null : finishTime,
        'closedTime': closedTime == null ? null : closedTime,
        'service_code': serviceCode == null ? null : serviceCode,
        'updated_at': updatedAt == null ? null : updatedAt,
      };
}

enum Message { ACTIVE, SUCCESS, PAUSE }

final messageValues = EnumValues({
  'Active': Message.ACTIVE,
  'Pause': Message.PAUSE,
  'Success': Message.SUCCESS
});

enum Type { LIKEPAGE, BUFFLIKE, FOLLOW, VIPLIKE_SERVICE, BUFFCOMMENT }

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
