// import 'dart:developer';

// import 'package:bloc/bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:restaurant_kot/domain/item/item_model.dart';
// import 'package:restaurant_kot/domain/stock/stock_model.dart';

// part 'items_to_kot_event.dart';
// part 'items_to_kot_state.dart';
// part 'items_to_kot_bloc.freezed.dart';

// class ItemsToKotBloc extends Bloc<ItemsToKotEvent, ItemsToKotState> {
//   ItemsToKotBloc() : super(ItemsToKotState.initial()) {
//     on<itemsFromOrder>((event, emit) {
//       try {
//         emit(state.copyWith(productList: event.items));
//       } catch (e) {
//         log(e.toString());
//       }
//     });
// //    on<Add>((event, emit) {
// //   try {
// //     List<Product> productList = []; // Assuming this is your list of products

// //     // Check if the product is already in the list
// //     final existingProductIndex = productList.indexWhere((product) => product.id == event.product.id);

// //     if (event.isIncrement) {
// //       if (existingProductIndex == -1) {
// //         // If product is not in the list, add it with quantity 1
// //         event.product.changedQty = 1;
// //         productList.add(event.product);
// //       } else {
// //         // If product is already in the list, increment its quantity
// //         productList[existingProductIndex].changedQty += 1;
// //       }
// //     } else {
// //       if (existingProductIndex != -1) {
// //         // If product is in the list, decrement its quantity
// //         if (productList[existingProductIndex].changedQty > 1) {
// //           productList[existingProductIndex].changedQty -= 1;
// //         } else {
// //           // If quantity is 1, remove the product from the list
// //           productList.removeAt(existingProductIndex);
// //         }
// //       }
// //     }

// //     // Emit the updated product list or any other necessary state
// //     emit(state.copyWith(productList: productList));
// //   } catch (e) {
// //     log(e.toString());
// //   }
// // });

//   }
// }
