part of 'stock_bloc.dart';

@freezed
class StockState with _$StockState {
  factory StockState({
    required String goodsOrSER,
    Category? selectedcategory,
    required List<kotItem> stocklist,
    required List<kotItem> seritems,
    required List<kotItem> goodsitems,
    required bool isLoading,
    required bool hasReachedMax,
    required List<kotItem> toKOTitems,
    required List<kotItem> cancelKOTitems,
    required List<Category> goodsCategory,
    required List<Category> serCategory,
    required List<Category> category,
  }) = _StockState;
  factory StockState.initial() {
    return StockState(
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

   