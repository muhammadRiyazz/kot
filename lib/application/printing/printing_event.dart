part of 'printing_bloc.dart';

@freezed
class PrintingEvent with _$PrintingEvent {
  const factory PrintingEvent.printBill({required PrinterConfig printer,required List<kotItem> items,required String invNo,  required double taxable,
      required double netAmount,
  required double cGst,
      required double sGst,
           required String tableName,}) = PrintBill;
}