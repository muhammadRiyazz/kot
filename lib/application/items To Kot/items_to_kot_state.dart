part of 'items_to_kot_bloc.dart';

@freezed
class ItemsToKotState with _$ItemsToKotState {
 factory ItemsToKotState({
    required bool isLoading,
    required      List<OrderItem> selectedItems,
        


  }) = _ItemsToKotState;
  factory ItemsToKotState.initial() {
    return ItemsToKotState(
      selectedItems: [],
      isLoading: false,
    );
  }}
