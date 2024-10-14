import 'package:intl/intl.dart';

String time(DateTime dateTime) {
  // Format the DateTime to 12-hour time with AM/PM
  return DateFormat('hh:mm a').format(dateTime);
}