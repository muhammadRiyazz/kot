part of 'order_details_bloc.dart';

@freezed
class OrderDetailsEvent with _$OrderDetailsEvent {
  const factory OrderDetailsEvent.orderItems({required String orderNo}) = OrderDetails;
    const factory OrderDetailsEvent.addQty({required String currentItemid, String? kotno}) = AddQty;
        const factory OrderDetailsEvent.cancelQty({required String currentItemid, String? kotno}) = CancelQty;
  const factory OrderDetailsEvent.clearItemSelection() = ClearItemSelection;
  const factory OrderDetailsEvent.itemAction({
    required String from,
   required kotItem item
  }) = ItemAction;



}