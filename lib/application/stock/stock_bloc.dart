import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mssql_connection/mssql_connection.dart';
import 'package:restaurant_kot/core/conn.dart';
import 'package:restaurant_kot/domain/category/category.dart';
import 'package:restaurant_kot/domain/stock/stock_model.dart';
part 'stock_event.dart';
part 'stock_state.dart';
part 'stock_bloc.freezed.dart';

// class StockBloc extends Bloc<StockEvent, StockState> {
//   StockBloc() : super(StockState.initial()) {
//     List<Product> serProducts = [];
//     List<Product> goodsProducts = [];

//     on<CategorySelection>((event, emit) async {
//       try {
//         if (event.from == 'SER') {
//           List<Product> serProductsA = serProducts
//               .where((product) => product.category == event.category.pdtFilter)
//               .toList();

//           emit(state.copyWith(
//               isLoading: false,
//               serProducts: serProductsA,
//               sercategory: event.category));
//         } else if (event.from == 'GOODS') {
//           List<Product> goodsProductsA = goodsProducts
//               .where((product) => product.category == event.category.pdtFilter)
//               .toList();

//           emit(state.copyWith(
//               isLoading: false,
//               goodsProducts: goodsProductsA,
//               goodscategory: event.category));
//         }
//       } catch (e) {
//         emit(state.copyWith(isLoading: false));
//         log(e.toString());
//       }
//     });

//     on<Clearcategory>((event, emit) async {
//       try {
//         emit(state.copyWith(
//             isLoading: false,
//             serProducts: serProducts,
//             sercategory: null,
//             goodsProducts: goodsProducts,
//             goodscategory: null));
//       } catch (e) {
//         log(e.toString());
//       }
//     });

//     on<Search>((event, emit) async {
//       try {
//         emit(state.copyWith(isLoading: true));

//         //   FROM [Restaurant].[dbo].[MainStock]
//         //   WHERE [SERorGOODS] = '${event.from}'
//         //     AND ([codeorSKU] LIKE '%${event.searchQuary}%' OR [pdtname] LIKE '%${event.searchQuary}%')
//         // """;

//         if (event.from == 'SER') {
//           log('service');
//           final List<Product> filteredStocks = serProducts.where((product) {
//             // Check if the product name contains the search term (case-insensitive)
//             return product.productName
//                 .toLowerCase()
//                 .contains(event.searchQuary.toLowerCase());
//           }).toList();

//           emit(state.copyWith(isLoading: false, serProducts: filteredStocks));
//         } else if (event.from == 'GOODS') {
//           log('goods');

//           final List<Product> filteredStocks = goodsProducts.where((product) {
//             // Check if the product name contains the search term (case-insensitive)
//             return product.productName
//                 .toLowerCase()
//                 .contains(event.searchQuary.toLowerCase());
//           }).toList();
//           emit(state.copyWith(isLoading: false, goodsProducts: filteredStocks));
//         }
//         emit(state.copyWith(
//           isLoading: false,
//         ));
//       } catch (e) {
//         log(e.toString());
//         emit(state.copyWith(isLoading: false));
//       }
//     });

//     on<Add>((event, emit) async {
//       try {
//         if (event.from == 'SER') {
//           log('FROM SER');
//           List<Product> products = state.serProducts;
//           if (products
//               .any((existingItem) => existingItem.id == event.product.id)) {
//             final index = products.indexWhere((i) => i.id == event.product.id);

//             products[index].changedQty = products[index].changedQty + event.qty;
//             log(products[index].changedQty.toString());

//             emit(state.copyWith(serProducts: products));
//           }
//         } else if (event.from == 'GOODS') {
//           log('FROM GOODS');

//           List<Product> products = state.goodsProducts;
//           if (products
//               .any((existingItem) => existingItem.id == event.product.id)) {
//             final index = products.indexWhere((i) => i.id == event.product.id);

//             products[index].changedQty = products[index].changedQty + event.qty;
//             log(products[index].changedQty.toString());
//             emit(state.copyWith(goodsProducts: products));
//           }
//         }
//       } catch (e) {
//         log(e.toString());
//       }
//     });
//   }
// }

class StockBloc extends Bloc<StockEvent, StockState> {
  StockBloc() : super(StockState.initial()) {
    List<Product> serProducts = [];
    List<Product> goodsProducts = [];

    // Fetch stocks and categories from the database
    on<FetchStocksAndCategory>((event, emit) async {
      log('FetchStocksAndCategory called');
      emit(state.copyWith(isLoading: true));

      try {
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();

        // Query definitions
        String stockQuery = """
          SELECT * FROM [Restaurant].[dbo].[MainStock]
        """;

        String categoryQuery = """
          SELECT * FROM [Restaurant].[dbo].[Category]
        """;

        // Execute both queries in parallel
        var stockQueryResultFuture = connection.getData(stockQuery);
        var categoryQueryResultFuture = connection.getData(categoryQuery);

        // Wait for both futures to complete
        String? stockQueryResult = await stockQueryResultFuture;
        String? categoryQueryResult = await categoryQueryResultFuture;

        // Process stock query result
        List<dynamic> stockJsonResponse = jsonDecode(stockQueryResult);
        List<Product> stocks =
            stockJsonResponse.map((data) => Product.fromJson(data)).toList();
        serProducts =
            stocks.where((product) => product.serOrGoods == 'SER').toList();
        goodsProducts =
            stocks.where((product) => product.serOrGoods == 'GOODS').toList();

        // Process category query result
        List<dynamic> categoryJsonResponse = jsonDecode(categoryQueryResult);
        List<Category> allCategory = categoryJsonResponse
            .map((data) => Category.fromJson(data))
            .toList();
        List<Category> serCategory = allCategory
            .where((category) => category.serOrGoods == 'SER')
            .toList();
        List<Category> goodsCategory = allCategory
            .where((category) => category.serOrGoods == 'GOODS')
            .toList();

        // Emit state with stock and category data
        emit(state.copyWith(
            isLoading: false,
            serProducts: serProducts,
            serCategory: serCategory,
            goodsProducts: goodsProducts,
            goodsCategory: goodsCategory,
            toKOTitems: []));
      } catch (e) {
        log('Error fetching stocks and categories: ${e.toString()}');
        emit(state.copyWith(isLoading: false));
      }
    });

    // Handle category selection
    on<CategorySelection>((event, emit) async {
      log('CategorySelection: ${event.category.pdtFilter} from ${event.from}');
      try {
        if (event.from == 'SER') {
          List<Product> serProductsA = serProducts
              .where((product) => product.category == event.category.pdtFilter)
              .toList();
          emit(state.copyWith(
            isLoading: false,
            serProducts: serProductsA,
            sercategory: event.category,
          ));
        } else if (event.from == 'GOODS') {
          List<Product> goodsProductsA = goodsProducts
              .where((product) => product.category == event.category.pdtFilter)
              .toList();
          emit(state.copyWith(
            isLoading: false,
            goodsProducts: goodsProductsA,
            goodscategory: event.category,
          ));
        }
      } catch (e) {
        log('Error during category selection: ${e.toString()}');
        emit(state.copyWith(isLoading: false));
      }
    });

    // Clear category selection
    on<Clearcategory>((event, emit) async {
      log('Clearcategory called');
      try {
        emit(state.copyWith(
          isLoading: false,
          serProducts: serProducts,
          sercategory: null,
          goodsProducts: goodsProducts,
          goodscategory: null,
        ));
      } catch (e) {
        log('Error clearing category: ${e.toString()}');
      }
    });

    // Search products
    on<Search>((event, emit) async {
      log('Search called with query: ${event.searchQuary}');
      try {
        emit(state.copyWith(isLoading: true));

        List<Product> filteredStocks = [];
        if (event.from == 'SER') {
          filteredStocks = serProducts.where((product) {
            return product.productName
                .toLowerCase()
                .contains(event.searchQuary.toLowerCase());
          }).toList();
          emit(state.copyWith(isLoading: false, serProducts: filteredStocks));
        } else if (event.from == 'GOODS') {
          filteredStocks = goodsProducts.where((product) {
            return product.productName
                .toLowerCase()
                .contains(event.searchQuary.toLowerCase());
          }).toList();
          emit(state.copyWith(isLoading: false, goodsProducts: filteredStocks));
        }
      } catch (e) {
        log('Error during search: ${e.toString()}');
        emit(state.copyWith(isLoading: false));
      }
    });

    // Add products
    on<Add>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      log('${event.isIncrement ? 'Increment' : 'Decrement'} product: ${event.product.productName} with quantity: ${event.qty} from ${event.from}');

      try {
        List<Product> tokotItems = List.from(state
            .toKOTitems); // Create a copy to avoid mutating the original state

        // Function to update tokotItems based on qty changes
        void updateTokotItems(Product product, int qtyChange) {
          final tokotIndex =
              tokotItems.indexWhere((item) => item.id == product.id);

          if (tokotIndex >= 0) {
            tokotItems[tokotIndex].changedQty += qtyChange;
            if (tokotItems[tokotIndex].changedQty <= 0) {
              tokotItems.removeAt(tokotIndex);
              log('Removed product ${product.productName} from tokotItems');
            } else {
              log('Updated tokotItems quantity: ${tokotItems[tokotIndex].changedQty}');
            }
          } else if (qtyChange > 0) {
            Product newProduct = product.copyWith(changedQty: qtyChange);
            tokotItems.add(newProduct);
            log('Added product ${newProduct.productName} to tokotItems with qty: ${newProduct.changedQty}');
          }
        }

        // Handling for SER products
        if (event.from == 'SER') {
          List<Product> products =
              List.from(state.serProducts); // Create a copy

          if (products
              .any((existingItem) => existingItem.id == event.product.id)) {
            final index = products.indexWhere((i) => i.id == event.product.id);
            if (event.update != null) {
              products[index].changedQty = event.qty;
              products[index].saleAmount = event.amount.toString();
            } else {
              if (event.isIncrement) {
                products[index].changedQty += event.qty;
              } else {
                products[index].changedQty =
                    (products[index].changedQty - event.qty)
                        .clamp(0, double.infinity)
                        .toInt();
              }
            }

            log('Updated quantity in SER: ${products[index].changedQty}');
            updateTokotItems(
                products[index], event.isIncrement ? event.qty : -event.qty);

            emit(state.copyWith(
                serProducts: products,
                toKOTitems: tokotItems,
                isLoading: false));
          }
        }

        // Handling for GOODS products
        else if (event.from == 'GOODS') {
          List<Product> products =
              List.from(state.goodsProducts); // Create a copy

          if (products
              .any((existingItem) => existingItem.id == event.product.id)) {
            final index = products.indexWhere((i) => i.id == event.product.id);

            if (event.update != null) {
              products[index].changedQty = event.qty;
            } else {
              if (event.isIncrement) {
                double totalStock = double.parse(products[index].totalStock);
                if (totalStock != products[index].changedQty) {
                  products[index].changedQty += event.qty;
                } else {
                  log('out of stock');
                }
              } else {
                products[index].changedQty =
                    (products[index].changedQty - event.qty)
                        .clamp(0, double.infinity)
                        .toInt();
              }
            }

            log('Updated quantity in GOODS: ${products[index].changedQty}');
            updateTokotItems(
                products[index], event.isIncrement ? event.qty : -event.qty);

            emit(state.copyWith(
                goodsProducts: products,
                toKOTitems: tokotItems,
                isLoading: false));
          }
        }
      } catch (e) {
        log('Error updating product: ${e.toString()}');
        emit(state.copyWith(isLoading: false));
      }
    });
  }
}
