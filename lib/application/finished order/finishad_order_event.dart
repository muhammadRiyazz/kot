part of 'finishad_order_bloc.dart';

@freezed
class FinishadOrderEvent with _$FinishadOrderEvent {
  const factory FinishadOrderEvent.fetchBills() = FetchBills;
    const factory FinishadOrderEvent.fetchDetails({required String invNo}) = FetchDetails;

}