part of 'demo_bloc.dart';

@freezed
class DemoState with _$DemoState {
  factory DemoState({
    required bool isLoading,
    required bool loged,
  }) = _DemoState;
  factory DemoState.initial() {
    return DemoState(
      isLoading: false,
      loged: false,
    );
  }
}
