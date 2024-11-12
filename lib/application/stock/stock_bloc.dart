import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mssql_connection/mssql_connection.dart';
import 'package:restaurant_kot/core/conn.dart';
import 'package:restaurant_kot/domain/category/category.dart';
import 'package:restaurant_kot/domain/item/kot_item_model.dart';
import 'package:restaurant_kot/domain/stock/stock_model.dart';
part 'stock_event.dart';
part 'stock_state.dart';
part 'stock_bloc.freezed.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  StockBloc() : super(StockState.initial()) {
    on<CategoryFetch>((event, emit) async {
      log('CategoryFetch-------StockBloc');

      try {
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();

        String categoryQuery = """
      SELECT * FROM [Restaurant].[dbo].[Category]
       """;

        String? categoryQueryResult = await connection.getData(categoryQuery);

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
        emit(state.copyWith(
            goodsCategory: goodsCategory, serCategory: serCategory));
      } catch (e) {
        log(e.toString());
      }
    });
    on<ItemInitalFetch>((event, emit) async {
      log('ItemInitalFetch-------StockBloc');
      emit(state.copyWith(isLoading: true));

      try {
        // Initialize database connection
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();

        // SQL Query for fetching unique items based on `pdtcode`, ordered by `Id` descending
        const String itemsQuery = """
      WITH UniqueItems AS (
          SELECT 
                [Id], [pdtcode], [pdtname], [HSNCode], [discp], [unitprice],
                [itemMRP], [Amount], [GrossValueAftrITMDisc], [ItemBillDiscPER],
                [ItemBillDiscAmount], [ItemTotalNETAmount], [gst], [gstamount],
                [Totalamount], [venIGST], [venIGSTamnt], [venCGST], [venCGSTamnt],
                [venSGST], [venSGSTamnt], [SerManDetails], [CessPercentage],
                [CessAmount], [ItemUnitSaleRate],
                ROW_NUMBER() OVER(PARTITION BY [pdtcode] ORDER BY [Id] DESC) AS row_num
          FROM [Restaurant].[dbo].[invoicedetail]
      )
      SELECT *
      FROM UniqueItems
      WHERE row_num = 1
      ORDER BY [Id] DESC;
    """;

        // Execute query and get result
        String? itemQueryResult = await connection.getData(itemsQuery);

        // Parse JSON result if it exists
        List<Map<String, dynamic>> rows = [];
        try {
          rows = List<Map<String, dynamic>>.from(json.decode(itemQueryResult));
        } catch (e) {
          log('Error parsing JSON: $e');
        }

        // Initialize lists for categorizing items
        List<KitchenItem> serKitchenItems = [];
        List<KitchenItem> goodsKitchenItems = [];

        // Process each row and categorize items based on `pdtcode`
        for (var row in rows) {
          KitchenItem item = KitchenItem(
            stock: '0',
            qty: 0,
            serOrGoods: row['serOrGoods'] ?? '',
            kitchenName: '',
            itemName: row['pdtname'] ?? '',
            itemCode: row['pdtcode'] ?? '',
            quantity: 0,
            basicRate: row['saleamnt']?.toString() ?? '0',
            unitTaxableAmountBeforeDiscount: '0',
            unitTaxableAmount: '0',
            totalTaxableAmount: '0',
            gstPer: '0',
            cessPer: '0',
            totalTaxAmount: '0',
            totalCessAmount: '0',
            totalAmount: '0',
            dininACrate: '0',
            dininNonACrate: '0',
          );

          // Categorize based on `serOrGoods`
          if (getCategory(row['pdtcode']) == 'SER') {
            serKitchenItems.add(item);
          } else if (getCategory(row['pdtcode']) == 'GOODS') {
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
        List<KitchenItem> items = [];
        List<Category> category = [];

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
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();

        String stockQuery = """
  SELECT [Id], [codeorSKU], [category], [pdtname], [HSNCode], [description], [puramnt], [puramntwithtax], [saleamnt], [saleamntwithtax], [profit], [pcs], [tax], [saletaxamnt], [stockcontrol], [totalstock], [lowstock], [warehouse], [vendername], [venderinvoice], [vendercontactname], [vendertax], [purtaxamnt], [venderimg], [vendertotalamnt], [vendertotaltaxamnt], [privatenote], [Date], [productimg], [status], [lossorgain], [vendorid], [hsncode1], [venIGST], [venIGSTamnt], [venCGST], [venCGSTamnt], [venSGST], [venSGSTamnt], [SERorGOODS], [itemMRP], [SaleincluORexclussive], [PurchaseincluORexclussive], [InitialCost], [AvgCost], [MessurmentsUnit], [SincluorExclu], [PincluorExclu], [BarcodeID], [SupplierName], [CessBasedonQntyorValue], [CessRate], [CatType], [CatBrand], [CatModelNo], [CatColor], [CatSize], [CatPartNumber], [CatSerialNumber], [AliasNameID], [InitialQuantity], [PCatType], [BrandType], [RePackingApplicable], [RepackingTo], [RepackingBalance], [BulkItemQty], [BalanceRepackingitemUnit], [RepackingitemUnit], [RepackingItemOf], [saleamntwithtax1AC], [PrinterName], [DininACrate], [DininNonACrate], [Deliveryrate], [pickuprate]
  FROM [Restaurant].[dbo].[MainStock]
  WHERE [SERorGOODS] = '${state.goodsOrSER == 'Goods' ? 'GOODS' : 'SER'}' 
    AND [category] = '${event.category.pdtFilter}';
""";

        String stockQueryResult = await connection.getData(stockQuery);
        List<dynamic> stockJsonResponse = jsonDecode(stockQueryResult);

        List<Product> stocks =
            stockJsonResponse.map((data) => Product.fromJson(data)).toList();

        final List<KitchenItem> stocksnew = [];

        for (var element in stocks) {
          stocksnew.add(KitchenItem(
              dininACrate: element.dineInACRate,
              dininNonACrate: element.dineInNonACRate,
              stock: '0',
              qty: 0,
              serOrGoods: getCategory(element.codeOrSKU),
              kitchenName: element.printerName,
              itemName: element.productName,
              itemCode: element.codeOrSKU,
              quantity: 0,
              basicRate: element.saleAmount,
              unitTaxableAmountBeforeDiscount: '0',
              unitTaxableAmount: '0',
              totalTaxableAmount: element.saleAmountWithTax,
              gstPer: '0',
              cessPer: '0',
              totalTaxAmount: '0',
              totalCessAmount: '0',
              totalAmount: element.saleAmountWithTax));
        }

        var toKOTMap = {
          for (var element in state.toKOTitems)
            element.itemCode: element.quantity
        };

// Iterate through items and update quantity
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
        List<KitchenItem> items = [];
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
      emit(state.copyWith(
        isLoading: true,
      ));

      log('Search-------StockBloc');
      try {
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();

        String stockQuery = """
  SELECT [Id], [codeorSKU], [category], [pdtname], [HSNCode], [description], [puramnt], [puramntwithtax], [saleamnt], [saleamntwithtax], [profit], [pcs], [tax], [saletaxamnt], [stockcontrol], [totalstock], [lowstock], [warehouse], [vendername], [venderinvoice], [vendercontactname], [vendertax], [purtaxamnt], [venderimg], [vendertotalamnt], [vendertotaltaxamnt], [privatenote], [Date], [productimg], [status], [lossorgain], [vendorid], [hsncode1], [venIGST], [venIGSTamnt], [venCGST], [venCGSTamnt], [venSGST], [venSGSTamnt], [SERorGOODS], [itemMRP], [SaleincluORexclussive], [PurchaseincluORexclussive], [InitialCost], [AvgCost], [MessurmentsUnit], [SincluorExclu], [PincluorExclu], [BarcodeID], [SupplierName], [CessBasedonQntyorValue], [CessRate], [CatType], [CatBrand], [CatModelNo], [CatColor], [CatSize], [CatPartNumber], [CatSerialNumber], [AliasNameID], [InitialQuantity], [PCatType], [BrandType], [RePackingApplicable], [RepackingTo], [RepackingBalance], [BulkItemQty], [BalanceRepackingitemUnit], [RepackingitemUnit], [RepackingItemOf], [saleamntwithtax1AC], [PrinterName], [DininACrate], [DininNonACrate], [Deliveryrate], [pickuprate]
  FROM [Restaurant].[dbo].[MainStock]
 WHERE [SERorGOODS] = '${state.goodsOrSER == 'Goods' ? 'GOODS' : 'SER'}'
    AND LOWER([pdtname]) LIKE LOWER('%${event.searchQuary.trim()}%');
""";
        String stockQueryResult = await connection.getData(stockQuery);
        List<dynamic> stockJsonResponse = jsonDecode(stockQueryResult);

        List<Product> stocks =
            stockJsonResponse.map((data) => Product.fromJson(data)).toList();

        final List<KitchenItem> stocksnew = [];

        for (var element in stocks) {
          stocksnew.add(KitchenItem(
              dininACrate: element.dineInACRate,
              dininNonACrate: element.dineInNonACRate,
              stock: '0',
              qty: 0,
              serOrGoods: getCategory(element.codeOrSKU),
              kitchenName: element.printerName,
              itemName: element.productName,
              itemCode: element.codeOrSKU,
              quantity: 0,
              basicRate: element.saleAmount,
              unitTaxableAmountBeforeDiscount: '0',
              unitTaxableAmount: '0',
              totalTaxableAmount: element.saleAmountWithTax,
              gstPer: '0',
              cessPer: '0',
              totalTaxAmount: '0',
              totalCessAmount: '0',
              totalAmount: element.saleAmountWithTax));
        }

        var toKOTMap = {
          for (var element in state.toKOTitems)
            element.itemCode: element.quantity
        };

// Iterate through items and update quantity
        for (var item in stocksnew) {
          item.quantity = toKOTMap[item.itemCode] ?? 0;
        }
        emit(state.copyWith(
            isLoading: false, stocklist: stocksnew, selectedcategory: null));
      } catch (e) {
        log('Error during search: ${e.toString()}');
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
        List<KitchenItem> tokotItems = List.from(state.toKOTitems);

        void updateTokotItems(KitchenItem product, int qtyChange) {
          log('updateTokotItems');
          final tokotIndex = tokotItems
              .indexWhere((item) => item.itemCode == product.itemCode);

          if (tokotIndex >= 0) {
            if (event.update != null) {
              KitchenItem updatedProduct = tokotItems[tokotIndex]
                  .copyWith(quantity: qtyChange, totalAmount: event.amount);
              tokotItems[tokotIndex] = updatedProduct;
            } else if (event.update == null) {
              log('not from update section ');
              // Modify changedQty through copyWith to ensure immutability
              KitchenItem updatedProduct = tokotItems[tokotIndex].copyWith(
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
            KitchenItem newProduct = product.copyWith(quantity: qtyChange);
            tokotItems.add(newProduct);
            log('Added product ${newProduct.itemName} to tokotItems with qty: ${newProduct.quantity}');
          }
        }

        // Handling for SER products
        // if (event.from == 'SER') {
        // Create a deep copy of the SER products list
        List<KitchenItem> products =
            state.stocklist.map((product) => product.copyWith()).toList();

        if (products
            .any((existingItem) => existingItem.itemCode == event.productid)) {
          final index =
              products.indexWhere((i) => i.itemCode == event.productid);

          // Update product quantity and sale amount
          if (event.update != null) {
            products[index] = products[index].copyWith(
              quantity: event.qty,
              basicRate: event.amount.toString(),
            );
            // log(event.amount.toString());

            // log(products[index].saleAmount);
            // log(products[index].changedQty.toString());
          } else {
            if (event.isIncrement) {
              log('event.isIncrement');
              products[index] = products[index].copyWith(
                quantity: products[index].quantity + event.qty,
              );
            } else {
              log('event.isIncrement  not');

              products[index] = products[index].copyWith(
                quantity: (products[index].quantity - event.qty)
                    .clamp(0, double.infinity)
                    .toInt(),
              );
            }
          }

          log('Updated quantity in SER: ${products[index].quantity}');
          updateTokotItems(
              products[index], event.isIncrement ? event.qty : -event.qty);

          // Emit the updated state with deep-copied lists
          emit(state.copyWith(
            stocklist: products,
            toKOTitems: tokotItems,
            isLoading: false,
          ));
        }

        if (   event.item!=null) {
          updateTokotItems(
              event.item!, event.isIncrement ? event.qty : -event.qty);

          // Emit the updated state with deep-copied lists
          emit(state.copyWith(
            stocklist: products,
            toKOTitems: tokotItems,
            isLoading: false,
          ));
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

  List<KitchenItem> cancelKitchenItem = List.from(state.cancelKOTitems);
  List<KitchenItem> kotKItem = List.from(state.toKOTitems);

  if (event.from == 'cancellist') {
    cancelKitchenItem.removeWhere((element) => event.item.itemCode == element.itemCode);
  } else if (event.from == 'kotlist') {
    kotKItem.removeWhere((element) => event.item.itemCode == element.itemCode);
  }

  emit(state.copyWith(
    cancelKOTitems: cancelKitchenItem,
    toKOTitems: kotKItem,
  ));
});


  }
}

String getCategory(String code) {
  final regex = RegExp(r'^[A-Z]+'); // Regular expression to capture the prefix
  final match = regex.firstMatch(code);
  String prefix = match?.group(0) ?? ''; // Extracted prefix

  // Map the prefix to the corresponding category
  switch (prefix) {
    case 'PDT':
      return 'GOODS';
    case 'SER':
      return 'SER';
    default:
      return 'Unknown Category';
  }
}
