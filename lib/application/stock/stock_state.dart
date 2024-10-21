part of 'stock_bloc.dart';

@freezed
class StockState with _$StockState {
  factory StockState({
    Category? goodscategory,
        Category? sercategory,

    required bool isLoading,
    required bool hasReachedMax,
    required List<Product> goodsProducts,
    required List<Product> serProducts,
        required List<Product> toKOTitems,

     required List<Category> goodsCategory,
    required List<Category> serCategory,
  }) = _StockState;
  factory StockState.initial() {
    return StockState(goodscategory: null,sercategory: null,
        goodsProducts: [],
        serProducts: [],goodsCategory: [],serCategory: [],
        isLoading: false,toKOTitems: [],
        hasReachedMax: false);
  }
}
