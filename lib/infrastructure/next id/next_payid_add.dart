import 'dart:convert';
import 'dart:developer';

String nextpaymentID({
  required String result,
}) {
  String payid = '';

  List<dynamic> jsonData = jsonDecode(result);
  String valueInsideBraces = jsonData[0][''].toString();
  if (valueInsideBraces != 'null') {
    payid = 'PII${int.parse(valueInsideBraces) + 1}';
  } else {
    payid = 'PII0';
  }
  log(payid);
  return payid;
}
