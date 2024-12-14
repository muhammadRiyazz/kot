part of 'bill_submit_print_bloc.dart';

@freezed
class BillSubmitPrintState with _$BillSubmitPrintState {
  factory BillSubmitPrintState({
    required bool isLoading,
    required bool loading,
    required List<kotItem> billitems,
    required List<kotItem> printitems,
    CustomerDetails? selectedCustomer,
    TableInfo? table,
    String? orderid,
    double? subTotal,
    double? totalAmt,
    double? tax,
    double? cess,
    required bool billsubmission,
    required bool trafic,
    required String invNo,
    required int printerstatus,
  }) = _KotSubmitPrintState;
  factory BillSubmitPrintState.initial() {
    return BillSubmitPrintState(
        printitems: [],
        billitems: [],
        loading: false,
        invNo: 'INV--',
        printerstatus: 0,
        isLoading: false,
        billsubmission: false,
        trafic: false);
  }
}
