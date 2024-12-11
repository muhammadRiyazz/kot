part of 'kot_submit_print_bloc.dart';

@freezed
class KotSubmitPrintEvent with _$KotSubmitPrintEvent {
  const factory KotSubmitPrintEvent.submitAndPrint({
    required List<kotItem> kotitems,
    required List<kotItem> kotretunitems,
    required CustomerDetails selectedcustomer,
    required bool kotPrint,
    required bool cancelKotPrint,
    required TableInfo table,
    String? currentorderid,
    List<kotItem>? currentitems,
    List<PrinterConfig?>? printers,
    required String userId,
    String? note,
  }) = SubmitAndPrint;
  const factory KotSubmitPrintEvent.cancelKOT({
        required bool cancelKotPrint,

    required List<kotItem> cancelkotitems,
    required CustomerDetails selectedcustomer,
    required TableInfo table,
    required String currentorderid,
    required String userId,
    required List<kotItem> currentitems,
    List<PrinterConfig?>? printers,
  }) = CancelKOT;
  const factory KotSubmitPrintEvent.parcel({
    required bool parcel,
  }) = Parcel;
    const factory KotSubmitPrintEvent.rePrint({
        required List<kotItem> kotitems,
                required List<kotItem> cancellist,
        required bool cancel,

    required List<kotItem> kotretunitems,

    required TableInfo table,
    String? currentorderid,
    List<kotItem>? currentitems,
    List<PrinterConfig?>? printers,
    required String userId,
    String? note,
  }) = rePrint;
}
