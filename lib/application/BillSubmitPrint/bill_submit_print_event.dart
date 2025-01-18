part of 'bill_submit_print_bloc.dart';

@freezed
class BillSubmitPrintEvent with _$BillSubmitPrintEvent {
  const factory BillSubmitPrintEvent.billPreview({
    required List<kotItem> items,
    required CustomerDetails selectedcustomer,
    required TableInfo table,
    required String currentorderid,
  }) = BillPreview;
  const factory BillSubmitPrintEvent.billSubmitAndPrint({
        required bool billPrint,
    required String mergedorNot,
  required String mergedOrders,
  required String mergedTables,
    required String userID,
     PrinterConfig? printer,
    required bool paid,
    // String? paymentMethord,
  }) = BillSubmitAndPrint;
    const factory BillSubmitPrintEvent.billRePrint({
    required PrinterConfig printer,
     required String mergedorNot,
  required String mergedOrders,
  required String mergedTables,
  }) = BillRePrint;
   const factory BillSubmitPrintEvent.payType({
    required String paytypeValue,
    
  }) = payType;
  const factory BillSubmitPrintEvent.billUpdateAndPrint(
      { PrinterConfig? printer,
      required String userId,
      required bool paid,  
      required String mergedorNot,
  required String mergedOrders,
  required String mergedTables,
            required bool billPrint,

      // String? paymentMethord,
      required String invNo}) = BillUpdateAndPrint;
}
