part of 'support_bloc.dart';

@freezed
class SupportState with _$SupportState {
  const factory SupportState({
    required bool isLoading,
    SupportInfo? supportInfo,
  }) = _SupportState;

  factory SupportState.initial() => const SupportState(
        isLoading: false,
      );
}
