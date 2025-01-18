part of 'stock_bloc.dart';

@freezed
class StockState with _$StockState {
  factory StockState({
    required String goodsOrSER,
    String? selectedcategory,
    required List<kotItem> stocklist,
        required List<Product> allList,

    required List<kotItem> seritems,
    required List<kotItem> goodsitems,
    required bool isLoading,
    required bool hasReachedMax,
    required List<kotItem> toKOTitems,
    required List<kotItem> cancelKOTitems,
    required List<String> goodsCategory,
    required List<String> serCategory,
    required List<String> category,
  }) = _StockState;
  factory StockState.initial() {
    return StockState(allList: [],
        goodsOrSER: 'Service',
        category: [],
        stocklist: [],
        goodsitems: [],
        seritems: [],
        cancelKOTitems: [],
        selectedcategory: null,
        goodsCategory: [],
        serCategory: [],
        isLoading: false,
        toKOTitems: [],
        hasReachedMax: false);
  }
}
