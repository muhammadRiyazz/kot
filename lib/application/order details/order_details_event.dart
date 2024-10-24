part of 'order_details_bloc.dart';

@freezed
class OrderDetailsEvent with _$OrderDetailsEvent {
  const factory OrderDetailsEvent.orderItems({required String orderNo}) = OrderDetails;
    const factory OrderDetailsEvent.addQty({required OrderItem currentItem}) = AddQty;
        const factory OrderDetailsEvent.cancelQty({required OrderItem currentItem}) = CancelQty;


}