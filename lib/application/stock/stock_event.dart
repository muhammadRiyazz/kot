part of 'stock_bloc.dart';

@freezed
class StockEvent with _$StockEvent {
  const factory StockEvent.fetchStocksAndCategory() = FetchStocksAndCategory;
  // const factory StockEvent.fetchCategory() = FetchCategory;
  const factory StockEvent.clearcategory() = Clearcategory;
  const factory StockEvent.add(
      {required int qty,
      bool? update,
      double? amount,
          kotItem? item,

      required String productid,
      required bool isIncrement}) = Add;



  const factory StockEvent.listFromOrder({
    required List<kotItem> itemslist,
    required List<kotItem> cancelItemslist,
  }) = ListFromOrder;

  const factory StockEvent.clearSelection() = ClearSelection;

  const factory StockEvent.search({
    required String searchQuary,required  bool acOrNonAc
  }) = Search;

  const factory StockEvent.itemInitalFetch({required  bool acOrNonAc}
  ) = ItemInitalFetch;

  const factory StockEvent.typeChange({
    required String type,
  }) = TypeChange;
    const factory StockEvent.itemAction({
    required String from,
   required kotItem item
  }) = ItemAction;

  const factory StockEvent.categoryFetch() = CategoryFetch;

  const factory StockEvent.categorySelection({
    required String category,required  bool acOrNonAc
  }) = CategorySelection;
}
