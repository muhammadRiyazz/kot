part of 'order_details_bloc.dart';

@freezed
class OrderDetailsState with _$OrderDetailsState {
 factory OrderDetailsState({
    required bool isLoading,
    // required      List<OrderItem> orderitems,
        required      List<kotItem> toAddItems,
                required      List<kotItem> toCancelItems,
             required   List<kotItem> orderitems


  }) = _OrderDetailsState;
  factory OrderDetailsState.initial() {
    return OrderDetailsState(
      // orderitems: []
      orderitems: [],
      isLoading: false,toAddItems: [],toCancelItems: []
    );
  }}
