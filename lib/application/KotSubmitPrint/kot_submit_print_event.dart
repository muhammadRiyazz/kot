part of 'kot_submit_print_bloc.dart';

@freezed
class KotSubmitPrintEvent with _$KotSubmitPrintEvent {
  const factory KotSubmitPrintEvent.submitAndPrint({
    required List<kotItem> kotitems,
    required List<kotItem> kotretunitems,
    required CustomerDetails selectedcustomer,
    required TableInfo table,
    String? currentorderid,
    List<kotItem>? currentitems,
    String? note,
  }) = SubmitAndPrint;
  const factory KotSubmitPrintEvent.cancelKOT({
    required List<kotItem> cancelkotitems,
    required CustomerDetails selectedcustomer,
    required TableInfo table,
   required String currentorderid,
  required  List<kotItem> currentitems,
  }) = CancelKOT;
  const factory KotSubmitPrintEvent.parcel({
    required bool parcel,
  }) = Parcel;
}
