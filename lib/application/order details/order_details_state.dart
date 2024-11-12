part of 'order_details_bloc.dart';

@freezed
class OrderDetailsState with _$OrderDetailsState {
 factory OrderDetailsState({
    required bool isLoading,
    // required      List<OrderItem> orderitems,
        required      List<KitchenItem> toAddItems,
                required      List<KitchenItem> toCancelItems,
             required   List<KitchenItem> orderitems


  }) = _OrderDetailsState;
  factory OrderDetailsState.initial() {
    return OrderDetailsState(
      // orderitems: []
      orderitems: [],
      isLoading: false,toAddItems: [],toCancelItems: []
    );
  }}
