part of 'kot_submit_print_bloc.dart';

@freezed
class KotSubmitPrintState with _$KotSubmitPrintState {
  factory KotSubmitPrintState({
    required bool isLoading,
    required bool parcel,
    required bool printcancelkot,
    required bool printnewkot,
    required bool stockout,
    required String ordno,
    required String kotNo,
    required List<kotItem> outofStock,
    required int printerstatus,
    required int submitstatus,
  }) = _KotSubmitPrintState;
  factory KotSubmitPrintState.initial() {
    return KotSubmitPrintState(kotNo: '',ordno: '',
        printerstatus: 0,
        submitstatus: 0,
        parcel: false,
        outofStock: [],
        printcancelkot: false,
        printnewkot: false,
        isLoading: false,
        stockout: false);
  }
}
