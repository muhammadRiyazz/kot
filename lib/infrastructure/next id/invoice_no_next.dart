import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:restaurant_kot/domain/cus/customer_model.dart';
import 'package:restaurant_kot/infrastructure/next%20id/appentydata.dart';

String nextinvoiceNo(
    {required String result, required CustomerDetails selectCustomer}) {
  log('nextinvoiceNo calling --');
  String invocieNo = '';

  List<dynamic> jsonData = jsonDecode(result);
    log('nextinvoiceNo calling --  $result');

  String valueInsideBraces = jsonData[0][''].toString();
  if (selectCustomer.customerType == 'BtoB') {
        log('BtoB --');

    String idcode = appentydataresult[0].invoiceNumberBtoB;

    if (valueInsideBraces != 'null') {
      invocieNo = '$idcode${int.parse(valueInsideBraces) + 1}';
    } else {
      invocieNo = '${idcode}1';
    }
  } else if (selectCustomer.customerType == 'BtoC') {
    String idcode = appentydataresult[0].invoiceNumberBtoC;

    if (valueInsideBraces != 'null') {
      invocieNo = '$idcode${int.parse(valueInsideBraces) + 1}';
    } else {
      invocieNo = '${idcode}1';
    }
  }
  log(invocieNo);

  return invocieNo;
}
