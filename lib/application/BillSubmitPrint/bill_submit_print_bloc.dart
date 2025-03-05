import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:mssql_connection/mssql_connection.dart';
import 'package:restaurant_kot/core/conn.dart';
import 'package:restaurant_kot/core/printer/network_printer.dart';
import 'package:restaurant_kot/domain/cus/customer_model.dart';
import 'package:restaurant_kot/domain/item/kot_item_model.dart';
import 'package:restaurant_kot/domain/printer/priter_config.dart';
import 'package:restaurant_kot/infrastructure/initalfetchdata/taxtype.dart';
import 'package:restaurant_kot/infrastructure/next%20id/appentydata.dart';
import 'package:restaurant_kot/infrastructure/next%20id/pay_id_next.dart';
import 'package:restaurant_kot/presendation/printer%20ui/bill_print.dart';
part 'bill_submit_print_event.dart';
part 'bill_submit_print_state.dart';
part 'bill_submit_print_bloc.freezed.dart';

class BillSubmitPrintBloc
    extends Bloc<BillSubmitPrintEvent, BillSubmitPrintState> {
  BillSubmitPrintBloc() : super(BillSubmitPrintState.initial()) {
    on<payType>((event, emit) {
      emit(state.copyWith(paytypeValue: event.paytypeValue));
    });
    on<BillPreview>((event, emit) {
      emit(state.copyWith(isLoading: true, billsubmission: false));
      List<kotItem> updatedbillItems = [];

      List<kotItem> billItems = event.items;

      for (var product in billItems) {
        // Find if the product already exists in the updatedbillItems
        var existingProductIndex = updatedbillItems.indexWhere(
          (p) =>
              p.itemCode ==
              product.itemCode, // Compare by unique identifier (itemCode)
        );

        if (existingProductIndex != -1) {
          // If the product exists, create a new updated item
          var existingProduct = updatedbillItems[existingProductIndex];
          var updatedProduct = kotItem(
            updated: existingProduct.updated,

            productImg: existingProduct.productImg,
            parcelOrnot: existingProduct.parcelOrnot,
            cessAmt: existingProduct.cessAmt,
            gstAmt: existingProduct.gstAmt,
            kotno: existingProduct.kotno,
            stock: existingProduct.stock,
            qty: existingProduct.qty + product.qty, // Increase quantity
            serOrGoods: existingProduct.serOrGoods,
            kitchenName: existingProduct.kitchenName,
            itemName: existingProduct.itemName,
            itemCode: existingProduct.itemCode,
            quantity: existingProduct.quantity,
            basicRate: existingProduct.basicRate,
            unitTaxableAmountBeforeDiscount:
                existingProduct.unitTaxableAmountBeforeDiscount,
            unitTaxableAmount: existingProduct.unitTaxableAmount,
            gstPer: existingProduct.gstPer,
            cessPer: existingProduct.cessPer,
          );

          // Replace the existing item with the updated one
          updatedbillItems[existingProductIndex] = updatedProduct;
        } else {
          // If the product does not exist, add it to the list
          updatedbillItems.add(product);
        }
      }

      double subTotal = 0.00;
      double totalAmt = 0.00;
      double tax = 0.00;
      double cess = 0.00;

      for (var element in updatedbillItems) {
        subTotal += element.unitTaxableAmount * element.qty;
        totalAmt += inc!
            ? element.basicRate * element.qty
            : (element.basicRate * element.qty) +
                ((element.unitTaxableAmount * element.gstPer) /
                    100 *
                    element.qty) +
                ((element.unitTaxableAmount * element.cessPer) /
                    100 *
                    element.qty);
        tax += (element.unitTaxableAmount * element.gstPer) / 100 * element.qty;
        cess +=
            (element.unitTaxableAmount * element.cessPer) / 100 * element.qty;
      }

      emit(state.copyWith(
        isLoading: false,
        cess: cess,
        tax: tax,
        subTotal: subTotal,
        printitems: updatedbillItems,
        totalAmt: totalAmt,
        billitems: event.items,
        orderid: event.currentorderid,
        selectedCustomer: event.selectedcustomer,
        table: event.table,
      ));
    });

    on<BillSubmitAndPrint>((event, emit) async {
      log('SubmitBill --- ------------------');
      emit(state.copyWith(
        loading: true,
        billsubmission: false,
        printerstatus: 0,
      ));

      try {
        List<kotItem> billItems = state.billitems;
        for (var element in billItems) {
          log('${element.itemName} ---- ${element.qty} ------- ${element.kotno}');
        }
        CustomerDetails customer = state.selectedCustomer!;
        String invno = '';

        final payStatus = event.paid;
        // var formattedDate = getDateTime();
        final now = DateTime.now();
        final formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss.SSS')
            .format(DateTime(now.year, now.month, now.day));

        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();

        if (!payStatus) {
          // var paidamount = 0.00;

          var creditOrCleared = 'Credit';

          // String query1 =
          //     "SELECT MAX(CONVERT(INT, RIGHT(custominvno, LEN(custominvno)-3)))  FROM dbo.InvoiceAccountDetail WHERE CustomerTYPE='${customer.customerType}'";
          // String? result1 = await connection.getData(query1);

          // String nextinvNo =
          //     nextinvoiceNo(result: result1, selectCustomer: customer);
          // invno = nextinvNo;
          invno = await _fetchAndInsertInvoiceNumber(connection, customer);

          String query2 = """
    UPDATE [dbo].[InvoiceAccountDetail]
    SET 
    cusid = '${customer.cusid}',
    cusname = '${customer.bussinessname}',
    cusnameAddress = '${customer.bussinessaddr}',
    custorcontact = '--',
    cusnameGSTNumber = '${customer.gstno}',
    Invoicedate = '$formattedDate',
    description = '--',
    totalamount = ${state.subTotal!},
    totaltaxamount = ${state.tax!},
    Discountamount = 0.00,
    TotalHavetoPayamount = ${state.totalAmt!},
    totalpaidamount = 0.00,
    balance = ${state.totalAmt!},
    CustomerTYPE = '${customer.customerType}',
    CreditOrCleared = '$creditOrCleared',
    INVtypeState = 'Kerala',
    ShipmenttoAddName = '--',
    ShipmenttoAddress = '--',
    TableNumber = '${state.table!.tableName}',
    SubTotal = ${state.subTotal!},
    BillDiscPER = 0.00,
    BillDiscTotal = 0.00,
    INVnetAmount = ${state.subTotal!},
    INVtotalTAXAmnt = ${state.tax!},
    TotalCessAmount = ${state.cess!},
    ParcelOrNot = 'parcelOrNot',
    BillAC = '--',
    OrderNumber = '${state.orderid!}',
    UserID = '${event.userID}',
    Merged = '${event.mergedorNot}'


    WHERE custominvno = '$invno';
    """;

          logWithTime("Executing query2 to update invoice data...");
          await connection.writeData(query2);

          for (var element in billItems) {
            final venCGST = element.gstPer / 2;
            final venCGSTamt = element.gstAmt / 2;
            final venSGST = element.gstPer / 2;
            final venSGSTamt = element.gstAmt / 2;
            final double totalTaxableAmount =
                element.qty * element.unitTaxableAmount;
            final double totalTaxAmount =
                totalTaxableAmount * (element.gstPer / 100);
            final double totalCessAmount =
                totalTaxableAmount * (element.cessPer / 100);
            final totalamount = inc!
                ? element.qty * element.basicRate
                : (element.qty * element.basicRate) +
                    totalCessAmount +
                    totalTaxAmount;
            String query3 = """INSERT INTO  [dbo].[invoicedetail] (
            invoiceno, invdate,  terms, ordereference, cusid, invoiceto,
            invaddress, shipto, shipaddr, gstno, email, smsno, CustomerTYPE, pdtcode,
            pdtname, HSNCode, discp, pcs, qty, Freeqty, unitprice, itemMRP, Amount,
            ItemDiscPer, ItemDiscAmount, GrossValueAftrITMDisc, ItemBillDiscPER,
            ItemBillDiscAmount, ItemTotalNETAmount, gst, gstamount, Totalamount,
            venIGST, venIGSTamnt, venCGST, venCGSTamnt, venSGST, venSGSTamnt,
            CessPercentage, CessAmount,
            ItemUnitSaleRate, ParcelOrNot, OrderNumber, KOTNumber, UserID
        ) VALUES (
             '$invno', '$formattedDate',
             '--', '--',
            '${customer.cusid}', '${customer.bussinessname}', '--',
            '--', '--', '${customer.gstno}',
            '--', '--', '${customer.customerType}',
            '${element.itemCode}', '${element.itemName}', '--',
            '--', 0.00, ${element.qty},
            0.00, ${element.basicRate},0.00 ,
            ${element.unitTaxableAmount * element.qty}, 0.00, 0.00,
            ${element.unitTaxableAmount * element.qty}, 0.00,
            0.00,  ${element.unitTaxableAmount * element.qty},
             ${element.gstPer}, ${element.gstAmt},  $totalamount,
            ${element.gstPer}, ${element.gstAmt}, $venCGST,
            $venCGSTamt, $venSGST, $venSGSTamt ,
            ${element.cessPer}, ${element.cessAmt},
            ${element.unitTaxableAmount}, '${element.parcelOrnot}', '${state.orderid!}',
           '${element.kotno}', '${event.userID}'
        );
        UPDATE MainStock SET totalstock = (
                   SELECT OpeningStockValue = (
                   (SELECT COALESCE(SUM(qty), 0) FROM Purchasedetail WHERE pdtcode = '${element.itemCode}') +
                  (SELECT COALESCE(SUM(qty), 0) FROM SalesReturnItems WHERE pdtcode = '${element.itemCode}') +
                  (SELECT COALESCE(SUM(qty), 0) FROM StockAdjustmentItems WHERE pdtcode = '${element.itemCode}' AND StockInOrOut = 'In') +
                  (SELECT COALESCE(SUM(StockQty), 0) FROM OpeningStock WHERE ItemCode = '${element.itemCode}') -
                    (SELECT COALESCE(SUM(qty), 0) FROM invoicedetail WHERE pdtcode = '${element.itemCode}') -
                   (SELECT COALESCE(SUM(qty), 0) FROM PurchaseReturnItems WHERE pdtcode = '${element.itemCode}') -
                    (SELECT COALESCE(SUM(qty), 0) FROM StockAdjustmentItems WHERE pdtcode = '${element.itemCode}' AND StockInOrOut = 'Out')
                    )
                     ) WHERE codeorSKU = '${element.itemCode}';
                      """;

            await connection.writeData(query3);

            String updateQuery = '''
         UPDATE  [dbo].[OrderMainDetails]
        SET
            CreditOrPaid = 'Credit',
        BillNumber = '$invno'
          WHERE
           OrderNumber = '${state.orderid}';
            ''';

            log(updateQuery);
            await connection.writeData(updateQuery);
          }
          log('emit calling');
          emit(state.copyWith(
            loading: false,
            billsubmission: true,
            printerstatus: 0,
            invNo: invno,
          ));
          log('print section ----------');

          if (event.billPrint) {
            PrinterConfig printer = event.printer!;

            int printingStatus = 0;

            final List<int> test = await billPrintData(
              cutumer: customer.bussinessname,
              mergedorNot: event.mergedorNot,
              mergedOrders: event.mergedOrders,
              mergedTables: event.mergedTables,
              tax: state.tax!,
              cess: state.cess!,
              netAmount: state.totalAmt!,
              taxable: state.subTotal!,
              items: state.printitems,
              invoiceNo: invno,
              orderNo: state.orderid!,
              tableNo: state.table!.tableName,
            );

            printingStatus = await NetworkPrinter().printTicket(
              test,
              printer.printerName,
            );

            log('Printer response---$printingStatus');

            if (printingStatus == 1) {
              log('Printer status: 2---------');
              emit(state.copyWith(
                isLoading: false,
                printerstatus: 2,
                billsubmission: false,
              ));
            } else {
              log('Printer status: 1---------');
              emit(state.copyWith(
                isLoading: false,
                printerstatus: 1,
                billsubmission: false,
              ));
            }
          } else {
            emit(state.copyWith(
              isLoading: false,
              printerstatus: 1,
              billsubmission: false,
            ));
          }
        } else {
//           logWithTime("Starting database operation");

//           // 1. Start logging for query1
//           logWithTime("Executing query1 to get MAX custom invoice number...");

//           // String query1 =
//           //     "SELECT MAX(CONVERT(INT, RIGHT(custominvno, LEN(custominvno)-3)))  FROM dbo.InvoiceAccountDetail where CustomerTYPE='${customer.customerType}' ";
//           // String? result1 = await connection.getData(query1);
//           // log(result1.toString());

//           // logWithTime("Received result from query1: $result1");

//           // // 2. Calculate next invoice number
//           // logWithTime("Calculating next invoice number...");

//           // String nextinvNo = nextinvoiceNo(
//           //     result: result1, selectCustomer: state.selectedCustomer!);
          // invno = nextinvNo;
          String nextinvNo = await _fetchAndInsertInvoiceNumber(
              connection, state.selectedCustomer!);
          invno = nextinvNo;

          logWithTime("Next invoice number calculated: $nextinvNo");

          // 3. Start logging for query2
          logWithTime("Preparing query2 for inserting invoice data...");
          String query2 = """
  UPDATE [dbo].[InvoiceAccountDetail]
  SET 
    cusid = '${customer.cusid}',
    cusname = '${customer.bussinessname}',
    cusnameAddress = '${customer.bussinessaddr}',
    custorcontact = '--',
    cusnameGSTNumber = '${customer.gstno}',
    Invoicedate = '$formattedDate',
    description = '--',
    totalamount = ${state.subTotal!},
    totaltaxamount = ${state.tax!},
    Discountamount = 0.00,
    TotalHavetoPayamount = ${state.totalAmt!},
    totalpaidamount = ${state.totalAmt!},
    balance = 0.00,
    CustomerTYPE = '${customer.customerType}',
    CreditOrCleared = 'Cleared',
    INVtypeState = 'Kerala',
    ShipmenttoAddName = '--',
    ShipmenttoAddress = '--',
    TableNumber = '${state.table!.tableName}',
    SubTotal = ${state.subTotal!},
    BillDiscPER = 0.00,
    BillDiscTotal = 0.00,
    INVnetAmount = ${state.subTotal!},
    INVtotalTAXAmnt = ${state.tax!},
    TotalCessAmount = ${state.cess!},
    ParcelOrNot = 'parcelOrNot',
    BillAC = '--',
    OrderNumber = '${state.orderid!}',
    UserID = '${event.userID}',
        Merged = '${event.mergedorNot}'

  WHERE custominvno = '$nextinvNo';
""";

          logWithTime("Executing query2 to update invoice data...");
          await connection.writeData(query2);

          // String queryPayorEX =
          //     "SELECT MAX(CONVERT(INT, RIGHT(PayOrExpID, LEN(PayOrExpID)-3)))  FROM dbo.PayorEX  ";
          // String? result2 = await connection.getData(queryPayorEX);
          // log('queryPayorEX ---------------$result2');
          String payidno = await fetchAndInsertPayOrExpID(connection);
          log('queryPapayidnoyorEX ---------------$payidno');

          String query4 = """
    UPDATE [dbo].[PayorEX]
    SET 
        VendIDOreCusID = '${customer.cusid}', 
        VendIDOreCusName = '${customer.bussinessname}', 
        PayOrExpDate = '$formattedDate', 
        CAT = 'sale', 
        paidby = '${state.paytypeValue!}', 
        paidamount = ${state.totalAmt!}, 
        PayCrDr = 'Cr', 
        PayINVid = '$nextinvNo', 
        RootType = 'Sale', 
        OrderNumber = '${state.orderid!}'
    WHERE PayOrExpID = '$payidno'
""";

          await connection.writeData(query4);
          log('PayorEX done');

          for (var element in billItems) {
            final venCGST = element.gstPer / 2;
            final venCGSTamt = element.gstAmt / 2;
            final venSGST = element.gstPer / 2;
            final venSGSTamt = element.gstAmt / 2;
            final double totalTaxableAmount =
                element.qty * element.unitTaxableAmount;
            final double totalTaxAmount =
                totalTaxableAmount * (element.gstPer / 100);
            final double totalCessAmount =
                totalTaxableAmount * (element.cessPer / 100);
            final totalamount = inc!
                ? element.qty * element.basicRate
                : (element.qty * element.basicRate) +
                    totalCessAmount +
                    totalTaxAmount;
            String query3 = """INSERT INTO  [dbo].[invoicedetail] (
            invoiceno, invdate,  terms, ordereference, cusid, invoiceto,
            invaddress, shipto, shipaddr, gstno, email, smsno, CustomerTYPE, pdtcode,
            pdtname, HSNCode, discp, pcs, qty, Freeqty, unitprice, itemMRP, Amount,
            ItemDiscPer, ItemDiscAmount, GrossValueAftrITMDisc, ItemBillDiscPER,
            ItemBillDiscAmount, ItemTotalNETAmount, gst, gstamount, Totalamount,
            venIGST, venIGSTamnt, venCGST, venCGSTamnt, venSGST, venSGSTamnt,
            CessPercentage, CessAmount,
            ItemUnitSaleRate, ParcelOrNot, OrderNumber, KOTNumber, UserID
        ) VALUES (
             '$invno', '$formattedDate',
            '--', '--',
            '${customer.cusid}', '${customer.bussinessname}', '--',
            '--', '--', '${customer.gstno}',
            '--', '--', '${customer.customerType}',
            '${element.itemCode}', '${element.itemName}', '--',
            '--', 0.00, ${element.qty},
            0.00, ${element.basicRate},0.00 ,
            ${element.unitTaxableAmount * element.qty}, 0.00, 0.00,
            ${element.unitTaxableAmount * element.qty}, 0.00,
            0.00,  ${element.unitTaxableAmount * element.qty},
             ${element.gstPer}, ${element.gstAmt},  $totalamount,
            ${element.gstPer}, ${element.gstAmt}, $venCGST,
            $venCGSTamt , $venSGST, $venSGSTamt,
            ${element.cessPer}, ${element.cessAmt},
            ${element.unitTaxableAmount}, '${element.parcelOrnot}', '${state.orderid!}',
            '${element.kotno}', '${event.userID}'
        );
                 UPDATE MainStock SET totalstock = (
  SELECT OpeningStockValue = (
    (SELECT COALESCE(SUM(qty), 0) FROM Purchasedetail WHERE pdtcode = '${element.itemCode}') +
    (SELECT COALESCE(SUM(qty), 0) FROM SalesReturnItems WHERE pdtcode = '${element.itemCode}') +
    (SELECT COALESCE(SUM(qty), 0) FROM StockAdjustmentItems WHERE pdtcode = '${element.itemCode}' AND StockInOrOut = 'In') +
    (SELECT COALESCE(SUM(StockQty), 0) FROM OpeningStock WHERE ItemCode = '${element.itemCode}') -
    (SELECT COALESCE(SUM(qty), 0) FROM invoicedetail WHERE pdtcode = '${element.itemCode}') -
    (SELECT COALESCE(SUM(qty), 0) FROM PurchaseReturnItems WHERE pdtcode = '${element.itemCode}') -
    (SELECT COALESCE(SUM(qty), 0) FROM StockAdjustmentItems WHERE pdtcode = '${element.itemCode}' AND StockInOrOut = 'Out')
  )
  ) WHERE codeorSKU = '${element.itemCode}';
""";

            await connection.writeData(query3);
          }
          String updateQuery = '''
  UPDATE  [dbo].[OrderMainDetails]
  SET
    CreditOrPaid = '${state.paytypeValue!}',
    BillNumber = '$invno'
  WHERE
    OrderNumber = '${state.orderid}';
''';
          await connection.writeData(updateQuery);
          log('emit calling--');
          emit(state.copyWith(
            loading: false,
            billsubmission: true,
            invNo: invno,
            printerstatus: 0,
          ));
          log('emit done--');
          if (event.billPrint) {
            log('print section ----------');

            PrinterConfig printer = event.printer!;

            int printingStatus = 0;

            final List<int> test = await billPrintData(
              cutumer: customer.bussinessname,
              mergedorNot: event.mergedorNot,
              mergedOrders: event.mergedOrders,
              mergedTables: event.mergedTables,
              netAmount: state.totalAmt!,
              tax: state.tax!,
              cess: state.cess!,
              taxable: state.subTotal!,
              items: state.printitems,
              invoiceNo: invno,
              orderNo: state.orderid!,
              tableNo: state.table!.tableName,
            );

            printingStatus = await NetworkPrinter().printTicket(
              test,
              printer.printerName,
            );

            log('Printer response---$printingStatus');

            if (printingStatus == 1) {
              log('Printer status: 2---------');
              emit(state.copyWith(
                isLoading: false,
                printerstatus: 2,
                billsubmission: false,
              ));
            } else {
              log('Printer status: 1---------');
              emit(state.copyWith(
                isLoading: false,
                printerstatus: 1,
                billsubmission: false,
              ));
            }
          } else {
            emit(state.copyWith(
              isLoading: false,
              printerstatus: 1,
              billsubmission: false,
            ));
          }
        }
      } catch (e) {
        // Fluttertoast.showToast(msg: 'sorry Something went wrong');
        emit(state.copyWith(
          loading: false,
        ));

        log('Error: $e');
      }
    });

    on<BillUpdateAndPrint>((event, emit) async {
      log('BillUpdateAndPrint --- ------------------ ${event.invNo}');

      emit(state.copyWith(
        loading: true,
        billsubmission: false,
        printerstatus: 0,
      ));

      try {
        List<kotItem> billItems = state.billitems;
        for (var element in billItems) {
          log('${element.itemName} ---- ${element.qty} ------- ${element.kotno}');
        }
        CustomerDetails customer = state.selectedCustomer!;

        final payStatus = event.paid;
        final now = DateTime.now();

        final formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss.SSS')
            .format(DateTime(now.year, now.month, now.day));
        // var formattedDate = getDateTime();
        // final datetime = DateTime.parse(
        //     '${DateTime.now().toString().substring(0, 10)} 00:00:00.000');

        // var formattedDate = DateFormat('dd/MM/yyyy').format(datetime);
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();

        if (!payStatus) {
          // var paidamount = 0.00;

          var creditOrCleared = 'Credit';

          String query = """
          UPDATE  [dbo].[InvoiceAccountDetail]
          SET

        Invoicedate = '$formattedDate',
        description = '--',
        totalamount = ${state.subTotal!},
        totaltaxamount = ${state.tax!},
        Discountamount = 0.00,
        TotalHavetoPayamount = ${state.totalAmt!},
        totalpaidamount = 0.00,
        balance = ${state.totalAmt!},
        CustomerTYPE = '${customer.customerType}',
        CreditOrCleared = '$creditOrCleared',

        TableNumber = '${state.table!.tableName}',
        SubTotal = ${state.subTotal!},
        BillDiscPER = 0.00,
        BillDiscTotal = 0.00,
        INVnetAmount = ${state.subTotal!},
        INVtotalTAXAmnt = ${state.tax!},
        TotalCessAmount = ${state.cess!},
        ParcelOrNot = 'parcelOrNot',
        BillAC = '--',
        OrderNumber = '${state.orderid!}',
        UserID = '${event.userId}',
            Merged = '${event.mergedorNot}'

    WHERE custominvno = '${event.invNo}';
""";

          await connection.writeData(query);
          log('case 1');
          String deleteQueary = '''
           DELETE FROM  [dbo].[invoicedetail]
            WHERE invoiceno = '${event.invNo}';
           ''';

          log(deleteQueary);

          await connection.writeData(deleteQueary);
          for (var element in billItems) {
            log('case 1');
            log(element.itemName);
            final venCGST = element.gstPer / 2;
            final venCGSTamt = element.gstAmt / 2;
            final venSGST = element.gstPer / 2;
            final venSGSTamt = element.gstAmt / 2;
            final double totalTaxableAmount =
                element.qty * element.unitTaxableAmount;
            final double totalTaxAmount =
                totalTaxableAmount * (element.gstPer / 100);
            final double totalCessAmount =
                totalTaxableAmount * (element.cessPer / 100);
            final totalamount = inc!
                ? element.qty * element.basicRate
                : (element.qty * element.basicRate) +
                    totalCessAmount +
                    totalTaxAmount;
            String query3 = """INSERT INTO  [dbo].[invoicedetail] (
            invoiceno, invdate,  terms, ordereference, cusid, invoiceto,
            invaddress, shipto, shipaddr, gstno, email, smsno, CustomerTYPE, pdtcode,
            pdtname, HSNCode, discp, pcs, qty, Freeqty, unitprice, itemMRP, Amount,
            ItemDiscPer, ItemDiscAmount, GrossValueAftrITMDisc, ItemBillDiscPER,
            ItemBillDiscAmount, ItemTotalNETAmount, gst, gstamount, Totalamount,
            venIGST, venIGSTamnt, venCGST, venCGSTamnt, venSGST, venSGSTamnt,
            CessPercentage, CessAmount,
            ItemUnitSaleRate, ParcelOrNot, OrderNumber, KOTNumber, UserID
        ) VALUES (
             '${event.invNo}', '$formattedDate',
             '--', '--',
            '${customer.cusid}', '${customer.bussinessname}', '--',
            '--', '--', '${customer.gstno}',
            '--', '--', '${customer.customerType}',
            '${element.itemCode}', '${element.itemName}', '--',
            '--', 0.00, ${element.qty},
            0.00, ${element.basicRate},0.00 ,
            ${element.unitTaxableAmount * element.qty}, 0.00, 0.00,
            ${element.unitTaxableAmount * element.qty}, 0.00,
            0.00,  ${element.unitTaxableAmount * element.qty},
             ${element.gstPer}, ${element.gstAmt},  $totalamount,
            ${element.gstPer}, ${element.gstAmt}, $venCGST,
            $venCGSTamt, $venSGST, $venSGSTamt ,
            ${element.cessPer}, ${element.cessAmt},
            ${element.unitTaxableAmount}, '${element.parcelOrnot}', '${state.orderid!}',
           '${element.kotno}', '$usernameA'
        );
        UPDATE MainStock SET totalstock = (
                   SELECT OpeningStockValue = (
                   (SELECT COALESCE(SUM(qty), 0) FROM Purchasedetail WHERE pdtcode = '${element.itemCode}') +
                  (SELECT COALESCE(SUM(qty), 0) FROM SalesReturnItems WHERE pdtcode = '${element.itemCode}') +
                  (SELECT COALESCE(SUM(qty), 0) FROM StockAdjustmentItems WHERE pdtcode = '${element.itemCode}' AND StockInOrOut = 'In') +
                  (SELECT COALESCE(SUM(StockQty), 0) FROM OpeningStock WHERE ItemCode = '${element.itemCode}') -
                    (SELECT COALESCE(SUM(qty), 0) FROM invoicedetail WHERE pdtcode = '${element.itemCode}') -
                   (SELECT COALESCE(SUM(qty), 0) FROM PurchaseReturnItems WHERE pdtcode = '${element.itemCode}') -
                    (SELECT COALESCE(SUM(qty), 0) FROM StockAdjustmentItems WHERE pdtcode = '${element.itemCode}' AND StockInOrOut = 'Out')
                    )
                     ) WHERE codeorSKU = '${element.itemCode}';
                      """;
            log(query3);
            await connection.writeData(query3);
          }
          emit(state.copyWith(
            loading: false,
            billsubmission: true,
            invNo: event.invNo,
            printerstatus: 0,
          ));
          log('print section ----------');
          if (event.billPrint) {
            PrinterConfig printer = event.printer!;
            int printingStatus = 0;
            final List<int> test = await billPrintData(
              cutumer: customer.bussinessname,
              mergedorNot: event.mergedorNot,
              mergedOrders: event.mergedOrders,
              mergedTables: event.mergedTables,
              netAmount: state.totalAmt!,
              tax: state.tax!,
              cess: state.cess!,
              taxable: state.subTotal!,
              items: state.printitems,
              invoiceNo: event.invNo,
              orderNo: state.orderid!,
              tableNo: state.table!.tableName,
            );

            printingStatus = await NetworkPrinter().printTicket(
              test,
              printer.printerName,
            );

            log('Printer response---$printingStatus');

            if (printingStatus == 1) {
              log('Printer status: 2---------');
              emit(state.copyWith(
                isLoading: false,
                printerstatus: 2,
                billsubmission: false,
              ));
            } else {
              log('Printer status: 1---------');
              emit(state.copyWith(
                isLoading: false,
                printerstatus: 1,
                billsubmission: false,
              ));
            }
          } else {
            emit(state.copyWith(
              isLoading: false,
              printerstatus: 1,
              billsubmission: false,
            ));
          }
        } else {
          String query = """
    UPDATE  [dbo].[InvoiceAccountDetail]
    SET
        cusid = '${customer.cusid}',
        cusname = '${customer.bussinessname}',
        cusnameAddress = '${customer.bussinessaddr}',
        custorcontact = '--',
        cusnameGSTNumber = '${customer.gstno}',
        Invoicedate = '$formattedDate',
        description = '--',
        totalamount = ${state.subTotal!},
        totaltaxamount = ${state.tax!},
        Discountamount = 0.00,
        TotalHavetoPayamount = ${state.totalAmt!},
        totalpaidamount = ${state.totalAmt!},
        balance = 0.00,
        CustomerTYPE = '${customer.customerType}',
        CreditOrCleared = 'Cleared',
        INVtypeState = 'Kerala',
        ShipmenttoAddName = '--',
        ShipmenttoAddress = '--',
        TableNumber = '${state.table!.tableName}',
        SubTotal = ${state.subTotal!},
        BillDiscPER = 0.00,
        BillDiscTotal = 0.00,
        INVnetAmount = ${state.subTotal!},
        INVtotalTAXAmnt = ${state.tax!},
        TotalCessAmount = ${state.cess!},
        ParcelOrNot = 'parcelOrNot',
        BillAC = '--',
        OrderNumber = '${state.orderid!}',
        UserID = '${event.userId}',
            Merged = '${event.mergedorNot}'

    WHERE custominvno = '${event.invNo}';
""";

          await connection.writeData(query);

          logWithTime("Insertion successful for query2 --------------------");

          // String queryPayorEX =
          //     "SELECT MAX(CONVERT(INT, RIGHT(PayOrExpID, LEN(PayOrExpID)-3)))  FROM dbo.PayorEX  ";
          // String? result2 = await connection.getData(queryPayorEX);
          // log('queryPayorEX ---------------$result2');
          String payidno = await fetchAndInsertPayOrExpID(connection);
          log('queryPapayidnoyorEX ---------------$payidno');

          String query4 = """
          INSERT INTO  [dbo].[PayorEX] (
         PayOrExpID, VendIDOreCusID, VendIDOreCusName, PayOrExpDate, CAT,
        paidby,   paidamount, PayCrDr,
    PayINVid, RootType, OrderNumber
    ) VALUES (
        '$payidno', '${customer.cusid}', '${customer.bussinessname}',
        '$formattedDate', 'sale',  '${state.paytypeValue!}', ${state.totalAmt!}, 'Cr', '${event.invNo}', 'Sale', '${state.orderid!}'
    )
""";

          await connection.writeData(query4);
          log('PayorEX done');
          String deleteQueary = '''
           DELETE FROM  [dbo].[invoicedetail]
            WHERE invoiceno = '${event.invNo}';
           ''';

          log(deleteQueary);
          await connection.writeData(deleteQueary);
          for (var element in billItems) {
            final venCGST = element.gstPer / 2;
            final venCGSTamt = element.gstAmt / 2;
            final venSGST = element.gstPer / 2;
            final venSGSTamt = element.gstAmt / 2;
            final double totalTaxableAmount =
                element.qty * element.unitTaxableAmount;
            final double totalTaxAmount =
                totalTaxableAmount * (element.gstPer / 100);
            final double totalCessAmount =
                totalTaxableAmount * (element.cessPer / 100);
            final totalamount = inc!
                ? element.qty * element.basicRate
                : (element.qty * element.basicRate) +
                    totalCessAmount +
                    totalTaxAmount;
            String query3 = """INSERT INTO  [dbo].[invoicedetail] (
            invoiceno, invdate,  terms, ordereference, cusid, invoiceto,
            invaddress, shipto, shipaddr, gstno, email, smsno, CustomerTYPE, pdtcode,
            pdtname, HSNCode, discp, pcs, qty, Freeqty, unitprice, itemMRP, Amount,
            ItemDiscPer, ItemDiscAmount, GrossValueAftrITMDisc, ItemBillDiscPER,
            ItemBillDiscAmount, ItemTotalNETAmount, gst, gstamount, Totalamount,
            venIGST, venIGSTamnt, venCGST, venCGSTamnt, venSGST, venSGSTamnt,
            CessPercentage, CessAmount,
            ItemUnitSaleRate, ParcelOrNot, OrderNumber, KOTNumber, UserID
        ) VALUES (
             '${event.invNo}', '$formattedDate',
            '--', '--',
            '${customer.cusid}', '${customer.bussinessname}', '--',
            '--', '--', '${customer.gstno}',
            '--', '--', '${customer.customerType}',
            '${element.itemCode}', '${element.itemName}', '--',
            '--', 0.00, ${element.qty},
            0.00, ${element.basicRate},0.00 ,
            ${element.unitTaxableAmount * element.qty}, 0.00, 0.00,
            ${element.unitTaxableAmount * element.qty}, 0.00,
            0.00,  ${element.unitTaxableAmount * element.qty},
             ${element.gstPer}, ${element.gstAmt},  $totalamount,
            ${element.gstPer}, ${element.gstAmt}, $venCGST,
            $venCGSTamt , $venSGST, $venSGSTamt,
            ${element.cessPer}, ${element.cessAmt},
            ${element.unitTaxableAmount}, '${element.parcelOrnot}', '${state.orderid!}',
            '${element.kotno}', '$usernameA'
        );
                 UPDATE MainStock SET totalstock = (
  SELECT OpeningStockValue = (
    (SELECT COALESCE(SUM(qty), 0) FROM Purchasedetail WHERE pdtcode = '${element.itemCode}') +
    (SELECT COALESCE(SUM(qty), 0) FROM SalesReturnItems WHERE pdtcode = '${element.itemCode}') +
    (SELECT COALESCE(SUM(qty), 0) FROM StockAdjustmentItems WHERE pdtcode = '${element.itemCode}' AND StockInOrOut = 'In') +
    (SELECT COALESCE(SUM(StockQty), 0) FROM OpeningStock WHERE ItemCode = '${element.itemCode}') -
    (SELECT COALESCE(SUM(qty), 0) FROM invoicedetail WHERE pdtcode = '${element.itemCode}') -
    (SELECT COALESCE(SUM(qty), 0) FROM PurchaseReturnItems WHERE pdtcode = '${element.itemCode}') -
    (SELECT COALESCE(SUM(qty), 0) FROM StockAdjustmentItems WHERE pdtcode = '${element.itemCode}' AND StockInOrOut = 'Out')
  )
  ) WHERE codeorSKU = '${element.itemCode}';
""";
            log(query3);
            await connection.writeData(query3);
          }
          String updateQuery = '''
  UPDATE  [dbo].[OrderMainDetails]
  SET
    CreditOrPaid = '${state.paytypeValue!}'
  WHERE
    OrderNumber = '${state.orderid}';
''';

          await connection.writeData(updateQuery);
          emit(state.copyWith(
            loading: false,
            billsubmission: true,
            invNo: event.invNo,
            printerstatus: 0,
          ));
          if (event.billPrint) {
            log('print section ----------');

            PrinterConfig printer = event.printer!;

            int printingStatus = 0;

            final List<int> test = await billPrintData(
              cutumer: customer.bussinessname,
              mergedorNot: event.mergedorNot, mergedOrders: event.mergedOrders,
              mergedTables: event.mergedTables,

              orderNo: state.orderid!,
              tax: state.tax!,
              cess: state.cess!,
              // cGst: ,netAmount: ,sGst: ,
              netAmount: state.totalAmt!,
              taxable: state.subTotal!,
              items: state.printitems,
              invoiceNo: event.invNo,
              tableNo: state.table!.tableName,
            );

            printingStatus = await NetworkPrinter().printTicket(
              test,
              printer.printerName,
            );

            log('Printer response---$printingStatus');

            if (printingStatus == 1) {
              log('Printer status: 2---------');
              emit(state.copyWith(
                isLoading: false,
                printerstatus: 2,
                billsubmission: false,
              ));
            } else {
              log('Printer status: 1---------');
              emit(state.copyWith(
                isLoading: false,
                printerstatus: 1,
                billsubmission: false,
              ));
            }
          } else {
            emit(state.copyWith(
              isLoading: false,
              printerstatus: 1,
              billsubmission: false,
            ));
          }
        }
      } catch (e) {
        // Fluttertoast.showToast(msg: 'sorry Something went wrong');
        emit(state.copyWith(
          loading: false,
        ));
        log('Error: $e');
      }
    });

    on<BillRePrint>((event, emit) async {
      try {
        emit(state.copyWith(
          printerstatus: 0,
        ));

        PrinterConfig printer = event.printer;

        int printingStatus = 0;

        final List<int> test = await billPrintData(
          cutumer: state.selectedCustomer!.bussinessname,
          mergedorNot: event.mergedorNot,
          mergedOrders: event.mergedOrders,
          mergedTables: event.mergedTables,
          tax: state.tax!,
          cess: state.cess!,
          netAmount: state.totalAmt!,
          taxable: state.subTotal!,
          items: state.printitems,
          invoiceNo: state.invNo,
          orderNo: state.orderid!,
          tableNo: state.table!.tableName,
        );

        printingStatus = await NetworkPrinter().printTicket(
          test,
          printer.printerName,
        );

        log('Printer response---$printingStatus');

        if (printingStatus == 1) {
          log('Printer status: 2---------');
          emit(state.copyWith(
            printerstatus: 2,
          ));
        } else {
          log('Printer status: 1---------');
          emit(state.copyWith(
            printerstatus: 1,
          ));
        }
      } catch (e) {
        // Fluttertoast.showToast(msg: 'sorry Something went wrong');
        emit(state.copyWith(
          loading: false,
        ));

        log('Error: $e');
      }
    });
  }
}

void logWithTime(String message) {
  final String formattedTime =
      DateFormat('yyyy-MM-dd HH:mm:ss.SSS').format(DateTime.now());
  log("[$formattedTime] $message");
}

Future<String> _fetchAndInsertInvoiceNumber(
    MssqlConnection connection, CustomerDetails customer) async {
  logWithTime('_fetchAndInsertInvoiceNumber called --------');

  String prefix = customer.customerType == 'BtoB'
      ? appentydataresult[0].invoiceNumberBtoB
      : appentydataresult[0].invoiceNumberBtoC;

  String query = '''
    DECLARE @NextInvNo VARCHAR(50);

    INSERT INTO InvoiceAccountDetail (CustomInvNo, CustomerType)
    OUTPUT Inserted.CustomInvNo
    VALUES (
      (
        SELECT ISNULL(
          '$prefix' + CAST((1 + MAX(CONVERT(INT, RIGHT(CustomInvNo, LEN(CustomInvNo) - LEN('$prefix'))))) AS VARCHAR),
          '${prefix}1'
        )
        FROM InvoiceAccountDetail
        WHERE CustomerType = '${customer.customerType}'
      ),
      '${customer.customerType}'
    )
  ''';

  var result = await connection.getData(query);
  logWithTime('_fetchAndInsertInvoiceNumber result -------- $result');

  if (result == '[]') {
    throw Exception("Failed to insert and fetch Invoice Number");
  }

  List<dynamic> jsonList = json.decode(result);
  return jsonList[0]['CustomInvNo'];
}
