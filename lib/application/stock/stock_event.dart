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

      required Product product,
      required String from,
      required bool isIncrement}) = Add;
  // const factory StockEvent.delete({
  //   required Product product,
  //   required String from,
  // }) = Delete;

  const factory StockEvent.search({
    required String from,
    required String searchQuary,
  }) = Search;

  const factory StockEvent.categorySelection({
    required Category category,
    required String from,
  }) = CategorySelection;
}
