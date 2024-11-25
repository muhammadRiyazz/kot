part of 'printer_setup_bloc.dart';

@freezed
class PrinterSetupState with _$PrinterSetupState {
  factory PrinterSetupState({
    required bool isLoading,
    required List<String> kitchenlist,
    List<PrinterConfig>? priterlist,
    PrinterConfig? priterinfo,
 required  int updated,
  }) = _CustomerpartState;
  factory PrinterSetupState.initial() {
    return PrinterSetupState(
      isLoading: false,updated: 0,
      kitchenlist: [],
    );
  }
}
