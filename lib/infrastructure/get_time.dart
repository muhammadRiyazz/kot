import 'package:intl/intl.dart';

dynamic getDateTime() {
  // Get current DateTime
  final now = DateTime.now();

  // Format DateTime to match the required format
  var formattedDateTime = DateFormat('yyyy-MM-dd HH:mm:ss.SSS').format(now);

  return formattedDateTime;
}


dynamic entyDateTime() {
  // Get current DateTime
  final now = DateTime.now();

  // Create a new DateTime with the time set to 00:00:00.000
  final midnight = DateTime(now.year, now.month, now.day);

  // Format DateTime to match the required format
  var formattedDateTime = DateFormat('yyyy-MM-dd HH:mm:ss.SSS').format(midnight);

  return formattedDateTime;
}
 