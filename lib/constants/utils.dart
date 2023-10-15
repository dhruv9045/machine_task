import 'package:intl/intl.dart';

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

String selectDate(DateTime? dateTime) {
  String inputDate = '${dateTime}'; // Your input date
  DateTime date = DateFormat('yyyy-MM-dd').parse(inputDate);
  String formattedDate = DateFormat('dd MMM yyyy').format(date);
  return formattedDate;
}

String selectTime(DateTime? dateTime) {
  String formattedDate = DateFormat.Hm().format(dateTime!);
  return formattedDate;
}

