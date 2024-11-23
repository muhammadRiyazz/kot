import 'package:intl/intl.dart';

dynamic getDateTime() {
  // Get current DateTime
  final now = DateTime.now();

  // Format DateTime to match the required format
  var formattedDateTime = DateFormat('yyyy-MM-dd HH:mm:ss.SSS').format(now);

  return formattedDateTime;
}

