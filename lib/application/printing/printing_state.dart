part of 'printing_bloc.dart';

@freezed
class PrintingState with _$PrintingState {
 factory PrintingState({
    required bool isLoading,
        required bool printed,


  }) = _PrintingState;
  factory PrintingState.initial() {
    return PrintingState(
      isLoading: false,printed: false
    );
  }}
