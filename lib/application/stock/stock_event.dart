part of 'stock_bloc.dart';

@freezed
class StockEvent with _$StockEvent {
  const factory StockEvent.fetchStocks() = FetchStocks;
  const factory StockEvent.fetchCategory() = FetchCategory;
  const factory StockEvent.clearcategory() = Clearcategory;
    const factory StockEvent.add({ required int qty,required Product product, required String from,}) = Add;
    const factory StockEvent.delete({required Product product, required String from,}) = Delete;

  const factory StockEvent.search({
    required String from, required String searchQuary,
  }) = Search;

  const factory StockEvent.categorySelection({
    required Category category,
    required String from,
  }) = CategorySelection;
}
