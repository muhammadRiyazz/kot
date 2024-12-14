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
    required String userID,
    required PrinterConfig printer,
    required bool paid,
    String? paymentMethord,
  }) = BillSubmitAndPrint;
    const factory BillSubmitPrintEvent.billRePrint({
    required PrinterConfig printer,
    
  }) = BillRePrint;
  const factory BillSubmitPrintEvent.billUpdateAndPrint(
      {required PrinterConfig printer,
      required String userId,
      required bool paid,
      String? paymentMethord,
      required String invNo}) = BillUpdateAndPrint;
}
