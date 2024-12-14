part of 'restore_bill_bloc.dart';

@freezed
class RestoreBillState with _$RestoreBillState {
  factory RestoreBillState({
    required bool isLoading,
    required bool updated,
  }) = _RestoreBillState;
  factory RestoreBillState.initial() {
    return RestoreBillState(isLoading: false, updated: false);
  }
}
