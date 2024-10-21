import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mssql_connection/mssql_connection.dart';
import 'package:restaurant_kot/core/conn.dart';
import 'package:restaurant_kot/domain/category/category.dart';
import 'package:restaurant_kot/domain/stock/stock_model.dart';
part 'stock_event.dart';
part 'stock_state.dart';
part 'stock_bloc.freezed.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  StockBloc() : super(StockState.initial()) {
    List<Product> serProducts = [];
    List<Product> goodsProducts = [];

    on<FetchStocks>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));

      try {
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();

        // Query to get the last 40 products
        String stockQuery = """
          SELECT 
              [Id], 
              [codeorSKU], 
              [category], 
              [pdtname], 
              [HSNCode], 
              [description], 
              [puramnt], 
              [puramntwithtax], 
              [saleamnt], 
              [saleamntwithtax], 
              [profit], 
              [pcs], 
              [tax], 
              [saletaxamnt], 
              [stockcontrol], 
              [totalstock], 
              [lowstock], 
              [warehouse], 
              [vendername], 
              [venderinvoice], 
              [vendercontactname], 
              [vendertax], 
              [purtaxamnt], 
              [venderimg], 
              [vendertotalamnt], 
              [vendertotaltaxamnt], 
              [privatenote], 
              [Date], 
              [productimg], 
              [status], 
              [lossorgain], 
              [vendorid], 
              [hsncode1], 
              [venIGST], 
              [venIGSTamnt], 
              [venCGST], 
              [venCGSTamnt], 
              [venSGST], 
              [venSGSTamnt], 
              [SERorGOODS], 
              [itemMRP], 
              [SaleincluORexclussive], 
              [PurchaseincluORexclussive], 
              [InitialCost], 
              [AvgCost], 
              [MessurmentsUnit], 
              [SincluorExclu], 
              [PincluorExclu], 
              [BarcodeID], 
              [SupplierName], 
              [CessBasedonQntyorValue], 
              [CessRate], 
              [CatType], 
              [CatBrand], 
              [CatModelNo], 
              [CatColor], 
              [CatSize], 
              [CatPartNumber], 
              [CatSerialNumber], 
              [AliasNameID], 
              [InitialQuantity], 
              [PCatType], 
              [BrandType], 
              [RePackingApplicable], 
              [RepackingTo], 
              [RepackingBalance], 
              [BulkItemQty], 
              [BalanceRepackingitemUnit], 
              [RepackingitemUnit], 
              [RepackingItemOf], 
              [saleamntwithtax1AC], 
              [PrinterName], 
              [DininACrate], 
              [DininNonACrate], 
              [Deliveryrate], 
              [pickuprate]
          FROM [Restaurant].[dbo].[MainStock]
        
        """;
        // ORDER BY [Id] DESC
        //         OFFSET 0 ROWS
        //         FETCH NEXT 40 ROWS ONLY
        String? stockQueryresult = await connection.getData(stockQuery);
        // log(stockQueryresult);
        List<dynamic> jsonResponse = jsonDecode(stockQueryresult);

        // Map the JSON to a list of Product objects
        List<Product> stocks =
            jsonResponse.map((data) => Product.fromJson(data)).toList();

        // Separate SER and GOODS into two lists
        serProducts =
            stocks.where((product) => product.serOrGoods == 'SER').toList();
        goodsProducts =
            stocks.where((product) => product.serOrGoods == 'GOODS').toList();

        // Emit the state with both lists
        emit(state.copyWith(
            isLoading: false,
            serProducts: serProducts,
            sercategory: null,
            goodsProducts: goodsProducts,
            goodscategory: null));
      } catch (e) {
        emit(state.copyWith(isLoading: false));
        log(e.toString());
      }
    });

    on<FetchCategory>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));

      try {
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();

        // Query to get the last 40 products
        String categoryQuery = """
         SELECT 
         [Id],
         [pdtfilter],
         [SERorGOODS]
         FROM 
         [Restaurant].[dbo].[Category]
         """;

        String? categoryQueryresult = await connection.getData(categoryQuery);
        // log(categoryQueryresult);
        List<dynamic> jsonResponse = jsonDecode(categoryQueryresult);

        // Map the JSON to a list of Product objects
        List<Category> allCategory =
            jsonResponse.map((data) => Category.fromJson(data)).toList();

        // Separate SER and GOODS into two lists
        List<Category> sercategory = allCategory
            .where((category) => category.serOrGoods == 'SER')
            .toList();
        List<Category> goodscategory = allCategory
            .where((category) => category.serOrGoods == 'GOODS')
            .toList();
        // Emit the state with both lists
        emit(state.copyWith(
            isLoading: false,
            goodsCategory: goodscategory,
            serCategory: sercategory));
      } catch (e) {
        emit(state.copyWith(isLoading: false));
        log(e.toString());
      }
    });

    on<CategorySelection>((event, emit) async {
      try {
        if (event.from == 'SER') {
          List<Product> serProductsA = serProducts
              .where((product) => product.category == event.category.pdtFilter)
              .toList();

          emit(state.copyWith(
              isLoading: false,
              serProducts: serProductsA,
              sercategory: event.category));
        } else if (event.from == 'GOODS') {
          List<Product> goodsProductsA = goodsProducts
              .where((product) => product.category == event.category.pdtFilter)
              .toList();

          emit(state.copyWith(
              isLoading: false,
              goodsProducts: goodsProductsA,
              goodscategory: event.category));
        }
      } catch (e) {
        emit(state.copyWith(isLoading: false));
        log(e.toString());
      }
    });

    on<Clearcategory>((event, emit) async {
      try {
        emit(state.copyWith(
            isLoading: false,
            serProducts: serProducts,
            sercategory: null,
            goodsProducts: goodsProducts,
            goodscategory: null));
      } catch (e) {
        log(e.toString());
      }
    });

    on<Search>((event, emit) async {
      try {
        emit(state.copyWith(isLoading: true));

        //   FROM [Restaurant].[dbo].[MainStock]
        //   WHERE [SERorGOODS] = '${event.from}'
        //     AND ([codeorSKU] LIKE '%${event.searchQuary}%' OR [pdtname] LIKE '%${event.searchQuary}%')
        // """;

        if (event.from == 'SER') {
          log('service');
          final List<Product> filteredStocks = serProducts.where((product) {
            // Check if the product name contains the search term (case-insensitive)
            return product.productName
                .toLowerCase()
                .contains(event.searchQuary.toLowerCase());
          }).toList();

          emit(state.copyWith(isLoading: false, serProducts: filteredStocks));
        } else if (event.from == 'GOODS') {
          log('goods');

          final List<Product> filteredStocks = goodsProducts.where((product) {
            // Check if the product name contains the search term (case-insensitive)
            return product.productName
                .toLowerCase()
                .contains(event.searchQuary.toLowerCase());
          }).toList();
          emit(state.copyWith(isLoading: false, goodsProducts: filteredStocks));
        }
        emit(state.copyWith(
          isLoading: false,
        ));
      } catch (e) {
        log(e.toString());
        emit(state.copyWith(isLoading: false));
      }
    });

    on<Add>((event, emit) async {
      try {
        if (event.from == 'SER') {
          log('FROM SER');
          List<Product> products = state.serProducts;
          if (products
              .any((existingItem) => existingItem.id == event.product.id)) {
            final index = products.indexWhere((i) => i.id == event.product.id);

            products[index].changedQty = products[index].changedQty + event.qty;
            log(products[index].changedQty.toString());

            emit(state.copyWith(serProducts: products));
          }
        } else if (event.from == 'GOODS') {
          log('FROM GOODS');

          List<Product> products = state.goodsProducts;
          if (products
              .any((existingItem) => existingItem.id == event.product.id)) {
            final index = products.indexWhere((i) => i.id == event.product.id);

            products[index].changedQty = products[index].changedQty + event.qty;
            log(products[index].changedQty.toString());
            emit(state.copyWith(goodsProducts: products));
          }
        }
      } catch (e) {
        log(e.toString());
      }
    });
  }
}
