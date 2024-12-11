part of 'inital_data_bloc.dart';

@freezed
class InitalDataState with _$InitalDataState {
  factory InitalDataState({
    required List<String> paymentType,
    Settings? settingsData,
  }) = _InitalDataState;
  factory InitalDataState.initial() {
    return InitalDataState(paymentType: []);
  }
}
