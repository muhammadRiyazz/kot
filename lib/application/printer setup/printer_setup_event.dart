part of 'printer_setup_bloc.dart';

@freezed
class PrinterSetupEvent with _$PrinterSetupEvent {
  const factory PrinterSetupEvent.fetchKitchens() = FetchKitchens;
  const factory PrinterSetupEvent.addPrinter(
      {required String kitchen, required String ip}) = AddPrinter;
const factory PrinterSetupEvent.fetchPrinter({String? kitchen}) = FetchPrinter;

  const factory PrinterSetupEvent.fetchkitchenPrinter(
      {required String kitchen}) = FetchkitchenPrinter;
}
