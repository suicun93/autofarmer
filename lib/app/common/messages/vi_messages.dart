import 'lookupmessages.dart';

/// Vietnamese messages
class ViMessages implements LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => 'trước';
  @override
  String suffixFromNow() => 'nữa';
  @override
  String lessThanOneMinute(int seconds) => 'một phút';
  @override
  String aboutAMinute(int minutes) => 'khoảng một phút';
  @override
  String minutes(int minutes) => '$minutes phút';
  @override
  String aboutAnHour(int minutes) => 'khoảng 1 tiếng';
  @override
  String hours(int hours) => '$hours tiếng';
  @override
  String aDay(int hours) => 'một ngày';
  @override
  String days(int days) => '$days ngày';
  @override
  String aboutAMonth(int days) => 'khoảng 1 tháng';
  @override
  String months(int months) => '$months tháng';
  @override
  String aboutAYear(int year) => 'khoảng 1 năm';
  @override
  String years(int years) => '$years năm';
  @override
  String wordSeparator() => ' ';
}

/// Vietnamese short messages
class ViShortMessages implements LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'Online';
  @override
  String aboutAMinute(int minutes) => '~1 phút';
  @override
  String minutes(int minutes) => '${minutes} phút';
  @override
  String aboutAnHour(int minutes) => '~1 giờ';
  @override
  String hours(int hours) => '${hours} giờ';
  @override
  String aDay(int hours) => '~1 ngày';
  @override
  String days(int days) => '$days ngày';
  @override
  String aboutAMonth(int days) => '~1 tháng';
  @override
  String months(int months) => '$months tháng';
  @override
  String aboutAYear(int year) => '~1 năm';
  @override
  String years(int years) => '$years năm';
  @override
  String wordSeparator() => ' ';
}
