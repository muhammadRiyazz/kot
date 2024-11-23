part of 'bill_submit_print_bloc.dart';

@freezed
class BillSubmitPrintState with _$BillSubmitPrintState {
factory BillSubmitPrintState({
    required bool isLoading,
    required bool parcel,
  }) = _KotSubmitPrintState;
  factory BillSubmitPrintState.initial() {
    return BillSubmitPrintState(
      parcel: false,
      isLoading: false,
    );
  }}
