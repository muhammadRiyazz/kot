part of 'inital_data_bloc.dart';

@freezed
class InitalDataEvent with _$InitalDataEvent {
  const factory InitalDataEvent.fetchinitaldatas() = Fetchinitaldatas;
    const factory InitalDataEvent.addinitaldatas() =Addinitaldatas;

}