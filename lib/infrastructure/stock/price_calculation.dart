import 'dart:developer';

import 'package:restaurant_kot/domain/item/kot_item_model.dart';
import 'package:restaurant_kot/domain/stock/stock_model.dart';
import 'package:restaurant_kot/infrastructure/initalfetchdata/taxtype.dart';

double safeParseDouble(dynamic value) {
  if (value is String) {
    return double.tryParse(value) ?? 0.0;
  } else if (value is double) {
    return value;
  } else {
    return 0.0; // Default value if the type is unexpected
  }
}

double calculateBasicRate({
  required Map<String, dynamic> element,
  required bool isAc,
}) {
  double basicRate = 0.0;

  if (getCategory(element['pdtcode']) == 'GOODS') {
    // For goods, directly use the sale amount with tax
    basicRate = safeParseDouble(element['unitprice']);
  } else {
    basicRate = safeParseDouble(element['unitprice']);
    // For services, check the tax type
    // if (inc!) {
    //   basicRate = safeParseDouble(element['unitprice']);
    // } else {
    //   double gstPer = safeParseDouble(element['venIGST']);
    //   double cessPer = safeParseDouble(element['CessRate']);
    //   double totalTaxPer = gstPer + cessPer;
    //   double rate = safeParseDouble(element['unitprice']);
    //   double totalTaxAmount = (rate * totalTaxPer) / 100;
    //   basicRate = rate + totalTaxAmount;
    // }
  }

  return basicRate;
}

double parcelRateclc({required kotItem item, required dynamic pickuprate}) {
  double basicRate = 0.0;

  if (item.serOrGoods == 'GOODS') {
    log('GOODS---');
    // For goods, directly use the sale amount with tax
    basicRate = item.basicRate;
  } else {
    log(' non GOODS---');

    // For services, check the tax type
    if (inc!) {
      log(' inc----');
      basicRate = safeParseDouble(pickuprate);
    } else {
      log('non inc----');

      basicRate = safeParseDouble(pickuprate);

      // double gstPer = safeParseDouble(element.vendorIGST);
      // double cessPer = safeParseDouble(element.cessRate);
      // double totalTaxPer = gstPer + cessPer;

      // if (isAc) {
      //   // AC rate calculation
      //   double acRate = safeParseDouble(element.dineInACRate);
      //           log('dineInACRate--- ${element.dineInACRate.toString()}');

      //   log('acRate--- ${acRate.toString()}');
      //   double totalTaxAmount = (acRate * totalTaxPer) / 100;
      //   basicRate = acRate + totalTaxAmount;
      // } else {
      //           double nonAcRate = safeParseDouble(element.dineInNonACRate);

      //   log('dineInNonACRate--- ${element.dineInNonACRate.toString()}');

      //   log('nonAcRate--- ${nonAcRate.toString()}');
      //   // Non-AC rate calculation
      //   double totalTaxAmount = (nonAcRate * totalTaxPer) / 100;
      //   basicRate = nonAcRate + totalTaxAmount;
      // }
    }
  }
  // log(basicRate.toString());
  return basicRate;
}

double basicRateclc({
  required Product element,
  required bool isAc,
}) {
  double basicRate = 0.0;

  if (element.serOrGoods == 'GOODS') {
    log('GOODS---');
    // For goods, directly use the sale amount with tax
    if (inc!) {
      basicRate = safeParseDouble(element.saleAmount);
    } else {
      basicRate = safeParseDouble(element.saleAmount);

      // double gst = double.tryParse(element.vendorIGST.toString()) ?? 0.00;
      // double cess = double.tryParse(element.cessRate.toString()) ?? 0.00;

      // double taxp = gst + cess;

      // double percentage = (taxp / 100) * safeParseDouble(element.saleAmount);

      // basicRate = safeParseDouble(element.saleAmount) + percentage;
    }
  } else {
    log(' non GOODS---');

    // For services, check the tax type
    if (inc!) {
      log(' inc----');

      basicRate = isAc
          ? safeParseDouble(element.dineInACRate)
          : safeParseDouble(element.dineInNonACRate);
    } else {
      log('non inc----');

      basicRate = isAc
          ? safeParseDouble(element.dineInACRate)
          : safeParseDouble(element.dineInNonACRate);

      // double gstPer = safeParseDouble(element.vendorIGST);
      // double cessPer = safeParseDouble(element.cessRate);
      // double totalTaxPer = gstPer + cessPer;

      // if (isAc) {
      //   // AC rate calculation
      //   double acRate = safeParseDouble(element.dineInACRate);
      //           log('dineInACRate--- ${element.dineInACRate.toString()}');

      //   log('acRate--- ${acRate.toString()}');
      //   double totalTaxAmount = (acRate * totalTaxPer) / 100;
      //   basicRate = acRate + totalTaxAmount;
      // } else {
      //           double nonAcRate = safeParseDouble(element.dineInNonACRate);

      //   log('dineInNonACRate--- ${element.dineInNonACRate.toString()}');

      //   log('nonAcRate--- ${nonAcRate.toString()}');
      //   // Non-AC rate calculation
      //   double totalTaxAmount = (nonAcRate * totalTaxPer) / 100;
      //   basicRate = nonAcRate + totalTaxAmount;
      // }
    }
  }
  // log(basicRate.toString());
  return basicRate;
}

double taxableAmountcalculation({
  required Product element,
  required bool isAc,
}) {
  log('taxableAmountcalculation---');
  double taxableAmount = 0.0;

  if (element.serOrGoods == 'GOODS') {
    if (inc!) {
      double gstPer = safeParseDouble(element.tax);
      double cessPer = safeParseDouble(element.cessRate);
      log('gstPer--- $gstPer');
      log('cessPer--- $cessPer');

      double totalTaxPer = gstPer + cessPer;
      log('totalTaxPer--- $totalTaxPer');

      double rate = safeParseDouble(element.saleAmount);
      taxableAmount = rate / (1 + (totalTaxPer / 100));
      log(' rate---------------${rate.toString()}');
      log('taxableAmount ---------------${taxableAmount.toString()}');
    } else {
      taxableAmount = safeParseDouble(element.saleAmount);
    }
  } else {
    // For services, check the tax type
    if (inc!) {
      double gstPer = safeParseDouble(element.tax);
      double cessPer = safeParseDouble(element.cessRate);
      log('gstPer--- $gstPer');
      log('cessPer--- $cessPer');

      double totalTaxPer = gstPer + cessPer;
      log('totalTaxPer--- $totalTaxPer');

      double rate = isAc
          ? safeParseDouble(element.dineInACRate)
          : safeParseDouble(element.dineInNonACRate);
      taxableAmount = rate / (1 + (totalTaxPer / 100));
      log(' rate---------------${rate.toString()}');
      log('taxableAmount ---------------${taxableAmount.toString()}');
    } else {
      taxableAmount = isAc
          ? safeParseDouble(element.dineInACRate)
          : safeParseDouble(element.dineInNonACRate);
    }
  }

  return taxableAmount;
}

double updatetaxableAmountcalculation(
    {required kotItem element, required double amt}) {
  log('taxableAmountcalculation---');
  double taxableAmount = 0.0;

  // if (element.serOrGoods == 'GOODS') {
  // For goods, directly use the sale amount with tax
  double gstPer = safeParseDouble(element.gstPer);
  double cessPer = safeParseDouble(element.cessPer);
  log('gstPer--- $gstPer');
  log('cessPer--- $cessPer');

  double totalTaxPer = gstPer + cessPer;
  log('totalTaxPer--- $totalTaxPer');

  double rate = amt;
  taxableAmount = rate / (1 + (totalTaxPer / 100));
  // } else {
  //   // For services, check the tax type
  //   if (inc!) {
  //     double gstPer = safeParseDouble(element.tax);
  //     double cessPer = safeParseDouble(element.cessRate);
  //     log('gstPer--- $gstPer');
  //     log('cessPer--- $cessPer');

  //     double totalTaxPer = gstPer + cessPer;
  //     log('totalTaxPer--- $totalTaxPer');

  //     double rate = isAc
  //         ? safeParseDouble(element.dineInACRate)
  //         : safeParseDouble(element.dineInNonACRate);
  //     taxableAmount = rate / (1 + (totalTaxPer / 100));
  //     log(' rate---------------${rate.toString()}');
  //     log('taxableAmount ---------------${taxableAmount.toString()}');
  //   } else {
  //     taxableAmount = isAc
  //         ? safeParseDouble(element.dineInACRate)
  //         : safeParseDouble(element.dineInNonACRate);
  //   }
  // }

  return taxableAmount;
}

double parceltaxableAmountcalculation(
    {required kotItem item, required dynamic pickuprate}) {
  log('taxableAmountcalculation---');
  double taxableAmount = 0.0;

  if (item.serOrGoods == 'GOODS') {
    // For goods, directly use the sale amount with tax

    double gstPer = safeParseDouble(item.gstPer);
    double cessPer = safeParseDouble(item.cessPer);
    log('gstPer--- $gstPer');
    log('cessPer--- $cessPer');

    double totalTaxPer = gstPer + cessPer;
    log('totalTaxPer--- $totalTaxPer');

    double rate = safeParseDouble(item.basicRate);
    taxableAmount = rate / (1 + (totalTaxPer / 100));
    log(' rate---------------${rate.toString()}');
    log('taxableAmount ---------------${taxableAmount.toString()}');
  } else {
    // For services, check the tax type
    if (inc!) {
      // double gstPer = safeParseDouble(item.gstPer);
      // double cessPer = safeParseDouble(item.gstPer);
      // log('gstPer--- $gstPer');
      // log('cessPer--- $cessPer');

      // double totalTaxPer = gstPer + cessPer;
      // log('totalTaxPer--- $totalTaxPer');

      // double rate = safeParseDouble(pickuprate);
      // taxableAmount = rate / (1 + (totalTaxPer / 100));
      // log(' rate---------------${rate.toString()}');
      // log('taxableAmount ---------------${taxableAmount.toString()}');

      double gstPer = safeParseDouble(item.gstPer);

      double cessPer = safeParseDouble(item.cessPer);
      double totalTaxPer = gstPer + cessPer;
      double rate = safeParseDouble(pickuprate);
      taxableAmount = rate / (1 + (totalTaxPer / 100));
      log('gstPer--- $gstPer');
      log('cessPer--- $cessPer');

      log('totalTaxPer--- $totalTaxPer');

      log(' rate---------------${rate.toString()}');
      log('taxableAmount ---------------${taxableAmount.toString()}');
    } else {
      taxableAmount = safeParseDouble(pickuprate);
    }
  }

  return taxableAmount;
}

double calculationtaxableAmount({
  required Map<String, dynamic> element,
  required double rateAcNonAc,
}) {
  double taxableAmount = 0.0;

  if (getCategory(element['pdtcode']) == 'GOODS') {


 if (inc!) {
      double gstPer = safeParseDouble(element['venIGST']);

      double cessPer = safeParseDouble(element['CessPercentage']);
      double totalTaxPer = gstPer + cessPer;
      double rate = rateAcNonAc;
      taxableAmount = rate / (1 + (totalTaxPer / 100));
      log('gstPer--- $gstPer');
      log('cessPer--- $cessPer');

      log('totalTaxPer--- $totalTaxPer');

      log(' rate---------------${rate.toString()}');
      log('taxableAmount ---------------${taxableAmount.toString()}');
      
    } else {
    taxableAmount = rateAcNonAc;
    }


  
  } else {
    // For services, check the tax type
    if (inc == true) {
      double gstPer = safeParseDouble(element['venIGST']);

      double cessPer = safeParseDouble(element['CessPercentage']);
      double totalTaxPer = gstPer + cessPer;
      double rate = rateAcNonAc;
      taxableAmount = rate / (1 + (totalTaxPer / 100));
      log('gstPer--- $gstPer');
      log('cessPer--- $cessPer');

      log('totalTaxPer--- $totalTaxPer');

      log(' rate---------------${rate.toString()}');
      log('taxableAmount ---------------${taxableAmount.toString()}');
    } else {
      taxableAmount = rateAcNonAc;
    }
  }
  log('$taxableAmount    --------------------');
  return taxableAmount;
}

String getCategory(String code) {
  final regex = RegExp(r'^[A-Z]+'); // Regular expression to capture the prefix
  final match = regex.firstMatch(code);
  String prefix = match?.group(0) ?? ''; // Extracted prefix

  // Map the prefix to the corresponding category
  switch (prefix) {
    case 'PDT':
      return 'GOODS';
    case 'SER':
      return 'SER';
    default:
      return 'Unknown Category';
  }
}
