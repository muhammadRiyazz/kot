import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mssql_connection/mssql_connection.dart';
import 'package:restaurant_kot/core/conn.dart';
import 'package:restaurant_kot/domain/item/kot_item_model.dart';
import 'package:restaurant_kot/domain/stock/stock_model.dart';
import 'package:restaurant_kot/infrastructure/initalfetchdata/taxtype.dart';
import 'package:restaurant_kot/infrastructure/stock/price_calculation.dart';
part 'stock_event.dart';
part 'stock_state.dart';
part 'stock_bloc.freezed.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  StockBloc() : super(StockState.initial()) {
    on<FetchAllItems>((event, emit) async {
      log('allFetch-------StockBloc -------------------------------------');
      emit(state.copyWith(isLoading: true));

      try {
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();

        String stockQuery = """
        SELECT [Id], [codeorSKU], [category], [pdtname], [HSNCode], [description], [puramnt], [puramntwithtax], [saleamnt], [saleamntwithtax], [profit], [pcs], [tax], [saletaxamnt], [stockcontrol], [totalstock], [lowstock], [warehouse], [vendername], [venderinvoice], [vendercontactname], [vendertax], [purtaxamnt], [venderimg], [vendertotalamnt], [vendertotaltaxamnt], [privatenote], [Date], [productimg], [status], [lossorgain], [vendorid], [hsncode1], [venIGST], [venIGSTamnt], [venCGST], [venCGSTamnt], [venSGST], [venSGSTamnt], [SERorGOODS], [itemMRP], [SaleincluORexclussive], [PurchaseincluORexclussive], [InitialCost], [AvgCost], [MessurmentsUnit], [SincluorExclu], [PincluorExclu], [BarcodeID], [SupplierName], [CessBasedonQntyorValue], [CessRate], [CatType], [CatBrand], [CatModelNo], [CatColor], [CatSize], [CatPartNumber], [CatSerialNumber], [AliasNameID], [InitialQuantity], [PCatType], [BrandType], [RePackingApplicable], [RepackingTo], [RepackingBalance], [BulkItemQty], [BalanceRepackingitemUnit], [RepackingitemUnit], [RepackingItemOf], [saleamntwithtax1AC], [PrinterName], [DininACrate], [DininNonACrate], [Deliveryrate], [pickuprate]
       FROM  [dbo].[MainStock]
       ;
       """;

        String stockQueryResult = await connection.getData(stockQuery);
        List<dynamic> stockJsonResponse = jsonDecode(stockQueryResult);

        List<Product> stocks =
            stockJsonResponse.map((data) => Product.fromJson(data)).toList();
        log('--- all list----${stocks.length.toString()} --------------------------------');
        // final List<kotItem> stocksnew = [];

        // for (var element in stocks) {
        //   double basicRate = basicRateclc(
        //     element: element,
        //     isAc: event.acOrNonAc,
        //   );

        //   double taxableAmount =
        //       taxableAmountcalculation(element: element, isAc: event.acOrNonAc);
        //   stocksnew.add(kotItem(
        //     cessAmt: 0.00,
        //     gstAmt: 0.00,
        //     kotno: 'null',
        //     stock: 0,
        //     qty: 0,
        //     serOrGoods: getCategory(element.codeOrSKU),
        //     kitchenName: element.printerName,
        //     itemName: element.productName,
        //     itemCode: element.codeOrSKU,
        //     quantity: 0,
        //     basicRate: basicRate,
        //     unitTaxableAmountBeforeDiscount: taxableAmount,
        //     unitTaxableAmount: taxableAmount,
        //     gstPer: double.parse(element.vendorIGST.toString()),
        //     cessPer: double.parse(element.cessRate.toString()),
        //   ));
        // }

//         for (var element in stocks) {
//           double basicRate = basicRateclc(
//             element: element,
//             isAc: true,
//           );

//           double taxableAmount =
//               taxableAmountcalculation(element: element, isAc: true);
//           stocksnew.add(kotItem(
//             cessAmt: 0.00,
//             gstAmt: 0.00,
//             kotno: 'null',
//             stock: 0,
//             qty: 0,
//             serOrGoods: getCategory(element.codeOrSKU),
//             kitchenName: element.printerName,
//             itemName: element.productName,
//             itemCode: element.codeOrSKU,
//             quantity: 0,
//             basicRate: basicRate,
//             unitTaxableAmountBeforeDiscount: taxableAmount,
//             unitTaxableAmount: taxableAmount,
//             gstPer: double.parse(element.vendorIGST.toString()),
//             cessPer: double.parse(element.cessRate.toString()),
//           ));
//         }

//         var toKOTMap = {
//           for (var element in state.toKOTitems)
//             element.itemCode: element.quantity
//         };

// // Iterate through items and update quantity
//         for (var item in stocksnew) {
//           item.quantity = toKOTMap[item.itemCode] ?? 0;
//         }
        emit(state.copyWith(isLoading: false, allList: stocks));
      } catch (e) {
        log('Error during category selection: ${e.toString()}');
        emit(state.copyWith(isLoading: false));
      }
    });

    on<CategoryFetch>((event, emit) async {
      log('CategoryFetch-------StockBloc');

      try {
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();

        // SQL query to fetch category and SERorGOODS
        String categoryQuery = """
      SELECT category, SERorGOODS 
      FROM [dbo].[MainStock]
    """;

        String rawResult = await connection.getData(categoryQuery);
        List<Map<String, dynamic>> categoryQueryResult =
            List<Map<String, dynamic>>.from(jsonDecode(rawResult));

        // Use Sets to handle duplicates
        Set<String> goodsCategorySet = {};
        Set<String> serCategorySet = {};

        for (var row in categoryQueryResult) {
          // Ensure correct extraction of category and SERorGOODS
          String? category = row['category'] as String?;
          String? serOrGoods = row['SERorGOODS'] as String?;

          if (category != null && serOrGoods != null) {
            if (serOrGoods == 'GOODS') {
              goodsCategorySet.add(category); // Add category to goods set
            } else if (serOrGoods == 'SER') {
              serCategorySet.add(category); // Add category to services set
            }
          }
        }

        // Convert Sets to Lists for final state
        List<String> goodsCategory = goodsCategorySet.toList();
        List<String> serCategory = serCategorySet.toList();

        // Emit the state with the grouped and unique categories
        emit(state.copyWith(
          goodsCategory: goodsCategory,
          serCategory: serCategory,
        ));
      } catch (e) {
        log('Error: ${e.toString()}');
      }
    });

    on<ItemInitalFetch>((event, emit) async {
      log('ItemInitalFetch-------StockBloc');

      if (event.acOrNonAc) {
        log('-------AC table ----');
      } else {
        log('-------NonAC table ----');
      }
      emit(state.copyWith(isLoading: true));

      try {
        // Initialize database connection
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();

        // Optimized SQL Query with JOIN to include productImg
        const String itemsQuery = """
       WITH UniqueItems AS (
       SELECT 
        id, pdtcode, pdtname, HSNCode, discp, 
        itemMRP, Amount, GrossValueAftrITMDisc, ItemBillDiscPER,
        ItemBillDiscAmount, ItemTotalNETAmount, gst, gstamount,
        Totalamount, venIGST, venIGSTamnt, venCGST, venCGSTamnt,
        venSGST, venSGSTamnt, SerManDetails, CessPercentage,
        CessAmount, ItemUnitSaleRate,
        ROW_NUMBER() OVER(PARTITION BY pdtcode ORDER BY id DESC) AS row_num
       FROM dbo.invoicedetail
)
SELECT 
    ui.*, 
    ms.PrinterName, 
    ms.productImg,
    ms.DininACrate,  
    ms.saleamnt,
    ms.DininNonACrate 
FROM UniqueItems ui
LEFT JOIN dbo.MainStock ms 
ON ms.codeorSKU = ui.pdtcode
WHERE ui.row_num = 1
ORDER BY ui.id DESC;

    """;

        // Execute query and get result
        String? itemQueryResult = await connection.getData(itemsQuery);
        log(' ----------------- iiiii------$itemQueryResult');
        // Parse JSON result if it exists
        List<Map<String, dynamic>> rows = [];
        try {
          rows = List<Map<String, dynamic>>.from(json.decode(itemQueryResult));
        } catch (e) {
          log('Error parsing JSON: $e');
        }

        // Initialize lists for categorizing items
        List<kotItem> serKitchenItems = [];
        List<kotItem> goodsKitchenItems = [];

        // Process each row and categorize items based on `pdtcode`
        for (var element in rows) {
          final goodsORser = getCategory(element['pdtcode'] ?? '');

          double taxp = safeParseDouble(element['gst']) +
              safeParseDouble(element['CessPercentage']);

          double percentage =
              (taxp / 100) * safeParseDouble(element['saleamnt']);

          double basicRate = goodsORser == 'SER'
              ? safeParseDouble(event.acOrNonAc
                  ? element['DininACrate']
                  : element['DininNonACrate'])
              : inc == true
                  ? safeParseDouble(element['saleamnt'])
                  : safeParseDouble(element['saleamnt']);

          // calculateBasicRate(
          //   element: element,
          //   isAc: event.acOrNonAc,
          // );
          double taxableAmount = calculationtaxableAmount(
              element: element, rateAcNonAc: basicRate);

          // Create kotItem object and add it to the appropriate category list
          kotItem item = kotItem(
            updated: false,
            productImg: element['productImg'] ?? '',
            parcelOrnot: '',
            cessAmt: 0.00,
            gstAmt: 0.00,
            kotno: 'null',
            stock: 0,
            qty: 0,
            serOrGoods: getCategory(element['pdtcode'] ?? ''),
            kitchenName: element['PrinterName'] ?? '',
            itemName: element['pdtname'] ?? '',
            itemCode: element['pdtcode'] ?? '',
            quantity: 0,
            basicRate: basicRate,
            unitTaxableAmountBeforeDiscount: taxableAmount,
            unitTaxableAmount: taxableAmount,
            gstPer:
                double.tryParse(element['venIGST']?.toString() ?? '0.0') ?? 0.0,
            cessPer: double.tryParse(
                    element['CessPercentage']?.toString() ?? '0.0') ??
                0.0,
          );

          // Categorize based on `serOrGoods`
          if (getCategory(element['pdtcode']) == 'SER') {
            serKitchenItems.add(item);
          } else if (getCategory(element['pdtcode']) == 'GOODS') {
            goodsKitchenItems.add(item);
          }
        }

        var toKOTMap = {
          for (var element in state.toKOTitems)
            element.itemCode: element.quantity
        };

        // Iterate through items and update quantity
        for (var item in serKitchenItems) {
          item.quantity = toKOTMap[item.itemCode] ?? 0;
        }

        // Emit state with updated data
        emit(state.copyWith(
          isLoading: false,
          seritems: serKitchenItems,
          goodsitems: goodsKitchenItems,
          stocklist: serKitchenItems, // Default to 'SER' items for now
          goodsOrSER: 'Service',
        ));
      } catch (e) {
        emit(state.copyWith(isLoading: false));
        log('Error fetching items: $e');
      }
    });

    on<TypeChange>((event, emit) async {
      log('TypeChange-------StockBloc');

      try {
        // Select items and category based on type (Goods/Service)
        List<kotItem> items = [];
        List<String> category = [];

        if (event.type == 'Goods') {
          items = state.goodsitems;
          category = state.goodsCategory;
        } else {
          items = state.seritems;
          category = state.serCategory;
        }

        // Update quantities in itemslist based on kotQuantityMap
        // Create a map for quick lookup of itemCode to quantity
        var toKOTMap = {
          for (var element in state.toKOTitems)
            element.itemCode: element.quantity
        };

// Iterate through items and update quantity
        for (var item in items) {
          item.quantity = toKOTMap[item.itemCode] ?? 0;
        }

        // Emit state with updated stocklist
        emit(state.copyWith(
          category: category,
          goodsOrSER: event.type,
          selectedcategory: null,
          stocklist: items,
        ));
      } catch (e) {
        emit(state.copyWith(isLoading: false));
        log('Error in TypeChange: $e');
      }
    });
    on<CategorySelection>((event, emit) async {
      log('CategorySelection-------StockBloc');

      emit(state.copyWith(isLoading: true));

      try {
        if (event.category == null) {
          log('Error: event.category is null');
          emit(state.copyWith(isLoading: false));
          return;
        }

        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();

        String stockQuery = """
      SELECT * FROM [dbo].[MainStock]
      WHERE [SERorGOODS] = '${state.goodsOrSER == 'Goods' ? 'GOODS' : 'SER'}' 
      AND [category] = '${event.category}';
     """;

        String stockQueryResult = await connection.getData(stockQuery);
        log(stockQueryResult);

        if (stockQueryResult.isEmpty) {
          log('Error: stockQueryResult is null or empty');
          emit(state.copyWith(isLoading: false));
          return;
        }

        List<dynamic> stockJsonResponse = [];
        try {
          stockJsonResponse = jsonDecode(stockQueryResult);
        } catch (e) {
          log('Error decoding JSON: ${e.toString()}');
          emit(state.copyWith(isLoading: false));
          return;
        }

        List<Product> stocks =
            stockJsonResponse.map((data) => Product.fromJson(data)).toList();

        final List<kotItem> stocksnew = [];

        for (var element in stocks) {
          double basicRate =
              basicRateclc(element: element, isAc: event.acOrNonAc);
          double taxableAmount =
              taxableAmountcalculation(element: element, isAc: event.acOrNonAc);

          stocksnew.add(kotItem(
            updated: false,
            productImg: element.productImg,
            parcelOrnot: '',
            cessAmt: 0.00,
            gstAmt: 0.00,
            kotno: 'null',
            stock: 0,
            qty: 0,
            serOrGoods: getCategory(element.codeOrSKU),
            kitchenName: element.printerName,
            itemName: element.productName,
            itemCode: element.codeOrSKU,
            quantity: 0,
            basicRate: basicRate,
            unitTaxableAmountBeforeDiscount: taxableAmount,
            unitTaxableAmount: taxableAmount,
            gstPer: double.tryParse(element.vendorIGST.toString()) ?? 0.0,
            cessPer: double.tryParse(element.cessRate.toString()) ?? 0.0,
          ));
        }

        var toKOTMap = {
          for (var element in (state.toKOTitems ?? []))
            element.itemCode: element.quantity
        };

        for (var item in stocksnew) {
          item.quantity = toKOTMap[item.itemCode] ?? 0;
        }

        emit(state.copyWith(
            isLoading: false,
            stocklist: stocksnew,
            selectedcategory: event.category));
      } catch (e) {
        log('Error during category selection: ${e.toString()}');
        emit(state.copyWith(isLoading: false));
      }
    });

    // Clear category selection
    on<Clearcategory>((event, emit) async {
      log('Clearcategory-------StockBloc');
      try {
        List<kotItem> items = [];
        if (state.goodsOrSER == 'Goods') {
          items = state.goodsitems;
        } else {
          items = state.seritems;
        }
        var toKOTMap = {
          for (var element in state.toKOTitems)
            element.itemCode: element.quantity
        };

// Iterate through items and update quantity
        for (var item in items) {
          item.quantity = toKOTMap[item.itemCode] ?? 0;
        }
        emit(state.copyWith(selectedcategory: null, stocklist: items));
      } catch (e) {
        log('Error clearing category: ${e.toString()}');
      }
    });

    // Search products
    on<Search>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      log('Starting search in StockBloc');

      try {
        final String goodsOrSER = state.goodsOrSER == 'Goods' ? 'GOODS' : 'SER';
        final List<Product> allList = state.allList;
        log('----allList---${allList.length.toString()} --------------------------------');
        // Filter by category (serOrGoods)
        final List<Product> filteredByCategory =
            allList.where((item) => item.serOrGoods == goodsOrSER).toList();
        log('----filteredByCategory---${filteredByCategory.length.toString()} --------------------------------');

        // Further filter by product name based on search query
        final List<Product> matchingItems = filteredByCategory.where((item) {
          // Safely handle null values and apply trim + toLowerCase
          final productName = item.productName.trim().toLowerCase();
          final searchQuery = event.searchQuary.trim().toLowerCase();
          return productName.contains(searchQuery);
        }).toList();

        log('----matchingItems---${matchingItems.length.toString()} --------------------------------');

        // Create the final stock list
        final List<kotItem> stocksNew = matchingItems.map((element) {
          log('dineInACRate: ${element.dineInACRate}');
          log('dineInNonACRate: ${element.dineInNonACRate}');

          double basicRate =
              basicRateclc(element: element, isAc: event.acOrNonAc);
          double taxableAmount =
              taxableAmountcalculation(element: element, isAc: event.acOrNonAc);

          return kotItem(
            updated: false,
            productImg: element.productImg,
            parcelOrnot: '',
            cessAmt: 0.00,
            gstAmt: 0.00,
            kotno: 'null', // Use a more appropriate default value than 'null'
            stock: 0,
            qty: 0,
            serOrGoods: getCategory(element.codeOrSKU),
            kitchenName: element.printerName,
            itemName: element.productName,
            itemCode: element.codeOrSKU,
            quantity: 0,
            basicRate: basicRate,
            unitTaxableAmountBeforeDiscount: taxableAmount,
            unitTaxableAmount: taxableAmount,
            gstPer: double.parse(element.vendorIGST.toString()),
            cessPer: double.parse(element.cessRate.toString()),
          );
        }).toList();

        // Create a map for item quantities from the existing state
        var toKOTMap = {
          for (var element in state.toKOTitems)
            element.itemCode: element.quantity
        };

        // Update quantities based on the existing 'toKOTMap'
        for (var item in stocksNew) {
          item.quantity = toKOTMap[item.itemCode] ?? 0;
        }
        log('----stocksNew---${stocksNew.length.toString()} --------------------------------');

        // Emit the updated state
        emit(state.copyWith(
          isLoading: false,
          stocklist: stocksNew,
          selectedcategory: null,
        ));
      } catch (e, stackTrace) {
        log('Error during search: ${e.toString()}\nStackTrace: $stackTrace');
        emit(state.copyWith(isLoading: false));
      }
    });

    on<ClearSelection>((event, emit) async {
      log('ClearSelection-------StockBloc');

      emit(state.copyWith(
        toKOTitems: [],
        cancelKOTitems: [],
      ));
    });

    // Add products
    on<Add>((event, emit) async {
      log('Add-------StockBloc');

      log('${event.isIncrement ? 'Increment' : 'Decrement'} product: ${event.productid} with quantity: ${event.qty}');

      try {
        // Create a mutable copy of toKOTitems to avoid mutating the original state
        List<kotItem> tokotItems = List.from(state.toKOTitems);

        void updateTokotItems(kotItem product, int qtyChange) {
          log('updateTokotItems');
          final tokotIndex = tokotItems
              .indexWhere((item) => item.itemCode == product.itemCode);

          if (tokotIndex >= 0) {
            if (event.update != null) {
              kotItem updatedProduct = tokotItems[tokotIndex]
                  .copyWith(quantity: qtyChange, basicRate: event.amount);
              tokotItems[tokotIndex] = updatedProduct;
            } else if (event.update == null) {
              log('not from update section ');
              // Modify changedQty through copyWith to ensure immutability
              kotItem updatedProduct = tokotItems[tokotIndex].copyWith(
                quantity: tokotItems[tokotIndex].quantity + qtyChange,
              );

              if (updatedProduct.quantity <= 0) {
                tokotItems.removeAt(tokotIndex);
                log('Removed product ${product.itemCode} from tokotItems');
              } else {
                tokotItems[tokotIndex] = updatedProduct;
                log('Updated tokotItems quantity: ${updatedProduct.quantity}');
              }
            }
          } else if (qtyChange > 0) {
            // Add new product with the updated quantity
            kotItem newProduct = product.copyWith(quantity: qtyChange);
            tokotItems.add(newProduct);
            log('Added product ${newProduct.itemName} to tokotItems with qty: ${newProduct.quantity}');
          }
        }

        // Handling for SER products
        // if (event.from == 'SER') {
        // Create a deep copy of the SER products list
        List<kotItem> products =
            state.stocklist.map((product) => product.copyWith()).toList();

        if (products
            .any((existingItem) => existingItem.itemCode == event.productid)) {
          final index =
              products.indexWhere((i) => i.itemCode == event.productid);

          // Update product quantity and sale amount
          if (event.update != null) {
            products[index] = products[index].copyWith(
              updated: true,
              quantity: event.qty,
              basicRate: event.amount,
              unitTaxableAmount: updatetaxableAmountcalculation(
                  element: products[index], amt: event.amount!),
              unitTaxableAmountBeforeDiscount: updatetaxableAmountcalculation(
                  element: products[index], amt: event.amount!),
            );
            log('products[index].qty   ---${products[index].quantity}');

            // log(event.amount.toString());

            // log(products[index].saleAmount);
            // log(products[index].changedQty.toString());
          } else {
            log('event.update == null');
            log(' products[index].quantity case a   ---${products[index].quantity}');
            if (event.isIncrement) {
              log('event.isIncrement');
              products[index] = products[index].copyWith(
                quantity: products[index].quantity + event.qty,
              );
              log(' products[index].quantity case b ---${products[index].quantity}');
            } else {
              log('event.isIncrement  not');

              products[index] = products[index].copyWith(
                quantity: (products[index].quantity - event.qty)
                    .clamp(0, double.infinity)
                    .toInt(),
              );
            }
          }

          if (event.item != null) {
            log('case ---1');

            updateTokotItems(
                event.item!, event.isIncrement ? event.qty : -event.qty);
            emit(state.copyWith(
              stocklist: products,
              toKOTitems: tokotItems,
              isLoading: false,
            ));
            // Emit the updated state with deep-copied lists
          } else {
            log('case ---2');
            updateTokotItems(
                products[index], event.isIncrement ? event.qty : -event.qty);

            // Emit the updated state with deep-copied lists
            emit(state.copyWith(
              stocklist: products,
              toKOTitems: tokotItems,
              isLoading: false,
            ));
          }
        } else {
          updateTokotItems(
              event.item!, event.isIncrement ? event.qty : -event.qty);

          emit(state.copyWith(
            stocklist: products,
            toKOTitems: tokotItems,
            isLoading: false,
          ));

          log('ppppp');
        }
        log('tokotItems-----${tokotItems.length}');
      } catch (e) {
        log('Error updating product: ${e.toString()}');
        emit(state.copyWith(isLoading: false));
      }
    });

    on<ListFromOrder>((event, emit) async {
      log(event.itemslist.length.toString());
      log(state.toKOTitems.length.toString());
      log('ListFromOrder-------StockBloc');

      try {
        // // if (event.from==1) {
        // final existingItemCodes =
        //     state.toKOTitems.map((item) => item.itemCode).toSet();
        // List<KitchenItem> newItems = event.itemslist
        //     .where((item) => !existingItemCodes.contains(item.itemCode))
        //     .map((item) {
        //   return item;
        // }).toList();

        emit(state.copyWith(
          cancelKOTitems: event.cancelItemslist,
          isLoading: false,
        ));
        // } else {
        //   emit(state.copyWith(
        //   toKOTitems: event.itemslist,
        //   isLoading: false,
        // ));
        // }
      } catch (e) {
        log('Error updating product: ${e.toString()}');
        emit(state.copyWith(isLoading: false));
      }
    });

    on<ItemAction>((event, emit) async {
      log('StockBloc  -- ItemAction');

      List<kotItem> cancelKitchenItem = List.from(state.cancelKOTitems);
      List<kotItem> kotKItem = List.from(state.toKOTitems);

      if (event.from == 'cancellist') {
        cancelKitchenItem
            .removeWhere((element) => event.item.itemCode == element.itemCode);
      } else if (event.from == 'kotlist') {
        kotKItem
            .removeWhere((element) => event.item.itemCode == element.itemCode);
      }

      emit(state.copyWith(
        cancelKOTitems: cancelKitchenItem,
        toKOTitems: kotKItem,
      ));
    });
  }
}
  // // Process category query result
  //       List<dynamic> categoryJsonResponse = jsonDecode(categoryQueryResult);
  //       List<Category> allCategory = categoryJsonResponse
  //           .map((data) => Category.fromJson(data))
  //           .toList();
  //       List<Category> serCategory = allCategory
  //           .where((category) => category.serOrGoods == 'SER')
  //           .toList();
  //       List<Category> goodsCategory = allCategory
  //           .where((category) => category.serOrGoods == 'GOODS')
  //           .toList();