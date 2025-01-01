part of 'finishad_order_bloc.dart';

@freezed
class FinishadOrderState with _$FinishadOrderState {
factory FinishadOrderState({
    required bool isLoading,
required List<InvoicesList> invoices,
List<InvoiceItem>? invoiceDetails

  }) = _OrdersState;
  factory FinishadOrderState.initial() {
    return FinishadOrderState(invoiceDetails: [],
  invoices: [],
      isLoading: false,
    );
  }}
