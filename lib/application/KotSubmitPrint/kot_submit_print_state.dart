part of 'kot_submit_print_bloc.dart';

@freezed
class KotSubmitPrintState with _$KotSubmitPrintState {
  factory KotSubmitPrintState({
    required bool isLoading,
    required bool parcel,
        required bool stockout,

        required List<kotItem> outofStock,

  }) = _KotSubmitPrintState;
  factory KotSubmitPrintState.initial() {
    return KotSubmitPrintState(
      parcel: false,outofStock: [],
      isLoading: false,stockout: false
    );
  }
}
