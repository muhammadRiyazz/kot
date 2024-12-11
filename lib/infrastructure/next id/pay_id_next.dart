import 'dart:convert';
import 'dart:developer';

String nextpayNo({
  required String result,
}) {
  String payid = '';

  List<dynamic> jsonData = jsonDecode(result);
  String valueInsideBraces = jsonData[0][''].toString();
if (valueInsideBraces!='null') {
  payid = 'PID${int.parse(valueInsideBraces) + 1}';



}else{
            payid = 'PID1';

}
  // log(payid);
  return payid;
}
