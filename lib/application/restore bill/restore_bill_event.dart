part of 'restore_bill_bloc.dart';

@freezed
class RestoreBillEvent with _$RestoreBillEvent {
  const factory RestoreBillEvent.restore(
      {required String invNo,required String ordNo, required String amt}) = Restore;
}
