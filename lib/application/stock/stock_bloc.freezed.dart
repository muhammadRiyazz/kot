// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StockEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchStocksAndCategory,
    required TResult Function() clearcategory,
    required TResult Function(int qty, bool? update, double? amount,
            kotItem? item, String productid, bool isIncrement)
        add,
    required TResult Function(
            List<kotItem> itemslist, List<kotItem> cancelItemslist)
        listFromOrder,
    required TResult Function() clearSelection,
    required TResult Function(String searchQuary, bool acOrNonAc) search,
    required TResult Function(bool acOrNonAc) itemInitalFetch,
    required TResult Function(String type) typeChange,
    required TResult Function(String from, kotItem item) itemAction,
    required TResult Function() categoryFetch,
    required TResult Function(String category, bool acOrNonAc)
        categorySelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchStocksAndCategory,
    TResult? Function()? clearcategory,
    TResult? Function(int qty, bool? update, double? amount, kotItem? item,
            String productid, bool isIncrement)?
        add,
    TResult? Function(List<kotItem> itemslist, List<kotItem> cancelItemslist)?
        listFromOrder,
    TResult? Function()? clearSelection,
    TResult? Function(String searchQuary, bool acOrNonAc)? search,
    TResult? Function(bool acOrNonAc)? itemInitalFetch,
    TResult? Function(String type)? typeChange,
    TResult? Function(String from, kotItem item)? itemAction,
    TResult? Function()? categoryFetch,
    TResult? Function(String category, bool acOrNonAc)? categorySelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchStocksAndCategory,
    TResult Function()? clearcategory,
    TResult Function(int qty, bool? update, double? amount, kotItem? item,
            String productid, bool isIncrement)?
        add,
    TResult Function(List<kotItem> itemslist, List<kotItem> cancelItemslist)?
        listFromOrder,
    TResult Function()? clearSelection,
    TResult Function(String searchQuary, bool acOrNonAc)? search,
    TResult Function(bool acOrNonAc)? itemInitalFetch,
    TResult Function(String type)? typeChange,
    TResult Function(String from, kotItem item)? itemAction,
    TResult Function()? categoryFetch,
    TResult Function(String category, bool acOrNonAc)? categorySelection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchStocksAndCategory value)
        fetchStocksAndCategory,
    required TResult Function(Clearcategory value) clearcategory,
    required TResult Function(Add value) add,
    required TResult Function(ListFromOrder value) listFromOrder,
    required TResult Function(ClearSelection value) clearSelection,
    required TResult Function(Search value) search,
    required TResult Function(ItemInitalFetch value) itemInitalFetch,
    required TResult Function(TypeChange value) typeChange,
    required TResult Function(ItemAction value) itemAction,
    required TResult Function(CategoryFetch value) categoryFetch,
    required TResult Function(CategorySelection value) categorySelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchStocksAndCategory value)? fetchStocksAndCategory,
    TResult? Function(Clearcategory value)? clearcategory,
    TResult? Function(Add value)? add,
    TResult? Function(ListFromOrder value)? listFromOrder,
    TResult? Function(ClearSelection value)? clearSelection,
    TResult? Function(Search value)? search,
    TResult? Function(ItemInitalFetch value)? itemInitalFetch,
    TResult? Function(TypeChange value)? typeChange,
    TResult? Function(ItemAction value)? itemAction,
    TResult? Function(CategoryFetch value)? categoryFetch,
    TResult? Function(CategorySelection value)? categorySelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchStocksAndCategory value)? fetchStocksAndCategory,
    TResult Function(Clearcategory value)? clearcategory,
    TResult Function(Add value)? add,
    TResult Function(ListFromOrder value)? listFromOrder,
    TResult Function(ClearSelection value)? clearSelection,
    TResult Function(Search value)? search,
    TResult Function(ItemInitalFetch value)? itemInitalFetch,
    TResult Function(TypeChange value)? typeChange,
    TResult Function(ItemAction value)? itemAction,
    TResult Function(CategoryFetch value)? categoryFetch,
    TResult Function(CategorySelection value)? categorySelection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockEventCopyWith<$Res> {
  factory $StockEventCopyWith(
          StockEvent value, $Res Function(StockEvent) then) =
      _$StockEventCopyWithImpl<$Res, StockEvent>;
}

/// @nodoc
class _$StockEventCopyWithImpl<$Res, $Val extends StockEvent>
    implements $StockEventCopyWith<$Res> {
  _$StockEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchStocksAndCategoryImplCopyWith<$Res> {
  factory _$$FetchStocksAndCategoryImplCopyWith(
          _$FetchStocksAndCategoryImpl value,
          $Res Function(_$FetchStocksAndCategoryImpl) then) =
      __$$FetchStocksAndCategoryImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchStocksAndCategoryImplCopyWithImpl<$Res>
    extends _$StockEventCopyWithImpl<$Res, _$FetchStocksAndCategoryImpl>
    implements _$$FetchStocksAndCategoryImplCopyWith<$Res> {
  __$$FetchStocksAndCategoryImplCopyWithImpl(
      _$FetchStocksAndCategoryImpl _value,
      $Res Function(_$FetchStocksAndCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchStocksAndCategoryImpl implements FetchStocksAndCategory {
  const _$FetchStocksAndCategoryImpl();

  @override
  String toString() {
    return 'StockEvent.fetchStocksAndCategory()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchStocksAndCategoryImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchStocksAndCategory,
    required TResult Function() clearcategory,
    required TResult Function(int qty, bool? update, double? amount,
            kotItem? item, String productid, bool isIncrement)
        add,
    required TResult Function(
            List<kotItem> itemslist, List<kotItem> cancelItemslist)
        listFromOrder,
    required TResult Function() clearSelection,
    required TResult Function(String searchQuary, bool acOrNonAc) search,
    required TResult Function(bool acOrNonAc) itemInitalFetch,
    required TResult Function(String type) typeChange,
    required TResult Function(String from, kotItem item) itemAction,
    required TResult Function() categoryFetch,
    required TResult Function(String category, bool acOrNonAc)
        categorySelection,
  }) {
    return fetchStocksAndCategory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchStocksAndCategory,
    TResult? Function()? clearcategory,
    TResult? Function(int qty, bool? update, double? amount, kotItem? item,
            String productid, bool isIncrement)?
        add,
    TResult? Function(List<kotItem> itemslist, List<kotItem> cancelItemslist)?
        listFromOrder,
    TResult? Function()? clearSelection,
    TResult? Function(String searchQuary, bool acOrNonAc)? search,
    TResult? Function(bool acOrNonAc)? itemInitalFetch,
    TResult? Function(String type)? typeChange,
    TResult? Function(String from, kotItem item)? itemAction,
    TResult? Function()? categoryFetch,
    TResult? Function(String category, bool acOrNonAc)? categorySelection,
  }) {
    return fetchStocksAndCategory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchStocksAndCategory,
    TResult Function()? clearcategory,
    TResult Function(int qty, bool? update, double? amount, kotItem? item,
            String productid, bool isIncrement)?
        add,
    TResult Function(List<kotItem> itemslist, List<kotItem> cancelItemslist)?
        listFromOrder,
    TResult Function()? clearSelection,
    TResult Function(String searchQuary, bool acOrNonAc)? search,
    TResult Function(bool acOrNonAc)? itemInitalFetch,
    TResult Function(String type)? typeChange,
    TResult Function(String from, kotItem item)? itemAction,
    TResult Function()? categoryFetch,
    TResult Function(String category, bool acOrNonAc)? categorySelection,
    required TResult orElse(),
  }) {
    if (fetchStocksAndCategory != null) {
      return fetchStocksAndCategory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchStocksAndCategory value)
        fetchStocksAndCategory,
    required TResult Function(Clearcategory value) clearcategory,
    required TResult Function(Add value) add,
    required TResult Function(ListFromOrder value) listFromOrder,
    required TResult Function(ClearSelection value) clearSelection,
    required TResult Function(Search value) search,
    required TResult Function(ItemInitalFetch value) itemInitalFetch,
    required TResult Function(TypeChange value) typeChange,
    required TResult Function(ItemAction value) itemAction,
    required TResult Function(CategoryFetch value) categoryFetch,
    required TResult Function(CategorySelection value) categorySelection,
  }) {
    return fetchStocksAndCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchStocksAndCategory value)? fetchStocksAndCategory,
    TResult? Function(Clearcategory value)? clearcategory,
    TResult? Function(Add value)? add,
    TResult? Function(ListFromOrder value)? listFromOrder,
    TResult? Function(ClearSelection value)? clearSelection,
    TResult? Function(Search value)? search,
    TResult? Function(ItemInitalFetch value)? itemInitalFetch,
    TResult? Function(TypeChange value)? typeChange,
    TResult? Function(ItemAction value)? itemAction,
    TResult? Function(CategoryFetch value)? categoryFetch,
    TResult? Function(CategorySelection value)? categorySelection,
  }) {
    return fetchStocksAndCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchStocksAndCategory value)? fetchStocksAndCategory,
    TResult Function(Clearcategory value)? clearcategory,
    TResult Function(Add value)? add,
    TResult Function(ListFromOrder value)? listFromOrder,
    TResult Function(ClearSelection value)? clearSelection,
    TResult Function(Search value)? search,
    TResult Function(ItemInitalFetch value)? itemInitalFetch,
    TResult Function(TypeChange value)? typeChange,
    TResult Function(ItemAction value)? itemAction,
    TResult Function(CategoryFetch value)? categoryFetch,
    TResult Function(CategorySelection value)? categorySelection,
    required TResult orElse(),
  }) {
    if (fetchStocksAndCategory != null) {
      return fetchStocksAndCategory(this);
    }
    return orElse();
  }
}

abstract class FetchStocksAndCategory implements StockEvent {
  const factory FetchStocksAndCategory() = _$FetchStocksAndCategoryImpl;
}

/// @nodoc
abstract class _$$ClearcategoryImplCopyWith<$Res> {
  factory _$$ClearcategoryImplCopyWith(
          _$ClearcategoryImpl value, $Res Function(_$ClearcategoryImpl) then) =
      __$$ClearcategoryImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearcategoryImplCopyWithImpl<$Res>
    extends _$StockEventCopyWithImpl<$Res, _$ClearcategoryImpl>
    implements _$$ClearcategoryImplCopyWith<$Res> {
  __$$ClearcategoryImplCopyWithImpl(
      _$ClearcategoryImpl _value, $Res Function(_$ClearcategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearcategoryImpl implements Clearcategory {
  const _$ClearcategoryImpl();

  @override
  String toString() {
    return 'StockEvent.clearcategory()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearcategoryImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchStocksAndCategory,
    required TResult Function() clearcategory,
    required TResult Function(int qty, bool? update, double? amount,
            kotItem? item, String productid, bool isIncrement)
        add,
    required TResult Function(
            List<kotItem> itemslist, List<kotItem> cancelItemslist)
        listFromOrder,
    required TResult Function() clearSelection,
    required TResult Function(String searchQuary, bool acOrNonAc) search,
    required TResult Function(bool acOrNonAc) itemInitalFetch,
    required TResult Function(String type) typeChange,
    required TResult Function(String from, kotItem item) itemAction,
    required TResult Function() categoryFetch,
    required TResult Function(String category, bool acOrNonAc)
        categorySelection,
  }) {
    return clearcategory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchStocksAndCategory,
    TResult? Function()? clearcategory,
    TResult? Function(int qty, bool? update, double? amount, kotItem? item,
            String productid, bool isIncrement)?
        add,
    TResult? Function(List<kotItem> itemslist, List<kotItem> cancelItemslist)?
        listFromOrder,
    TResult? Function()? clearSelection,
    TResult? Function(String searchQuary, bool acOrNonAc)? search,
    TResult? Function(bool acOrNonAc)? itemInitalFetch,
    TResult? Function(String type)? typeChange,
    TResult? Function(String from, kotItem item)? itemAction,
    TResult? Function()? categoryFetch,
    TResult? Function(String category, bool acOrNonAc)? categorySelection,
  }) {
    return clearcategory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchStocksAndCategory,
    TResult Function()? clearcategory,
    TResult Function(int qty, bool? update, double? amount, kotItem? item,
            String productid, bool isIncrement)?
        add,
    TResult Function(List<kotItem> itemslist, List<kotItem> cancelItemslist)?
        listFromOrder,
    TResult Function()? clearSelection,
    TResult Function(String searchQuary, bool acOrNonAc)? search,
    TResult Function(bool acOrNonAc)? itemInitalFetch,
    TResult Function(String type)? typeChange,
    TResult Function(String from, kotItem item)? itemAction,
    TResult Function()? categoryFetch,
    TResult Function(String category, bool acOrNonAc)? categorySelection,
    required TResult orElse(),
  }) {
    if (clearcategory != null) {
      return clearcategory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchStocksAndCategory value)
        fetchStocksAndCategory,
    required TResult Function(Clearcategory value) clearcategory,
    required TResult Function(Add value) add,
    required TResult Function(ListFromOrder value) listFromOrder,
    required TResult Function(ClearSelection value) clearSelection,
    required TResult Function(Search value) search,
    required TResult Function(ItemInitalFetch value) itemInitalFetch,
    required TResult Function(TypeChange value) typeChange,
    required TResult Function(ItemAction value) itemAction,
    required TResult Function(CategoryFetch value) categoryFetch,
    required TResult Function(CategorySelection value) categorySelection,
  }) {
    return clearcategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchStocksAndCategory value)? fetchStocksAndCategory,
    TResult? Function(Clearcategory value)? clearcategory,
    TResult? Function(Add value)? add,
    TResult? Function(ListFromOrder value)? listFromOrder,
    TResult? Function(ClearSelection value)? clearSelection,
    TResult? Function(Search value)? search,
    TResult? Function(ItemInitalFetch value)? itemInitalFetch,
    TResult? Function(TypeChange value)? typeChange,
    TResult? Function(ItemAction value)? itemAction,
    TResult? Function(CategoryFetch value)? categoryFetch,
    TResult? Function(CategorySelection value)? categorySelection,
  }) {
    return clearcategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchStocksAndCategory value)? fetchStocksAndCategory,
    TResult Function(Clearcategory value)? clearcategory,
    TResult Function(Add value)? add,
    TResult Function(ListFromOrder value)? listFromOrder,
    TResult Function(ClearSelection value)? clearSelection,
    TResult Function(Search value)? search,
    TResult Function(ItemInitalFetch value)? itemInitalFetch,
    TResult Function(TypeChange value)? typeChange,
    TResult Function(ItemAction value)? itemAction,
    TResult Function(CategoryFetch value)? categoryFetch,
    TResult Function(CategorySelection value)? categorySelection,
    required TResult orElse(),
  }) {
    if (clearcategory != null) {
      return clearcategory(this);
    }
    return orElse();
  }
}

abstract class Clearcategory implements StockEvent {
  const factory Clearcategory() = _$ClearcategoryImpl;
}

/// @nodoc
abstract class _$$AddImplCopyWith<$Res> {
  factory _$$AddImplCopyWith(_$AddImpl value, $Res Function(_$AddImpl) then) =
      __$$AddImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int qty,
      bool? update,
      double? amount,
      kotItem? item,
      String productid,
      bool isIncrement});
}

/// @nodoc
class __$$AddImplCopyWithImpl<$Res>
    extends _$StockEventCopyWithImpl<$Res, _$AddImpl>
    implements _$$AddImplCopyWith<$Res> {
  __$$AddImplCopyWithImpl(_$AddImpl _value, $Res Function(_$AddImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qty = null,
    Object? update = freezed,
    Object? amount = freezed,
    Object? item = freezed,
    Object? productid = null,
    Object? isIncrement = null,
  }) {
    return _then(_$AddImpl(
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      update: freezed == update
          ? _value.update
          : update // ignore: cast_nullable_to_non_nullable
              as bool?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as kotItem?,
      productid: null == productid
          ? _value.productid
          : productid // ignore: cast_nullable_to_non_nullable
              as String,
      isIncrement: null == isIncrement
          ? _value.isIncrement
          : isIncrement // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AddImpl implements Add {
  const _$AddImpl(
      {required this.qty,
      this.update,
      this.amount,
      this.item,
      required this.productid,
      required this.isIncrement});

  @override
  final int qty;
  @override
  final bool? update;
  @override
  final double? amount;
  @override
  final kotItem? item;
  @override
  final String productid;
  @override
  final bool isIncrement;

  @override
  String toString() {
    return 'StockEvent.add(qty: $qty, update: $update, amount: $amount, item: $item, productid: $productid, isIncrement: $isIncrement)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddImpl &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.update, update) || other.update == update) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.productid, productid) ||
                other.productid == productid) &&
            (identical(other.isIncrement, isIncrement) ||
                other.isIncrement == isIncrement));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, qty, update, amount, item, productid, isIncrement);

  /// Create a copy of StockEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddImplCopyWith<_$AddImpl> get copyWith =>
      __$$AddImplCopyWithImpl<_$AddImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchStocksAndCategory,
    required TResult Function() clearcategory,
    required TResult Function(int qty, bool? update, double? amount,
            kotItem? item, String productid, bool isIncrement)
        add,
    required TResult Function(
            List<kotItem> itemslist, List<kotItem> cancelItemslist)
        listFromOrder,
    required TResult Function() clearSelection,
    required TResult Function(String searchQuary, bool acOrNonAc) search,
    required TResult Function(bool acOrNonAc) itemInitalFetch,
    required TResult Function(String type) typeChange,
    required TResult Function(String from, kotItem item) itemAction,
    required TResult Function() categoryFetch,
    required TResult Function(String category, bool acOrNonAc)
        categorySelection,
  }) {
    return add(qty, update, amount, item, productid, isIncrement);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchStocksAndCategory,
    TResult? Function()? clearcategory,
    TResult? Function(int qty, bool? update, double? amount, kotItem? item,
            String productid, bool isIncrement)?
        add,
    TResult? Function(List<kotItem> itemslist, List<kotItem> cancelItemslist)?
        listFromOrder,
    TResult? Function()? clearSelection,
    TResult? Function(String searchQuary, bool acOrNonAc)? search,
    TResult? Function(bool acOrNonAc)? itemInitalFetch,
    TResult? Function(String type)? typeChange,
    TResult? Function(String from, kotItem item)? itemAction,
    TResult? Function()? categoryFetch,
    TResult? Function(String category, bool acOrNonAc)? categorySelection,
  }) {
    return add?.call(qty, update, amount, item, productid, isIncrement);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchStocksAndCategory,
    TResult Function()? clearcategory,
    TResult Function(int qty, bool? update, double? amount, kotItem? item,
            String productid, bool isIncrement)?
        add,
    TResult Function(List<kotItem> itemslist, List<kotItem> cancelItemslist)?
        listFromOrder,
    TResult Function()? clearSelection,
    TResult Function(String searchQuary, bool acOrNonAc)? search,
    TResult Function(bool acOrNonAc)? itemInitalFetch,
    TResult Function(String type)? typeChange,
    TResult Function(String from, kotItem item)? itemAction,
    TResult Function()? categoryFetch,
    TResult Function(String category, bool acOrNonAc)? categorySelection,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(qty, update, amount, item, productid, isIncrement);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchStocksAndCategory value)
        fetchStocksAndCategory,
    required TResult Function(Clearcategory value) clearcategory,
    required TResult Function(Add value) add,
    required TResult Function(ListFromOrder value) listFromOrder,
    required TResult Function(ClearSelection value) clearSelection,
    required TResult Function(Search value) search,
    required TResult Function(ItemInitalFetch value) itemInitalFetch,
    required TResult Function(TypeChange value) typeChange,
    required TResult Function(ItemAction value) itemAction,
    required TResult Function(CategoryFetch value) categoryFetch,
    required TResult Function(CategorySelection value) categorySelection,
  }) {
    return add(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchStocksAndCategory value)? fetchStocksAndCategory,
    TResult? Function(Clearcategory value)? clearcategory,
    TResult? Function(Add value)? add,
    TResult? Function(ListFromOrder value)? listFromOrder,
    TResult? Function(ClearSelection value)? clearSelection,
    TResult? Function(Search value)? search,
    TResult? Function(ItemInitalFetch value)? itemInitalFetch,
    TResult? Function(TypeChange value)? typeChange,
    TResult? Function(ItemAction value)? itemAction,
    TResult? Function(CategoryFetch value)? categoryFetch,
    TResult? Function(CategorySelection value)? categorySelection,
  }) {
    return add?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchStocksAndCategory value)? fetchStocksAndCategory,
    TResult Function(Clearcategory value)? clearcategory,
    TResult Function(Add value)? add,
    TResult Function(ListFromOrder value)? listFromOrder,
    TResult Function(ClearSelection value)? clearSelection,
    TResult Function(Search value)? search,
    TResult Function(ItemInitalFetch value)? itemInitalFetch,
    TResult Function(TypeChange value)? typeChange,
    TResult Function(ItemAction value)? itemAction,
    TResult Function(CategoryFetch value)? categoryFetch,
    TResult Function(CategorySelection value)? categorySelection,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class Add implements StockEvent {
  const factory Add(
      {required final int qty,
      final bool? update,
      final double? amount,
      final kotItem? item,
      required final String productid,
      required final bool isIncrement}) = _$AddImpl;

  int get qty;
  bool? get update;
  double? get amount;
  kotItem? get item;
  String get productid;
  bool get isIncrement;

  /// Create a copy of StockEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddImplCopyWith<_$AddImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ListFromOrderImplCopyWith<$Res> {
  factory _$$ListFromOrderImplCopyWith(
          _$ListFromOrderImpl value, $Res Function(_$ListFromOrderImpl) then) =
      __$$ListFromOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<kotItem> itemslist, List<kotItem> cancelItemslist});
}

/// @nodoc
class __$$ListFromOrderImplCopyWithImpl<$Res>
    extends _$StockEventCopyWithImpl<$Res, _$ListFromOrderImpl>
    implements _$$ListFromOrderImplCopyWith<$Res> {
  __$$ListFromOrderImplCopyWithImpl(
      _$ListFromOrderImpl _value, $Res Function(_$ListFromOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemslist = null,
    Object? cancelItemslist = null,
  }) {
    return _then(_$ListFromOrderImpl(
      itemslist: null == itemslist
          ? _value._itemslist
          : itemslist // ignore: cast_nullable_to_non_nullable
              as List<kotItem>,
      cancelItemslist: null == cancelItemslist
          ? _value._cancelItemslist
          : cancelItemslist // ignore: cast_nullable_to_non_nullable
              as List<kotItem>,
    ));
  }
}

/// @nodoc

class _$ListFromOrderImpl implements ListFromOrder {
  const _$ListFromOrderImpl(
      {required final List<kotItem> itemslist,
      required final List<kotItem> cancelItemslist})
      : _itemslist = itemslist,
        _cancelItemslist = cancelItemslist;

  final List<kotItem> _itemslist;
  @override
  List<kotItem> get itemslist {
    if (_itemslist is EqualUnmodifiableListView) return _itemslist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itemslist);
  }

  final List<kotItem> _cancelItemslist;
  @override
  List<kotItem> get cancelItemslist {
    if (_cancelItemslist is EqualUnmodifiableListView) return _cancelItemslist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cancelItemslist);
  }

  @override
  String toString() {
    return 'StockEvent.listFromOrder(itemslist: $itemslist, cancelItemslist: $cancelItemslist)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListFromOrderImpl &&
            const DeepCollectionEquality()
                .equals(other._itemslist, _itemslist) &&
            const DeepCollectionEquality()
                .equals(other._cancelItemslist, _cancelItemslist));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_itemslist),
      const DeepCollectionEquality().hash(_cancelItemslist));

  /// Create a copy of StockEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListFromOrderImplCopyWith<_$ListFromOrderImpl> get copyWith =>
      __$$ListFromOrderImplCopyWithImpl<_$ListFromOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchStocksAndCategory,
    required TResult Function() clearcategory,
    required TResult Function(int qty, bool? update, double? amount,
            kotItem? item, String productid, bool isIncrement)
        add,
    required TResult Function(
            List<kotItem> itemslist, List<kotItem> cancelItemslist)
        listFromOrder,
    required TResult Function() clearSelection,
    required TResult Function(String searchQuary, bool acOrNonAc) search,
    required TResult Function(bool acOrNonAc) itemInitalFetch,
    required TResult Function(String type) typeChange,
    required TResult Function(String from, kotItem item) itemAction,
    required TResult Function() categoryFetch,
    required TResult Function(String category, bool acOrNonAc)
        categorySelection,
  }) {
    return listFromOrder(itemslist, cancelItemslist);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchStocksAndCategory,
    TResult? Function()? clearcategory,
    TResult? Function(int qty, bool? update, double? amount, kotItem? item,
            String productid, bool isIncrement)?
        add,
    TResult? Function(List<kotItem> itemslist, List<kotItem> cancelItemslist)?
        listFromOrder,
    TResult? Function()? clearSelection,
    TResult? Function(String searchQuary, bool acOrNonAc)? search,
    TResult? Function(bool acOrNonAc)? itemInitalFetch,
    TResult? Function(String type)? typeChange,
    TResult? Function(String from, kotItem item)? itemAction,
    TResult? Function()? categoryFetch,
    TResult? Function(String category, bool acOrNonAc)? categorySelection,
  }) {
    return listFromOrder?.call(itemslist, cancelItemslist);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchStocksAndCategory,
    TResult Function()? clearcategory,
    TResult Function(int qty, bool? update, double? amount, kotItem? item,
            String productid, bool isIncrement)?
        add,
    TResult Function(List<kotItem> itemslist, List<kotItem> cancelItemslist)?
        listFromOrder,
    TResult Function()? clearSelection,
    TResult Function(String searchQuary, bool acOrNonAc)? search,
    TResult Function(bool acOrNonAc)? itemInitalFetch,
    TResult Function(String type)? typeChange,
    TResult Function(String from, kotItem item)? itemAction,
    TResult Function()? categoryFetch,
    TResult Function(String category, bool acOrNonAc)? categorySelection,
    required TResult orElse(),
  }) {
    if (listFromOrder != null) {
      return listFromOrder(itemslist, cancelItemslist);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchStocksAndCategory value)
        fetchStocksAndCategory,
    required TResult Function(Clearcategory value) clearcategory,
    required TResult Function(Add value) add,
    required TResult Function(ListFromOrder value) listFromOrder,
    required TResult Function(ClearSelection value) clearSelection,
    required TResult Function(Search value) search,
    required TResult Function(ItemInitalFetch value) itemInitalFetch,
    required TResult Function(TypeChange value) typeChange,
    required TResult Function(ItemAction value) itemAction,
    required TResult Function(CategoryFetch value) categoryFetch,
    required TResult Function(CategorySelection value) categorySelection,
  }) {
    return listFromOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchStocksAndCategory value)? fetchStocksAndCategory,
    TResult? Function(Clearcategory value)? clearcategory,
    TResult? Function(Add value)? add,
    TResult? Function(ListFromOrder value)? listFromOrder,
    TResult? Function(ClearSelection value)? clearSelection,
    TResult? Function(Search value)? search,
    TResult? Function(ItemInitalFetch value)? itemInitalFetch,
    TResult? Function(TypeChange value)? typeChange,
    TResult? Function(ItemAction value)? itemAction,
    TResult? Function(CategoryFetch value)? categoryFetch,
    TResult? Function(CategorySelection value)? categorySelection,
  }) {
    return listFromOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchStocksAndCategory value)? fetchStocksAndCategory,
    TResult Function(Clearcategory value)? clearcategory,
    TResult Function(Add value)? add,
    TResult Function(ListFromOrder value)? listFromOrder,
    TResult Function(ClearSelection value)? clearSelection,
    TResult Function(Search value)? search,
    TResult Function(ItemInitalFetch value)? itemInitalFetch,
    TResult Function(TypeChange value)? typeChange,
    TResult Function(ItemAction value)? itemAction,
    TResult Function(CategoryFetch value)? categoryFetch,
    TResult Function(CategorySelection value)? categorySelection,
    required TResult orElse(),
  }) {
    if (listFromOrder != null) {
      return listFromOrder(this);
    }
    return orElse();
  }
}

abstract class ListFromOrder implements StockEvent {
  const factory ListFromOrder(
      {required final List<kotItem> itemslist,
      required final List<kotItem> cancelItemslist}) = _$ListFromOrderImpl;

  List<kotItem> get itemslist;
  List<kotItem> get cancelItemslist;

  /// Create a copy of StockEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListFromOrderImplCopyWith<_$ListFromOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearSelectionImplCopyWith<$Res> {
  factory _$$ClearSelectionImplCopyWith(_$ClearSelectionImpl value,
          $Res Function(_$ClearSelectionImpl) then) =
      __$$ClearSelectionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearSelectionImplCopyWithImpl<$Res>
    extends _$StockEventCopyWithImpl<$Res, _$ClearSelectionImpl>
    implements _$$ClearSelectionImplCopyWith<$Res> {
  __$$ClearSelectionImplCopyWithImpl(
      _$ClearSelectionImpl _value, $Res Function(_$ClearSelectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearSelectionImpl implements ClearSelection {
  const _$ClearSelectionImpl();

  @override
  String toString() {
    return 'StockEvent.clearSelection()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearSelectionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchStocksAndCategory,
    required TResult Function() clearcategory,
    required TResult Function(int qty, bool? update, double? amount,
            kotItem? item, String productid, bool isIncrement)
        add,
    required TResult Function(
            List<kotItem> itemslist, List<kotItem> cancelItemslist)
        listFromOrder,
    required TResult Function() clearSelection,
    required TResult Function(String searchQuary, bool acOrNonAc) search,
    required TResult Function(bool acOrNonAc) itemInitalFetch,
    required TResult Function(String type) typeChange,
    required TResult Function(String from, kotItem item) itemAction,
    required TResult Function() categoryFetch,
    required TResult Function(String category, bool acOrNonAc)
        categorySelection,
  }) {
    return clearSelection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchStocksAndCategory,
    TResult? Function()? clearcategory,
    TResult? Function(int qty, bool? update, double? amount, kotItem? item,
            String productid, bool isIncrement)?
        add,
    TResult? Function(List<kotItem> itemslist, List<kotItem> cancelItemslist)?
        listFromOrder,
    TResult? Function()? clearSelection,
    TResult? Function(String searchQuary, bool acOrNonAc)? search,
    TResult? Function(bool acOrNonAc)? itemInitalFetch,
    TResult? Function(String type)? typeChange,
    TResult? Function(String from, kotItem item)? itemAction,
    TResult? Function()? categoryFetch,
    TResult? Function(String category, bool acOrNonAc)? categorySelection,
  }) {
    return clearSelection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchStocksAndCategory,
    TResult Function()? clearcategory,
    TResult Function(int qty, bool? update, double? amount, kotItem? item,
            String productid, bool isIncrement)?
        add,
    TResult Function(List<kotItem> itemslist, List<kotItem> cancelItemslist)?
        listFromOrder,
    TResult Function()? clearSelection,
    TResult Function(String searchQuary, bool acOrNonAc)? search,
    TResult Function(bool acOrNonAc)? itemInitalFetch,
    TResult Function(String type)? typeChange,
    TResult Function(String from, kotItem item)? itemAction,
    TResult Function()? categoryFetch,
    TResult Function(String category, bool acOrNonAc)? categorySelection,
    required TResult orElse(),
  }) {
    if (clearSelection != null) {
      return clearSelection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchStocksAndCategory value)
        fetchStocksAndCategory,
    required TResult Function(Clearcategory value) clearcategory,
    required TResult Function(Add value) add,
    required TResult Function(ListFromOrder value) listFromOrder,
    required TResult Function(ClearSelection value) clearSelection,
    required TResult Function(Search value) search,
    required TResult Function(ItemInitalFetch value) itemInitalFetch,
    required TResult Function(TypeChange value) typeChange,
    required TResult Function(ItemAction value) itemAction,
    required TResult Function(CategoryFetch value) categoryFetch,
    required TResult Function(CategorySelection value) categorySelection,
  }) {
    return clearSelection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchStocksAndCategory value)? fetchStocksAndCategory,
    TResult? Function(Clearcategory value)? clearcategory,
    TResult? Function(Add value)? add,
    TResult? Function(ListFromOrder value)? listFromOrder,
    TResult? Function(ClearSelection value)? clearSelection,
    TResult? Function(Search value)? search,
    TResult? Function(ItemInitalFetch value)? itemInitalFetch,
    TResult? Function(TypeChange value)? typeChange,
    TResult? Function(ItemAction value)? itemAction,
    TResult? Function(CategoryFetch value)? categoryFetch,
    TResult? Function(CategorySelection value)? categorySelection,
  }) {
    return clearSelection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchStocksAndCategory value)? fetchStocksAndCategory,
    TResult Function(Clearcategory value)? clearcategory,
    TResult Function(Add value)? add,
    TResult Function(ListFromOrder value)? listFromOrder,
    TResult Function(ClearSelection value)? clearSelection,
    TResult Function(Search value)? search,
    TResult Function(ItemInitalFetch value)? itemInitalFetch,
    TResult Function(TypeChange value)? typeChange,
    TResult Function(ItemAction value)? itemAction,
    TResult Function(CategoryFetch value)? categoryFetch,
    TResult Function(CategorySelection value)? categorySelection,
    required TResult orElse(),
  }) {
    if (clearSelection != null) {
      return clearSelection(this);
    }
    return orElse();
  }
}

abstract class ClearSelection implements StockEvent {
  const factory ClearSelection() = _$ClearSelectionImpl;
}

/// @nodoc
abstract class _$$SearchImplCopyWith<$Res> {
  factory _$$SearchImplCopyWith(
          _$SearchImpl value, $Res Function(_$SearchImpl) then) =
      __$$SearchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String searchQuary, bool acOrNonAc});
}

/// @nodoc
class __$$SearchImplCopyWithImpl<$Res>
    extends _$StockEventCopyWithImpl<$Res, _$SearchImpl>
    implements _$$SearchImplCopyWith<$Res> {
  __$$SearchImplCopyWithImpl(
      _$SearchImpl _value, $Res Function(_$SearchImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuary = null,
    Object? acOrNonAc = null,
  }) {
    return _then(_$SearchImpl(
      searchQuary: null == searchQuary
          ? _value.searchQuary
          : searchQuary // ignore: cast_nullable_to_non_nullable
              as String,
      acOrNonAc: null == acOrNonAc
          ? _value.acOrNonAc
          : acOrNonAc // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SearchImpl implements Search {
  const _$SearchImpl({required this.searchQuary, required this.acOrNonAc});

  @override
  final String searchQuary;
  @override
  final bool acOrNonAc;

  @override
  String toString() {
    return 'StockEvent.search(searchQuary: $searchQuary, acOrNonAc: $acOrNonAc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchImpl &&
            (identical(other.searchQuary, searchQuary) ||
                other.searchQuary == searchQuary) &&
            (identical(other.acOrNonAc, acOrNonAc) ||
                other.acOrNonAc == acOrNonAc));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchQuary, acOrNonAc);

  /// Create a copy of StockEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      __$$SearchImplCopyWithImpl<_$SearchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchStocksAndCategory,
    required TResult Function() clearcategory,
    required TResult Function(int qty, bool? update, double? amount,
            kotItem? item, String productid, bool isIncrement)
        add,
    required TResult Function(
            List<kotItem> itemslist, List<kotItem> cancelItemslist)
        listFromOrder,
    required TResult Function() clearSelection,
    required TResult Function(String searchQuary, bool acOrNonAc) search,
    required TResult Function(bool acOrNonAc) itemInitalFetch,
    required TResult Function(String type) typeChange,
    required TResult Function(String from, kotItem item) itemAction,
    required TResult Function() categoryFetch,
    required TResult Function(String category, bool acOrNonAc)
        categorySelection,
  }) {
    return search(searchQuary, acOrNonAc);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchStocksAndCategory,
    TResult? Function()? clearcategory,
    TResult? Function(int qty, bool? update, double? amount, kotItem? item,
            String productid, bool isIncrement)?
        add,
    TResult? Function(List<kotItem> itemslist, List<kotItem> cancelItemslist)?
        listFromOrder,
    TResult? Function()? clearSelection,
    TResult? Function(String searchQuary, bool acOrNonAc)? search,
    TResult? Function(bool acOrNonAc)? itemInitalFetch,
    TResult? Function(String type)? typeChange,
    TResult? Function(String from, kotItem item)? itemAction,
    TResult? Function()? categoryFetch,
    TResult? Function(String category, bool acOrNonAc)? categorySelection,
  }) {
    return search?.call(searchQuary, acOrNonAc);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchStocksAndCategory,
    TResult Function()? clearcategory,
    TResult Function(int qty, bool? update, double? amount, kotItem? item,
            String productid, bool isIncrement)?
        add,
    TResult Function(List<kotItem> itemslist, List<kotItem> cancelItemslist)?
        listFromOrder,
    TResult Function()? clearSelection,
    TResult Function(String searchQuary, bool acOrNonAc)? search,
    TResult Function(bool acOrNonAc)? itemInitalFetch,
    TResult Function(String type)? typeChange,
    TResult Function(String from, kotItem item)? itemAction,
    TResult Function()? categoryFetch,
    TResult Function(String category, bool acOrNonAc)? categorySelection,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(searchQuary, acOrNonAc);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchStocksAndCategory value)
        fetchStocksAndCategory,
    required TResult Function(Clearcategory value) clearcategory,
    required TResult Function(Add value) add,
    required TResult Function(ListFromOrder value) listFromOrder,
    required TResult Function(ClearSelection value) clearSelection,
    required TResult Function(Search value) search,
    required TResult Function(ItemInitalFetch value) itemInitalFetch,
    required TResult Function(TypeChange value) typeChange,
    required TResult Function(ItemAction value) itemAction,
    required TResult Function(CategoryFetch value) categoryFetch,
    required TResult Function(CategorySelection value) categorySelection,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchStocksAndCategory value)? fetchStocksAndCategory,
    TResult? Function(Clearcategory value)? clearcategory,
    TResult? Function(Add value)? add,
    TResult? Function(ListFromOrder value)? listFromOrder,
    TResult? Function(ClearSelection value)? clearSelection,
    TResult? Function(Search value)? search,
    TResult? Function(ItemInitalFetch value)? itemInitalFetch,
    TResult? Function(TypeChange value)? typeChange,
    TResult? Function(ItemAction value)? itemAction,
    TResult? Function(CategoryFetch value)? categoryFetch,
    TResult? Function(CategorySelection value)? categorySelection,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchStocksAndCategory value)? fetchStocksAndCategory,
    TResult Function(Clearcategory value)? clearcategory,
    TResult Function(Add value)? add,
    TResult Function(ListFromOrder value)? listFromOrder,
    TResult Function(ClearSelection value)? clearSelection,
    TResult Function(Search value)? search,
    TResult Function(ItemInitalFetch value)? itemInitalFetch,
    TResult Function(TypeChange value)? typeChange,
    TResult Function(ItemAction value)? itemAction,
    TResult Function(CategoryFetch value)? categoryFetch,
    TResult Function(CategorySelection value)? categorySelection,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class Search implements StockEvent {
  const factory Search(
      {required final String searchQuary,
      required final bool acOrNonAc}) = _$SearchImpl;

  String get searchQuary;
  bool get acOrNonAc;

  /// Create a copy of StockEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ItemInitalFetchImplCopyWith<$Res> {
  factory _$$ItemInitalFetchImplCopyWith(_$ItemInitalFetchImpl value,
          $Res Function(_$ItemInitalFetchImpl) then) =
      __$$ItemInitalFetchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool acOrNonAc});
}

/// @nodoc
class __$$ItemInitalFetchImplCopyWithImpl<$Res>
    extends _$StockEventCopyWithImpl<$Res, _$ItemInitalFetchImpl>
    implements _$$ItemInitalFetchImplCopyWith<$Res> {
  __$$ItemInitalFetchImplCopyWithImpl(
      _$ItemInitalFetchImpl _value, $Res Function(_$ItemInitalFetchImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acOrNonAc = null,
  }) {
    return _then(_$ItemInitalFetchImpl(
      acOrNonAc: null == acOrNonAc
          ? _value.acOrNonAc
          : acOrNonAc // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ItemInitalFetchImpl implements ItemInitalFetch {
  const _$ItemInitalFetchImpl({required this.acOrNonAc});

  @override
  final bool acOrNonAc;

  @override
  String toString() {
    return 'StockEvent.itemInitalFetch(acOrNonAc: $acOrNonAc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemInitalFetchImpl &&
            (identical(other.acOrNonAc, acOrNonAc) ||
                other.acOrNonAc == acOrNonAc));
  }

  @override
  int get hashCode => Object.hash(runtimeType, acOrNonAc);

  /// Create a copy of StockEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemInitalFetchImplCopyWith<_$ItemInitalFetchImpl> get copyWith =>
      __$$ItemInitalFetchImplCopyWithImpl<_$ItemInitalFetchImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchStocksAndCategory,
    required TResult Function() clearcategory,
    required TResult Function(int qty, bool? update, double? amount,
            kotItem? item, String productid, bool isIncrement)
        add,
    required TResult Function(
            List<kotItem> itemslist, List<kotItem> cancelItemslist)
        listFromOrder,
    required TResult Function() clearSelection,
    required TResult Function(String searchQuary, bool acOrNonAc) search,
    required TResult Function(bool acOrNonAc) itemInitalFetch,
    required TResult Function(String type) typeChange,
    required TResult Function(String from, kotItem item) itemAction,
    required TResult Function() categoryFetch,
    required TResult Function(String category, bool acOrNonAc)
        categorySelection,
  }) {
    return itemInitalFetch(acOrNonAc);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchStocksAndCategory,
    TResult? Function()? clearcategory,
    TResult? Function(int qty, bool? update, double? amount, kotItem? item,
            String productid, bool isIncrement)?
        add,
    TResult? Function(List<kotItem> itemslist, List<kotItem> cancelItemslist)?
        listFromOrder,
    TResult? Function()? clearSelection,
    TResult? Function(String searchQuary, bool acOrNonAc)? search,
    TResult? Function(bool acOrNonAc)? itemInitalFetch,
    TResult? Function(String type)? typeChange,
    TResult? Function(String from, kotItem item)? itemAction,
    TResult? Function()? categoryFetch,
    TResult? Function(String category, bool acOrNonAc)? categorySelection,
  }) {
    return itemInitalFetch?.call(acOrNonAc);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchStocksAndCategory,
    TResult Function()? clearcategory,
    TResult Function(int qty, bool? update, double? amount, kotItem? item,
            String productid, bool isIncrement)?
        add,
    TResult Function(List<kotItem> itemslist, List<kotItem> cancelItemslist)?
        listFromOrder,
    TResult Function()? clearSelection,
    TResult Function(String searchQuary, bool acOrNonAc)? search,
    TResult Function(bool acOrNonAc)? itemInitalFetch,
    TResult Function(String type)? typeChange,
    TResult Function(String from, kotItem item)? itemAction,
    TResult Function()? categoryFetch,
    TResult Function(String category, bool acOrNonAc)? categorySelection,
    required TResult orElse(),
  }) {
    if (itemInitalFetch != null) {
      return itemInitalFetch(acOrNonAc);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchStocksAndCategory value)
        fetchStocksAndCategory,
    required TResult Function(Clearcategory value) clearcategory,
    required TResult Function(Add value) add,
    required TResult Function(ListFromOrder value) listFromOrder,
    required TResult Function(ClearSelection value) clearSelection,
    required TResult Function(Search value) search,
    required TResult Function(ItemInitalFetch value) itemInitalFetch,
    required TResult Function(TypeChange value) typeChange,
    required TResult Function(ItemAction value) itemAction,
    required TResult Function(CategoryFetch value) categoryFetch,
    required TResult Function(CategorySelection value) categorySelection,
  }) {
    return itemInitalFetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchStocksAndCategory value)? fetchStocksAndCategory,
    TResult? Function(Clearcategory value)? clearcategory,
    TResult? Function(Add value)? add,
    TResult? Function(ListFromOrder value)? listFromOrder,
    TResult? Function(ClearSelection value)? clearSelection,
    TResult? Function(Search value)? search,
    TResult? Function(ItemInitalFetch value)? itemInitalFetch,
    TResult? Function(TypeChange value)? typeChange,
    TResult? Function(ItemAction value)? itemAction,
    TResult? Function(CategoryFetch value)? categoryFetch,
    TResult? Function(CategorySelection value)? categorySelection,
  }) {
    return itemInitalFetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchStocksAndCategory value)? fetchStocksAndCategory,
    TResult Function(Clearcategory value)? clearcategory,
    TResult Function(Add value)? add,
    TResult Function(ListFromOrder value)? listFromOrder,
    TResult Function(ClearSelection value)? clearSelection,
    TResult Function(Search value)? search,
    TResult Function(ItemInitalFetch value)? itemInitalFetch,
    TResult Function(TypeChange value)? typeChange,
    TResult Function(ItemAction value)? itemAction,
    TResult Function(CategoryFetch value)? categoryFetch,
    TResult Function(CategorySelection value)? categorySelection,
    required TResult orElse(),
  }) {
    if (itemInitalFetch != null) {
      return itemInitalFetch(this);
    }
    return orElse();
  }
}

abstract class ItemInitalFetch implements StockEvent {
  const factory ItemInitalFetch({required final bool acOrNonAc}) =
      _$ItemInitalFetchImpl;

  bool get acOrNonAc;

  /// Create a copy of StockEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemInitalFetchImplCopyWith<_$ItemInitalFetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TypeChangeImplCopyWith<$Res> {
  factory _$$TypeChangeImplCopyWith(
          _$TypeChangeImpl value, $Res Function(_$TypeChangeImpl) then) =
      __$$TypeChangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String type});
}

/// @nodoc
class __$$TypeChangeImplCopyWithImpl<$Res>
    extends _$StockEventCopyWithImpl<$Res, _$TypeChangeImpl>
    implements _$$TypeChangeImplCopyWith<$Res> {
  __$$TypeChangeImplCopyWithImpl(
      _$TypeChangeImpl _value, $Res Function(_$TypeChangeImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$TypeChangeImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TypeChangeImpl implements TypeChange {
  const _$TypeChangeImpl({required this.type});

  @override
  final String type;

  @override
  String toString() {
    return 'StockEvent.typeChange(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeChangeImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  /// Create a copy of StockEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeChangeImplCopyWith<_$TypeChangeImpl> get copyWith =>
      __$$TypeChangeImplCopyWithImpl<_$TypeChangeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchStocksAndCategory,
    required TResult Function() clearcategory,
    required TResult Function(int qty, bool? update, double? amount,
            kotItem? item, String productid, bool isIncrement)
        add,
    required TResult Function(
            List<kotItem> itemslist, List<kotItem> cancelItemslist)
        listFromOrder,
    required TResult Function() clearSelection,
    required TResult Function(String searchQuary, bool acOrNonAc) search,
    required TResult Function(bool acOrNonAc) itemInitalFetch,
    required TResult Function(String type) typeChange,
    required TResult Function(String from, kotItem item) itemAction,
    required TResult Function() categoryFetch,
    required TResult Function(String category, bool acOrNonAc)
        categorySelection,
  }) {
    return typeChange(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchStocksAndCategory,
    TResult? Function()? clearcategory,
    TResult? Function(int qty, bool? update, double? amount, kotItem? item,
            String productid, bool isIncrement)?
        add,
    TResult? Function(List<kotItem> itemslist, List<kotItem> cancelItemslist)?
        listFromOrder,
    TResult? Function()? clearSelection,
    TResult? Function(String searchQuary, bool acOrNonAc)? search,
    TResult? Function(bool acOrNonAc)? itemInitalFetch,
    TResult? Function(String type)? typeChange,
    TResult? Function(String from, kotItem item)? itemAction,
    TResult? Function()? categoryFetch,
    TResult? Function(String category, bool acOrNonAc)? categorySelection,
  }) {
    return typeChange?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchStocksAndCategory,
    TResult Function()? clearcategory,
    TResult Function(int qty, bool? update, double? amount, kotItem? item,
            String productid, bool isIncrement)?
        add,
    TResult Function(List<kotItem> itemslist, List<kotItem> cancelItemslist)?
        listFromOrder,
    TResult Function()? clearSelection,
    TResult Function(String searchQuary, bool acOrNonAc)? search,
    TResult Function(bool acOrNonAc)? itemInitalFetch,
    TResult Function(String type)? typeChange,
    TResult Function(String from, kotItem item)? itemAction,
    TResult Function()? categoryFetch,
    TResult Function(String category, bool acOrNonAc)? categorySelection,
    required TResult orElse(),
  }) {
    if (typeChange != null) {
      return typeChange(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchStocksAndCategory value)
        fetchStocksAndCategory,
    required TResult Function(Clearcategory value) clearcategory,
    required TResult Function(Add value) add,
    required TResult Function(ListFromOrder value) listFromOrder,
    required TResult Function(ClearSelection value) clearSelection,
    required TResult Function(Search value) search,
    required TResult Function(ItemInitalFetch value) itemInitalFetch,
    required TResult Function(TypeChange value) typeChange,
    required TResult Function(ItemAction value) itemAction,
    required TResult Function(CategoryFetch value) categoryFetch,
    required TResult Function(CategorySelection value) categorySelection,
  }) {
    return typeChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchStocksAndCategory value)? fetchStocksAndCategory,
    TResult? Function(Clearcategory value)? clearcategory,
    TResult? Function(Add value)? add,
    TResult? Function(ListFromOrder value)? listFromOrder,
    TResult? Function(ClearSelection value)? clearSelection,
    TResult? Function(Search value)? search,
    TResult? Function(ItemInitalFetch value)? itemInitalFetch,
    TResult? Function(TypeChange value)? typeChange,
    TResult? Function(ItemAction value)? itemAction,
    TResult? Function(CategoryFetch value)? categoryFetch,
    TResult? Function(CategorySelection value)? categorySelection,
  }) {
    return typeChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchStocksAndCategory value)? fetchStocksAndCategory,
    TResult Function(Clearcategory value)? clearcategory,
    TResult Function(Add value)? add,
    TResult Function(ListFromOrder value)? listFromOrder,
    TResult Function(ClearSelection value)? clearSelection,
    TResult Function(Search value)? search,
    TResult Function(ItemInitalFetch value)? itemInitalFetch,
    TResult Function(TypeChange value)? typeChange,
    TResult Function(ItemAction value)? itemAction,
    TResult Function(CategoryFetch value)? categoryFetch,
    TResult Function(CategorySelection value)? categorySelection,
    required TResult orElse(),
  }) {
    if (typeChange != null) {
      return typeChange(this);
    }
    return orElse();
  }
}

abstract class TypeChange implements StockEvent {
  const factory TypeChange({required final String type}) = _$TypeChangeImpl;

  String get type;

  /// Create a copy of StockEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TypeChangeImplCopyWith<_$TypeChangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ItemActionImplCopyWith<$Res> {
  factory _$$ItemActionImplCopyWith(
          _$ItemActionImpl value, $Res Function(_$ItemActionImpl) then) =
      __$$ItemActionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String from, kotItem item});
}

/// @nodoc
class __$$ItemActionImplCopyWithImpl<$Res>
    extends _$StockEventCopyWithImpl<$Res, _$ItemActionImpl>
    implements _$$ItemActionImplCopyWith<$Res> {
  __$$ItemActionImplCopyWithImpl(
      _$ItemActionImpl _value, $Res Function(_$ItemActionImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? item = null,
  }) {
    return _then(_$ItemActionImpl(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as kotItem,
    ));
  }
}

/// @nodoc

class _$ItemActionImpl implements ItemAction {
  const _$ItemActionImpl({required this.from, required this.item});

  @override
  final String from;
  @override
  final kotItem item;

  @override
  String toString() {
    return 'StockEvent.itemAction(from: $from, item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemActionImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, from, item);

  /// Create a copy of StockEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemActionImplCopyWith<_$ItemActionImpl> get copyWith =>
      __$$ItemActionImplCopyWithImpl<_$ItemActionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchStocksAndCategory,
    required TResult Function() clearcategory,
    required TResult Function(int qty, bool? update, double? amount,
            kotItem? item, String productid, bool isIncrement)
        add,
    required TResult Function(
            List<kotItem> itemslist, List<kotItem> cancelItemslist)
        listFromOrder,
    required TResult Function() clearSelection,
    required TResult Function(String searchQuary, bool acOrNonAc) search,
    required TResult Function(bool acOrNonAc) itemInitalFetch,
    required TResult Function(String type) typeChange,
    required TResult Function(String from, kotItem item) itemAction,
    required TResult Function() categoryFetch,
    required TResult Function(String category, bool acOrNonAc)
        categorySelection,
  }) {
    return itemAction(from, item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchStocksAndCategory,
    TResult? Function()? clearcategory,
    TResult? Function(int qty, bool? update, double? amount, kotItem? item,
            String productid, bool isIncrement)?
        add,
    TResult? Function(List<kotItem> itemslist, List<kotItem> cancelItemslist)?
        listFromOrder,
    TResult? Function()? clearSelection,
    TResult? Function(String searchQuary, bool acOrNonAc)? search,
    TResult? Function(bool acOrNonAc)? itemInitalFetch,
    TResult? Function(String type)? typeChange,
    TResult? Function(String from, kotItem item)? itemAction,
    TResult? Function()? categoryFetch,
    TResult? Function(String category, bool acOrNonAc)? categorySelection,
  }) {
    return itemAction?.call(from, item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchStocksAndCategory,
    TResult Function()? clearcategory,
    TResult Function(int qty, bool? update, double? amount, kotItem? item,
            String productid, bool isIncrement)?
        add,
    TResult Function(List<kotItem> itemslist, List<kotItem> cancelItemslist)?
        listFromOrder,
    TResult Function()? clearSelection,
    TResult Function(String searchQuary, bool acOrNonAc)? search,
    TResult Function(bool acOrNonAc)? itemInitalFetch,
    TResult Function(String type)? typeChange,
    TResult Function(String from, kotItem item)? itemAction,
    TResult Function()? categoryFetch,
    TResult Function(String category, bool acOrNonAc)? categorySelection,
    required TResult orElse(),
  }) {
    if (itemAction != null) {
      return itemAction(from, item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchStocksAndCategory value)
        fetchStocksAndCategory,
    required TResult Function(Clearcategory value) clearcategory,
    required TResult Function(Add value) add,
    required TResult Function(ListFromOrder value) listFromOrder,
    required TResult Function(ClearSelection value) clearSelection,
    required TResult Function(Search value) search,
    required TResult Function(ItemInitalFetch value) itemInitalFetch,
    required TResult Function(TypeChange value) typeChange,
    required TResult Function(ItemAction value) itemAction,
    required TResult Function(CategoryFetch value) categoryFetch,
    required TResult Function(CategorySelection value) categorySelection,
  }) {
    return itemAction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchStocksAndCategory value)? fetchStocksAndCategory,
    TResult? Function(Clearcategory value)? clearcategory,
    TResult? Function(Add value)? add,
    TResult? Function(ListFromOrder value)? listFromOrder,
    TResult? Function(ClearSelection value)? clearSelection,
    TResult? Function(Search value)? search,
    TResult? Function(ItemInitalFetch value)? itemInitalFetch,
    TResult? Function(TypeChange value)? typeChange,
    TResult? Function(ItemAction value)? itemAction,
    TResult? Function(CategoryFetch value)? categoryFetch,
    TResult? Function(CategorySelection value)? categorySelection,
  }) {
    return itemAction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchStocksAndCategory value)? fetchStocksAndCategory,
    TResult Function(Clearcategory value)? clearcategory,
    TResult Function(Add value)? add,
    TResult Function(ListFromOrder value)? listFromOrder,
    TResult Function(ClearSelection value)? clearSelection,
    TResult Function(Search value)? search,
    TResult Function(ItemInitalFetch value)? itemInitalFetch,
    TResult Function(TypeChange value)? typeChange,
    TResult Function(ItemAction value)? itemAction,
    TResult Function(CategoryFetch value)? categoryFetch,
    TResult Function(CategorySelection value)? categorySelection,
    required TResult orElse(),
  }) {
    if (itemAction != null) {
      return itemAction(this);
    }
    return orElse();
  }
}

abstract class ItemAction implements StockEvent {
  const factory ItemAction(
      {required final String from,
      required final kotItem item}) = _$ItemActionImpl;

  String get from;
  kotItem get item;

  /// Create a copy of StockEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemActionImplCopyWith<_$ItemActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategoryFetchImplCopyWith<$Res> {
  factory _$$CategoryFetchImplCopyWith(
          _$CategoryFetchImpl value, $Res Function(_$CategoryFetchImpl) then) =
      __$$CategoryFetchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CategoryFetchImplCopyWithImpl<$Res>
    extends _$StockEventCopyWithImpl<$Res, _$CategoryFetchImpl>
    implements _$$CategoryFetchImplCopyWith<$Res> {
  __$$CategoryFetchImplCopyWithImpl(
      _$CategoryFetchImpl _value, $Res Function(_$CategoryFetchImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CategoryFetchImpl implements CategoryFetch {
  const _$CategoryFetchImpl();

  @override
  String toString() {
    return 'StockEvent.categoryFetch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CategoryFetchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchStocksAndCategory,
    required TResult Function() clearcategory,
    required TResult Function(int qty, bool? update, double? amount,
            kotItem? item, String productid, bool isIncrement)
        add,
    required TResult Function(
            List<kotItem> itemslist, List<kotItem> cancelItemslist)
        listFromOrder,
    required TResult Function() clearSelection,
    required TResult Function(String searchQuary, bool acOrNonAc) search,
    required TResult Function(bool acOrNonAc) itemInitalFetch,
    required TResult Function(String type) typeChange,
    required TResult Function(String from, kotItem item) itemAction,
    required TResult Function() categoryFetch,
    required TResult Function(String category, bool acOrNonAc)
        categorySelection,
  }) {
    return categoryFetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchStocksAndCategory,
    TResult? Function()? clearcategory,
    TResult? Function(int qty, bool? update, double? amount, kotItem? item,
            String productid, bool isIncrement)?
        add,
    TResult? Function(List<kotItem> itemslist, List<kotItem> cancelItemslist)?
        listFromOrder,
    TResult? Function()? clearSelection,
    TResult? Function(String searchQuary, bool acOrNonAc)? search,
    TResult? Function(bool acOrNonAc)? itemInitalFetch,
    TResult? Function(String type)? typeChange,
    TResult? Function(String from, kotItem item)? itemAction,
    TResult? Function()? categoryFetch,
    TResult? Function(String category, bool acOrNonAc)? categorySelection,
  }) {
    return categoryFetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchStocksAndCategory,
    TResult Function()? clearcategory,
    TResult Function(int qty, bool? update, double? amount, kotItem? item,
            String productid, bool isIncrement)?
        add,
    TResult Function(List<kotItem> itemslist, List<kotItem> cancelItemslist)?
        listFromOrder,
    TResult Function()? clearSelection,
    TResult Function(String searchQuary, bool acOrNonAc)? search,
    TResult Function(bool acOrNonAc)? itemInitalFetch,
    TResult Function(String type)? typeChange,
    TResult Function(String from, kotItem item)? itemAction,
    TResult Function()? categoryFetch,
    TResult Function(String category, bool acOrNonAc)? categorySelection,
    required TResult orElse(),
  }) {
    if (categoryFetch != null) {
      return categoryFetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchStocksAndCategory value)
        fetchStocksAndCategory,
    required TResult Function(Clearcategory value) clearcategory,
    required TResult Function(Add value) add,
    required TResult Function(ListFromOrder value) listFromOrder,
    required TResult Function(ClearSelection value) clearSelection,
    required TResult Function(Search value) search,
    required TResult Function(ItemInitalFetch value) itemInitalFetch,
    required TResult Function(TypeChange value) typeChange,
    required TResult Function(ItemAction value) itemAction,
    required TResult Function(CategoryFetch value) categoryFetch,
    required TResult Function(CategorySelection value) categorySelection,
  }) {
    return categoryFetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchStocksAndCategory value)? fetchStocksAndCategory,
    TResult? Function(Clearcategory value)? clearcategory,
    TResult? Function(Add value)? add,
    TResult? Function(ListFromOrder value)? listFromOrder,
    TResult? Function(ClearSelection value)? clearSelection,
    TResult? Function(Search value)? search,
    TResult? Function(ItemInitalFetch value)? itemInitalFetch,
    TResult? Function(TypeChange value)? typeChange,
    TResult? Function(ItemAction value)? itemAction,
    TResult? Function(CategoryFetch value)? categoryFetch,
    TResult? Function(CategorySelection value)? categorySelection,
  }) {
    return categoryFetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchStocksAndCategory value)? fetchStocksAndCategory,
    TResult Function(Clearcategory value)? clearcategory,
    TResult Function(Add value)? add,
    TResult Function(ListFromOrder value)? listFromOrder,
    TResult Function(ClearSelection value)? clearSelection,
    TResult Function(Search value)? search,
    TResult Function(ItemInitalFetch value)? itemInitalFetch,
    TResult Function(TypeChange value)? typeChange,
    TResult Function(ItemAction value)? itemAction,
    TResult Function(CategoryFetch value)? categoryFetch,
    TResult Function(CategorySelection value)? categorySelection,
    required TResult orElse(),
  }) {
    if (categoryFetch != null) {
      return categoryFetch(this);
    }
    return orElse();
  }
}

abstract class CategoryFetch implements StockEvent {
  const factory CategoryFetch() = _$CategoryFetchImpl;
}

/// @nodoc
abstract class _$$CategorySelectionImplCopyWith<$Res> {
  factory _$$CategorySelectionImplCopyWith(_$CategorySelectionImpl value,
          $Res Function(_$CategorySelectionImpl) then) =
      __$$CategorySelectionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String category, bool acOrNonAc});
}

/// @nodoc
class __$$CategorySelectionImplCopyWithImpl<$Res>
    extends _$StockEventCopyWithImpl<$Res, _$CategorySelectionImpl>
    implements _$$CategorySelectionImplCopyWith<$Res> {
  __$$CategorySelectionImplCopyWithImpl(_$CategorySelectionImpl _value,
      $Res Function(_$CategorySelectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? acOrNonAc = null,
  }) {
    return _then(_$CategorySelectionImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      acOrNonAc: null == acOrNonAc
          ? _value.acOrNonAc
          : acOrNonAc // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CategorySelectionImpl implements CategorySelection {
  const _$CategorySelectionImpl(
      {required this.category, required this.acOrNonAc});

  @override
  final String category;
  @override
  final bool acOrNonAc;

  @override
  String toString() {
    return 'StockEvent.categorySelection(category: $category, acOrNonAc: $acOrNonAc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategorySelectionImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.acOrNonAc, acOrNonAc) ||
                other.acOrNonAc == acOrNonAc));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category, acOrNonAc);

  /// Create a copy of StockEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategorySelectionImplCopyWith<_$CategorySelectionImpl> get copyWith =>
      __$$CategorySelectionImplCopyWithImpl<_$CategorySelectionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchStocksAndCategory,
    required TResult Function() clearcategory,
    required TResult Function(int qty, bool? update, double? amount,
            kotItem? item, String productid, bool isIncrement)
        add,
    required TResult Function(
            List<kotItem> itemslist, List<kotItem> cancelItemslist)
        listFromOrder,
    required TResult Function() clearSelection,
    required TResult Function(String searchQuary, bool acOrNonAc) search,
    required TResult Function(bool acOrNonAc) itemInitalFetch,
    required TResult Function(String type) typeChange,
    required TResult Function(String from, kotItem item) itemAction,
    required TResult Function() categoryFetch,
    required TResult Function(String category, bool acOrNonAc)
        categorySelection,
  }) {
    return categorySelection(category, acOrNonAc);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchStocksAndCategory,
    TResult? Function()? clearcategory,
    TResult? Function(int qty, bool? update, double? amount, kotItem? item,
            String productid, bool isIncrement)?
        add,
    TResult? Function(List<kotItem> itemslist, List<kotItem> cancelItemslist)?
        listFromOrder,
    TResult? Function()? clearSelection,
    TResult? Function(String searchQuary, bool acOrNonAc)? search,
    TResult? Function(bool acOrNonAc)? itemInitalFetch,
    TResult? Function(String type)? typeChange,
    TResult? Function(String from, kotItem item)? itemAction,
    TResult? Function()? categoryFetch,
    TResult? Function(String category, bool acOrNonAc)? categorySelection,
  }) {
    return categorySelection?.call(category, acOrNonAc);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchStocksAndCategory,
    TResult Function()? clearcategory,
    TResult Function(int qty, bool? update, double? amount, kotItem? item,
            String productid, bool isIncrement)?
        add,
    TResult Function(List<kotItem> itemslist, List<kotItem> cancelItemslist)?
        listFromOrder,
    TResult Function()? clearSelection,
    TResult Function(String searchQuary, bool acOrNonAc)? search,
    TResult Function(bool acOrNonAc)? itemInitalFetch,
    TResult Function(String type)? typeChange,
    TResult Function(String from, kotItem item)? itemAction,
    TResult Function()? categoryFetch,
    TResult Function(String category, bool acOrNonAc)? categorySelection,
    required TResult orElse(),
  }) {
    if (categorySelection != null) {
      return categorySelection(category, acOrNonAc);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchStocksAndCategory value)
        fetchStocksAndCategory,
    required TResult Function(Clearcategory value) clearcategory,
    required TResult Function(Add value) add,
    required TResult Function(ListFromOrder value) listFromOrder,
    required TResult Function(ClearSelection value) clearSelection,
    required TResult Function(Search value) search,
    required TResult Function(ItemInitalFetch value) itemInitalFetch,
    required TResult Function(TypeChange value) typeChange,
    required TResult Function(ItemAction value) itemAction,
    required TResult Function(CategoryFetch value) categoryFetch,
    required TResult Function(CategorySelection value) categorySelection,
  }) {
    return categorySelection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchStocksAndCategory value)? fetchStocksAndCategory,
    TResult? Function(Clearcategory value)? clearcategory,
    TResult? Function(Add value)? add,
    TResult? Function(ListFromOrder value)? listFromOrder,
    TResult? Function(ClearSelection value)? clearSelection,
    TResult? Function(Search value)? search,
    TResult? Function(ItemInitalFetch value)? itemInitalFetch,
    TResult? Function(TypeChange value)? typeChange,
    TResult? Function(ItemAction value)? itemAction,
    TResult? Function(CategoryFetch value)? categoryFetch,
    TResult? Function(CategorySelection value)? categorySelection,
  }) {
    return categorySelection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchStocksAndCategory value)? fetchStocksAndCategory,
    TResult Function(Clearcategory value)? clearcategory,
    TResult Function(Add value)? add,
    TResult Function(ListFromOrder value)? listFromOrder,
    TResult Function(ClearSelection value)? clearSelection,
    TResult Function(Search value)? search,
    TResult Function(ItemInitalFetch value)? itemInitalFetch,
    TResult Function(TypeChange value)? typeChange,
    TResult Function(ItemAction value)? itemAction,
    TResult Function(CategoryFetch value)? categoryFetch,
    TResult Function(CategorySelection value)? categorySelection,
    required TResult orElse(),
  }) {
    if (categorySelection != null) {
      return categorySelection(this);
    }
    return orElse();
  }
}

abstract class CategorySelection implements StockEvent {
  const factory CategorySelection(
      {required final String category,
      required final bool acOrNonAc}) = _$CategorySelectionImpl;

  String get category;
  bool get acOrNonAc;

  /// Create a copy of StockEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategorySelectionImplCopyWith<_$CategorySelectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StockState {
  String get goodsOrSER => throw _privateConstructorUsedError;
  String? get selectedcategory => throw _privateConstructorUsedError;
  List<kotItem> get stocklist => throw _privateConstructorUsedError;
  List<kotItem> get seritems => throw _privateConstructorUsedError;
  List<kotItem> get goodsitems => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasReachedMax => throw _privateConstructorUsedError;
  List<kotItem> get toKOTitems => throw _privateConstructorUsedError;
  List<kotItem> get cancelKOTitems => throw _privateConstructorUsedError;
  List<String> get goodsCategory => throw _privateConstructorUsedError;
  List<String> get serCategory => throw _privateConstructorUsedError;
  List<String> get category => throw _privateConstructorUsedError;

  /// Create a copy of StockState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockStateCopyWith<StockState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockStateCopyWith<$Res> {
  factory $StockStateCopyWith(
          StockState value, $Res Function(StockState) then) =
      _$StockStateCopyWithImpl<$Res, StockState>;
  @useResult
  $Res call(
      {String goodsOrSER,
      String? selectedcategory,
      List<kotItem> stocklist,
      List<kotItem> seritems,
      List<kotItem> goodsitems,
      bool isLoading,
      bool hasReachedMax,
      List<kotItem> toKOTitems,
      List<kotItem> cancelKOTitems,
      List<String> goodsCategory,
      List<String> serCategory,
      List<String> category});
}

/// @nodoc
class _$StockStateCopyWithImpl<$Res, $Val extends StockState>
    implements $StockStateCopyWith<$Res> {
  _$StockStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goodsOrSER = null,
    Object? selectedcategory = freezed,
    Object? stocklist = null,
    Object? seritems = null,
    Object? goodsitems = null,
    Object? isLoading = null,
    Object? hasReachedMax = null,
    Object? toKOTitems = null,
    Object? cancelKOTitems = null,
    Object? goodsCategory = null,
    Object? serCategory = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      goodsOrSER: null == goodsOrSER
          ? _value.goodsOrSER
          : goodsOrSER // ignore: cast_nullable_to_non_nullable
              as String,
      selectedcategory: freezed == selectedcategory
          ? _value.selectedcategory
          : selectedcategory // ignore: cast_nullable_to_non_nullable
              as String?,
      stocklist: null == stocklist
          ? _value.stocklist
          : stocklist // ignore: cast_nullable_to_non_nullable
              as List<kotItem>,
      seritems: null == seritems
          ? _value.seritems
          : seritems // ignore: cast_nullable_to_non_nullable
              as List<kotItem>,
      goodsitems: null == goodsitems
          ? _value.goodsitems
          : goodsitems // ignore: cast_nullable_to_non_nullable
              as List<kotItem>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      toKOTitems: null == toKOTitems
          ? _value.toKOTitems
          : toKOTitems // ignore: cast_nullable_to_non_nullable
              as List<kotItem>,
      cancelKOTitems: null == cancelKOTitems
          ? _value.cancelKOTitems
          : cancelKOTitems // ignore: cast_nullable_to_non_nullable
              as List<kotItem>,
      goodsCategory: null == goodsCategory
          ? _value.goodsCategory
          : goodsCategory // ignore: cast_nullable_to_non_nullable
              as List<String>,
      serCategory: null == serCategory
          ? _value.serCategory
          : serCategory // ignore: cast_nullable_to_non_nullable
              as List<String>,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockStateImplCopyWith<$Res>
    implements $StockStateCopyWith<$Res> {
  factory _$$StockStateImplCopyWith(
          _$StockStateImpl value, $Res Function(_$StockStateImpl) then) =
      __$$StockStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String goodsOrSER,
      String? selectedcategory,
      List<kotItem> stocklist,
      List<kotItem> seritems,
      List<kotItem> goodsitems,
      bool isLoading,
      bool hasReachedMax,
      List<kotItem> toKOTitems,
      List<kotItem> cancelKOTitems,
      List<String> goodsCategory,
      List<String> serCategory,
      List<String> category});
}

/// @nodoc
class __$$StockStateImplCopyWithImpl<$Res>
    extends _$StockStateCopyWithImpl<$Res, _$StockStateImpl>
    implements _$$StockStateImplCopyWith<$Res> {
  __$$StockStateImplCopyWithImpl(
      _$StockStateImpl _value, $Res Function(_$StockStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goodsOrSER = null,
    Object? selectedcategory = freezed,
    Object? stocklist = null,
    Object? seritems = null,
    Object? goodsitems = null,
    Object? isLoading = null,
    Object? hasReachedMax = null,
    Object? toKOTitems = null,
    Object? cancelKOTitems = null,
    Object? goodsCategory = null,
    Object? serCategory = null,
    Object? category = null,
  }) {
    return _then(_$StockStateImpl(
      goodsOrSER: null == goodsOrSER
          ? _value.goodsOrSER
          : goodsOrSER // ignore: cast_nullable_to_non_nullable
              as String,
      selectedcategory: freezed == selectedcategory
          ? _value.selectedcategory
          : selectedcategory // ignore: cast_nullable_to_non_nullable
              as String?,
      stocklist: null == stocklist
          ? _value._stocklist
          : stocklist // ignore: cast_nullable_to_non_nullable
              as List<kotItem>,
      seritems: null == seritems
          ? _value._seritems
          : seritems // ignore: cast_nullable_to_non_nullable
              as List<kotItem>,
      goodsitems: null == goodsitems
          ? _value._goodsitems
          : goodsitems // ignore: cast_nullable_to_non_nullable
              as List<kotItem>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      toKOTitems: null == toKOTitems
          ? _value._toKOTitems
          : toKOTitems // ignore: cast_nullable_to_non_nullable
              as List<kotItem>,
      cancelKOTitems: null == cancelKOTitems
          ? _value._cancelKOTitems
          : cancelKOTitems // ignore: cast_nullable_to_non_nullable
              as List<kotItem>,
      goodsCategory: null == goodsCategory
          ? _value._goodsCategory
          : goodsCategory // ignore: cast_nullable_to_non_nullable
              as List<String>,
      serCategory: null == serCategory
          ? _value._serCategory
          : serCategory // ignore: cast_nullable_to_non_nullable
              as List<String>,
      category: null == category
          ? _value._category
          : category // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$StockStateImpl implements _StockState {
  _$StockStateImpl(
      {required this.goodsOrSER,
      this.selectedcategory,
      required final List<kotItem> stocklist,
      required final List<kotItem> seritems,
      required final List<kotItem> goodsitems,
      required this.isLoading,
      required this.hasReachedMax,
      required final List<kotItem> toKOTitems,
      required final List<kotItem> cancelKOTitems,
      required final List<String> goodsCategory,
      required final List<String> serCategory,
      required final List<String> category})
      : _stocklist = stocklist,
        _seritems = seritems,
        _goodsitems = goodsitems,
        _toKOTitems = toKOTitems,
        _cancelKOTitems = cancelKOTitems,
        _goodsCategory = goodsCategory,
        _serCategory = serCategory,
        _category = category;

  @override
  final String goodsOrSER;
  @override
  final String? selectedcategory;
  final List<kotItem> _stocklist;
  @override
  List<kotItem> get stocklist {
    if (_stocklist is EqualUnmodifiableListView) return _stocklist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stocklist);
  }

  final List<kotItem> _seritems;
  @override
  List<kotItem> get seritems {
    if (_seritems is EqualUnmodifiableListView) return _seritems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_seritems);
  }

  final List<kotItem> _goodsitems;
  @override
  List<kotItem> get goodsitems {
    if (_goodsitems is EqualUnmodifiableListView) return _goodsitems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_goodsitems);
  }

  @override
  final bool isLoading;
  @override
  final bool hasReachedMax;
  final List<kotItem> _toKOTitems;
  @override
  List<kotItem> get toKOTitems {
    if (_toKOTitems is EqualUnmodifiableListView) return _toKOTitems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_toKOTitems);
  }

  final List<kotItem> _cancelKOTitems;
  @override
  List<kotItem> get cancelKOTitems {
    if (_cancelKOTitems is EqualUnmodifiableListView) return _cancelKOTitems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cancelKOTitems);
  }

  final List<String> _goodsCategory;
  @override
  List<String> get goodsCategory {
    if (_goodsCategory is EqualUnmodifiableListView) return _goodsCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_goodsCategory);
  }

  final List<String> _serCategory;
  @override
  List<String> get serCategory {
    if (_serCategory is EqualUnmodifiableListView) return _serCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serCategory);
  }

  final List<String> _category;
  @override
  List<String> get category {
    if (_category is EqualUnmodifiableListView) return _category;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_category);
  }

  @override
  String toString() {
    return 'StockState(goodsOrSER: $goodsOrSER, selectedcategory: $selectedcategory, stocklist: $stocklist, seritems: $seritems, goodsitems: $goodsitems, isLoading: $isLoading, hasReachedMax: $hasReachedMax, toKOTitems: $toKOTitems, cancelKOTitems: $cancelKOTitems, goodsCategory: $goodsCategory, serCategory: $serCategory, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockStateImpl &&
            (identical(other.goodsOrSER, goodsOrSER) ||
                other.goodsOrSER == goodsOrSER) &&
            (identical(other.selectedcategory, selectedcategory) ||
                other.selectedcategory == selectedcategory) &&
            const DeepCollectionEquality()
                .equals(other._stocklist, _stocklist) &&
            const DeepCollectionEquality().equals(other._seritems, _seritems) &&
            const DeepCollectionEquality()
                .equals(other._goodsitems, _goodsitems) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            const DeepCollectionEquality()
                .equals(other._toKOTitems, _toKOTitems) &&
            const DeepCollectionEquality()
                .equals(other._cancelKOTitems, _cancelKOTitems) &&
            const DeepCollectionEquality()
                .equals(other._goodsCategory, _goodsCategory) &&
            const DeepCollectionEquality()
                .equals(other._serCategory, _serCategory) &&
            const DeepCollectionEquality().equals(other._category, _category));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      goodsOrSER,
      selectedcategory,
      const DeepCollectionEquality().hash(_stocklist),
      const DeepCollectionEquality().hash(_seritems),
      const DeepCollectionEquality().hash(_goodsitems),
      isLoading,
      hasReachedMax,
      const DeepCollectionEquality().hash(_toKOTitems),
      const DeepCollectionEquality().hash(_cancelKOTitems),
      const DeepCollectionEquality().hash(_goodsCategory),
      const DeepCollectionEquality().hash(_serCategory),
      const DeepCollectionEquality().hash(_category));

  /// Create a copy of StockState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockStateImplCopyWith<_$StockStateImpl> get copyWith =>
      __$$StockStateImplCopyWithImpl<_$StockStateImpl>(this, _$identity);
}

abstract class _StockState implements StockState {
  factory _StockState(
      {required final String goodsOrSER,
      final String? selectedcategory,
      required final List<kotItem> stocklist,
      required final List<kotItem> seritems,
      required final List<kotItem> goodsitems,
      required final bool isLoading,
      required final bool hasReachedMax,
      required final List<kotItem> toKOTitems,
      required final List<kotItem> cancelKOTitems,
      required final List<String> goodsCategory,
      required final List<String> serCategory,
      required final List<String> category}) = _$StockStateImpl;

  @override
  String get goodsOrSER;
  @override
  String? get selectedcategory;
  @override
  List<kotItem> get stocklist;
  @override
  List<kotItem> get seritems;
  @override
  List<kotItem> get goodsitems;
  @override
  bool get isLoading;
  @override
  bool get hasReachedMax;
  @override
  List<kotItem> get toKOTitems;
  @override
  List<kotItem> get cancelKOTitems;
  @override
  List<String> get goodsCategory;
  @override
  List<String> get serCategory;
  @override
  List<String> get category;

  /// Create a copy of StockState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockStateImplCopyWith<_$StockStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
