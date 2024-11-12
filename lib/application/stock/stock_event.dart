part of 'stock_bloc.dart';

@freezed
class StockEvent with _$StockEvent {
  const factory StockEvent.fetchStocksAndCategory() = FetchStocksAndCategory;
  // const factory StockEvent.fetchCategory() = FetchCategory;
  const factory StockEvent.clearcategory() = Clearcategory;
  const factory StockEvent.add(
      {required int qty,
      bool? update,
      String? amount,
          KitchenItem? item,

      required String productid,
      required bool isIncrement}) = Add;



  const factory StockEvent.listFromOrder({
    required List<KitchenItem> itemslist,
    required List<KitchenItem> cancelItemslist,
  }) = ListFromOrder;

  const factory StockEvent.clearSelection() = ClearSelection;

  const factory StockEvent.search({
    required String searchQuary,
  }) = Search;

  const factory StockEvent.itemInitalFetch(
  ) = ItemInitalFetch;

  const factory StockEvent.typeChange({
    required String type,
  }) = TypeChange;
    const factory StockEvent.itemAction({
    required String from,
   required KitchenItem item
  }) = ItemAction;

  const factory StockEvent.categoryFetch() = CategoryFetch;

  const factory StockEvent.categorySelection({
    required Category category,
  }) = CategorySelection;
}
