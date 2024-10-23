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
    required TResult Function(int qty, bool? update, String? amount,
            Product product, String from, bool isIncrement)
        add,
    required TResult Function(String from, String searchQuary) search,
    required TResult Function(Category category, String from) categorySelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchStocksAndCategory,
    TResult? Function()? clearcategory,
    TResult? Function(int qty, bool? update, String? amount, Product product,
            String from, bool isIncrement)?
        add,
    TResult? Function(String from, String searchQuary)? search,
    TResult? Function(Category category, String from)? categorySelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchStocksAndCategory,
    TResult Function()? clearcategory,
    TResult Function(int qty, bool? update, String? amount, Product product,
            String from, bool isIncrement)?
        add,
    TResult Function(String from, String searchQuary)? search,
    TResult Function(Category category, String from)? categorySelection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchStocksAndCategory value)
        fetchStocksAndCategory,
    required TResult Function(Clearcategory value) clearcategory,
    required TResult Function(Add value) add,
    required TResult Function(Search value) search,
    required TResult Function(CategorySelection value) categorySelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchStocksAndCategory value)? fetchStocksAndCategory,
    TResult? Function(Clearcategory value)? clearcategory,
    TResult? Function(Add value)? add,
    TResult? Function(Search value)? search,
    TResult? Function(CategorySelection value)? categorySelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchStocksAndCategory value)? fetchStocksAndCategory,
    TResult Function(Clearcategory value)? clearcategory,
    TResult Function(Add value)? add,
    TResult Function(Search value)? search,
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
    required TResult Function(int qty, bool? update, String? amount,
            Product product, String from, bool isIncrement)
        add,
    required TResult Function(String from, String searchQuary) search,
    required TResult Function(Category category, String from) categorySelection,
  }) {
    return fetchStocksAndCategory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchStocksAndCategory,
    TResult? Function()? clearcategory,
    TResult? Function(int qty, bool? update, String? amount, Product product,
            String from, bool isIncrement)?
        add,
    TResult? Function(String from, String searchQuary)? search,
    TResult? Function(Category category, String from)? categorySelection,
  }) {
    return fetchStocksAndCategory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchStocksAndCategory,
    TResult Function()? clearcategory,
    TResult Function(int qty, bool? update, String? amount, Product product,
            String from, bool isIncrement)?
        add,
    TResult Function(String from, String searchQuary)? search,
    TResult Function(Category category, String from)? categorySelection,
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
    required TResult Function(Search value) search,
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
    TResult? Function(Search value)? search,
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
    TResult Function(Search value)? search,
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
    required TResult Function(int qty, bool? update, String? amount,
            Product product, String from, bool isIncrement)
        add,
    required TResult Function(String from, String searchQuary) search,
    required TResult Function(Category category, String from) categorySelection,
  }) {
    return clearcategory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchStocksAndCategory,
    TResult? Function()? clearcategory,
    TResult? Function(int qty, bool? update, String? amount, Product product,
            String from, bool isIncrement)?
        add,
    TResult? Function(String from, String searchQuary)? search,
    TResult? Function(Category category, String from)? categorySelection,
  }) {
    return clearcategory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchStocksAndCategory,
    TResult Function()? clearcategory,
    TResult Function(int qty, bool? update, String? amount, Product product,
            String from, bool isIncrement)?
        add,
    TResult Function(String from, String searchQuary)? search,
    TResult Function(Category category, String from)? categorySelection,
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
    required TResult Function(Search value) search,
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
    TResult? Function(Search value)? search,
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
    TResult Function(Search value)? search,
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
      String? amount,
      Product product,
      String from,
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
    Object? product = null,
    Object? from = null,
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
              as String?,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
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
      required this.product,
      required this.from,
      required this.isIncrement});

  @override
  final int qty;
  @override
  final bool? update;
  @override
  final String? amount;
  @override
  final Product product;
  @override
  final String from;
  @override
  final bool isIncrement;

  @override
  String toString() {
    return 'StockEvent.add(qty: $qty, update: $update, amount: $amount, product: $product, from: $from, isIncrement: $isIncrement)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddImpl &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.update, update) || other.update == update) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.isIncrement, isIncrement) ||
                other.isIncrement == isIncrement));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, qty, update, amount, product, from, isIncrement);

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
    required TResult Function(int qty, bool? update, String? amount,
            Product product, String from, bool isIncrement)
        add,
    required TResult Function(String from, String searchQuary) search,
    required TResult Function(Category category, String from) categorySelection,
  }) {
    return add(qty, update, amount, product, from, isIncrement);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchStocksAndCategory,
    TResult? Function()? clearcategory,
    TResult? Function(int qty, bool? update, String? amount, Product product,
            String from, bool isIncrement)?
        add,
    TResult? Function(String from, String searchQuary)? search,
    TResult? Function(Category category, String from)? categorySelection,
  }) {
    return add?.call(qty, update, amount, product, from, isIncrement);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchStocksAndCategory,
    TResult Function()? clearcategory,
    TResult Function(int qty, bool? update, String? amount, Product product,
            String from, bool isIncrement)?
        add,
    TResult Function(String from, String searchQuary)? search,
    TResult Function(Category category, String from)? categorySelection,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(qty, update, amount, product, from, isIncrement);
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
    required TResult Function(Search value) search,
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
    TResult? Function(Search value)? search,
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
    TResult Function(Search value)? search,
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
      final String? amount,
      required final Product product,
      required final String from,
      required final bool isIncrement}) = _$AddImpl;

  int get qty;
  bool? get update;
  String? get amount;
  Product get product;
  String get from;
  bool get isIncrement;

  /// Create a copy of StockEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddImplCopyWith<_$AddImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchImplCopyWith<$Res> {
  factory _$$SearchImplCopyWith(
          _$SearchImpl value, $Res Function(_$SearchImpl) then) =
      __$$SearchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String from, String searchQuary});
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
    Object? from = null,
    Object? searchQuary = null,
  }) {
    return _then(_$SearchImpl(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      searchQuary: null == searchQuary
          ? _value.searchQuary
          : searchQuary // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchImpl implements Search {
  const _$SearchImpl({required this.from, required this.searchQuary});

  @override
  final String from;
  @override
  final String searchQuary;

  @override
  String toString() {
    return 'StockEvent.search(from: $from, searchQuary: $searchQuary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.searchQuary, searchQuary) ||
                other.searchQuary == searchQuary));
  }

  @override
  int get hashCode => Object.hash(runtimeType, from, searchQuary);

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
    required TResult Function(int qty, bool? update, String? amount,
            Product product, String from, bool isIncrement)
        add,
    required TResult Function(String from, String searchQuary) search,
    required TResult Function(Category category, String from) categorySelection,
  }) {
    return search(from, searchQuary);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchStocksAndCategory,
    TResult? Function()? clearcategory,
    TResult? Function(int qty, bool? update, String? amount, Product product,
            String from, bool isIncrement)?
        add,
    TResult? Function(String from, String searchQuary)? search,
    TResult? Function(Category category, String from)? categorySelection,
  }) {
    return search?.call(from, searchQuary);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchStocksAndCategory,
    TResult Function()? clearcategory,
    TResult Function(int qty, bool? update, String? amount, Product product,
            String from, bool isIncrement)?
        add,
    TResult Function(String from, String searchQuary)? search,
    TResult Function(Category category, String from)? categorySelection,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(from, searchQuary);
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
    required TResult Function(Search value) search,
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
    TResult? Function(Search value)? search,
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
    TResult Function(Search value)? search,
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
      {required final String from,
      required final String searchQuary}) = _$SearchImpl;

  String get from;
  String get searchQuary;

  /// Create a copy of StockEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategorySelectionImplCopyWith<$Res> {
  factory _$$CategorySelectionImplCopyWith(_$CategorySelectionImpl value,
          $Res Function(_$CategorySelectionImpl) then) =
      __$$CategorySelectionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Category category, String from});
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
    Object? from = null,
  }) {
    return _then(_$CategorySelectionImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CategorySelectionImpl implements CategorySelection {
  const _$CategorySelectionImpl({required this.category, required this.from});

  @override
  final Category category;
  @override
  final String from;

  @override
  String toString() {
    return 'StockEvent.categorySelection(category: $category, from: $from)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategorySelectionImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.from, from) || other.from == from));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category, from);

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
    required TResult Function(int qty, bool? update, String? amount,
            Product product, String from, bool isIncrement)
        add,
    required TResult Function(String from, String searchQuary) search,
    required TResult Function(Category category, String from) categorySelection,
  }) {
    return categorySelection(category, from);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchStocksAndCategory,
    TResult? Function()? clearcategory,
    TResult? Function(int qty, bool? update, String? amount, Product product,
            String from, bool isIncrement)?
        add,
    TResult? Function(String from, String searchQuary)? search,
    TResult? Function(Category category, String from)? categorySelection,
  }) {
    return categorySelection?.call(category, from);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchStocksAndCategory,
    TResult Function()? clearcategory,
    TResult Function(int qty, bool? update, String? amount, Product product,
            String from, bool isIncrement)?
        add,
    TResult Function(String from, String searchQuary)? search,
    TResult Function(Category category, String from)? categorySelection,
    required TResult orElse(),
  }) {
    if (categorySelection != null) {
      return categorySelection(category, from);
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
    required TResult Function(Search value) search,
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
    TResult? Function(Search value)? search,
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
    TResult Function(Search value)? search,
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
      {required final Category category,
      required final String from}) = _$CategorySelectionImpl;

  Category get category;
  String get from;

  /// Create a copy of StockEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategorySelectionImplCopyWith<_$CategorySelectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StockState {
  Category? get goodscategory => throw _privateConstructorUsedError;
  Category? get sercategory => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasReachedMax => throw _privateConstructorUsedError;
  List<Product> get goodsProducts => throw _privateConstructorUsedError;
  List<Product> get serProducts => throw _privateConstructorUsedError;
  List<Product> get toKOTitems => throw _privateConstructorUsedError;
  List<Category> get goodsCategory => throw _privateConstructorUsedError;
  List<Category> get serCategory => throw _privateConstructorUsedError;

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
      {Category? goodscategory,
      Category? sercategory,
      bool isLoading,
      bool hasReachedMax,
      List<Product> goodsProducts,
      List<Product> serProducts,
      List<Product> toKOTitems,
      List<Category> goodsCategory,
      List<Category> serCategory});
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
    Object? goodscategory = freezed,
    Object? sercategory = freezed,
    Object? isLoading = null,
    Object? hasReachedMax = null,
    Object? goodsProducts = null,
    Object? serProducts = null,
    Object? toKOTitems = null,
    Object? goodsCategory = null,
    Object? serCategory = null,
  }) {
    return _then(_value.copyWith(
      goodscategory: freezed == goodscategory
          ? _value.goodscategory
          : goodscategory // ignore: cast_nullable_to_non_nullable
              as Category?,
      sercategory: freezed == sercategory
          ? _value.sercategory
          : sercategory // ignore: cast_nullable_to_non_nullable
              as Category?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      goodsProducts: null == goodsProducts
          ? _value.goodsProducts
          : goodsProducts // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      serProducts: null == serProducts
          ? _value.serProducts
          : serProducts // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      toKOTitems: null == toKOTitems
          ? _value.toKOTitems
          : toKOTitems // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      goodsCategory: null == goodsCategory
          ? _value.goodsCategory
          : goodsCategory // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      serCategory: null == serCategory
          ? _value.serCategory
          : serCategory // ignore: cast_nullable_to_non_nullable
              as List<Category>,
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
      {Category? goodscategory,
      Category? sercategory,
      bool isLoading,
      bool hasReachedMax,
      List<Product> goodsProducts,
      List<Product> serProducts,
      List<Product> toKOTitems,
      List<Category> goodsCategory,
      List<Category> serCategory});
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
    Object? goodscategory = freezed,
    Object? sercategory = freezed,
    Object? isLoading = null,
    Object? hasReachedMax = null,
    Object? goodsProducts = null,
    Object? serProducts = null,
    Object? toKOTitems = null,
    Object? goodsCategory = null,
    Object? serCategory = null,
  }) {
    return _then(_$StockStateImpl(
      goodscategory: freezed == goodscategory
          ? _value.goodscategory
          : goodscategory // ignore: cast_nullable_to_non_nullable
              as Category?,
      sercategory: freezed == sercategory
          ? _value.sercategory
          : sercategory // ignore: cast_nullable_to_non_nullable
              as Category?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      goodsProducts: null == goodsProducts
          ? _value._goodsProducts
          : goodsProducts // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      serProducts: null == serProducts
          ? _value._serProducts
          : serProducts // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      toKOTitems: null == toKOTitems
          ? _value._toKOTitems
          : toKOTitems // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      goodsCategory: null == goodsCategory
          ? _value._goodsCategory
          : goodsCategory // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      serCategory: null == serCategory
          ? _value._serCategory
          : serCategory // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

/// @nodoc

class _$StockStateImpl implements _StockState {
  _$StockStateImpl(
      {this.goodscategory,
      this.sercategory,
      required this.isLoading,
      required this.hasReachedMax,
      required final List<Product> goodsProducts,
      required final List<Product> serProducts,
      required final List<Product> toKOTitems,
      required final List<Category> goodsCategory,
      required final List<Category> serCategory})
      : _goodsProducts = goodsProducts,
        _serProducts = serProducts,
        _toKOTitems = toKOTitems,
        _goodsCategory = goodsCategory,
        _serCategory = serCategory;

  @override
  final Category? goodscategory;
  @override
  final Category? sercategory;
  @override
  final bool isLoading;
  @override
  final bool hasReachedMax;
  final List<Product> _goodsProducts;
  @override
  List<Product> get goodsProducts {
    if (_goodsProducts is EqualUnmodifiableListView) return _goodsProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_goodsProducts);
  }

  final List<Product> _serProducts;
  @override
  List<Product> get serProducts {
    if (_serProducts is EqualUnmodifiableListView) return _serProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serProducts);
  }

  final List<Product> _toKOTitems;
  @override
  List<Product> get toKOTitems {
    if (_toKOTitems is EqualUnmodifiableListView) return _toKOTitems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_toKOTitems);
  }

  final List<Category> _goodsCategory;
  @override
  List<Category> get goodsCategory {
    if (_goodsCategory is EqualUnmodifiableListView) return _goodsCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_goodsCategory);
  }

  final List<Category> _serCategory;
  @override
  List<Category> get serCategory {
    if (_serCategory is EqualUnmodifiableListView) return _serCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serCategory);
  }

  @override
  String toString() {
    return 'StockState(goodscategory: $goodscategory, sercategory: $sercategory, isLoading: $isLoading, hasReachedMax: $hasReachedMax, goodsProducts: $goodsProducts, serProducts: $serProducts, toKOTitems: $toKOTitems, goodsCategory: $goodsCategory, serCategory: $serCategory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockStateImpl &&
            (identical(other.goodscategory, goodscategory) ||
                other.goodscategory == goodscategory) &&
            (identical(other.sercategory, sercategory) ||
                other.sercategory == sercategory) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            const DeepCollectionEquality()
                .equals(other._goodsProducts, _goodsProducts) &&
            const DeepCollectionEquality()
                .equals(other._serProducts, _serProducts) &&
            const DeepCollectionEquality()
                .equals(other._toKOTitems, _toKOTitems) &&
            const DeepCollectionEquality()
                .equals(other._goodsCategory, _goodsCategory) &&
            const DeepCollectionEquality()
                .equals(other._serCategory, _serCategory));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      goodscategory,
      sercategory,
      isLoading,
      hasReachedMax,
      const DeepCollectionEquality().hash(_goodsProducts),
      const DeepCollectionEquality().hash(_serProducts),
      const DeepCollectionEquality().hash(_toKOTitems),
      const DeepCollectionEquality().hash(_goodsCategory),
      const DeepCollectionEquality().hash(_serCategory));

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
      {final Category? goodscategory,
      final Category? sercategory,
      required final bool isLoading,
      required final bool hasReachedMax,
      required final List<Product> goodsProducts,
      required final List<Product> serProducts,
      required final List<Product> toKOTitems,
      required final List<Category> goodsCategory,
      required final List<Category> serCategory}) = _$StockStateImpl;

  @override
  Category? get goodscategory;
  @override
  Category? get sercategory;
  @override
  bool get isLoading;
  @override
  bool get hasReachedMax;
  @override
  List<Product> get goodsProducts;
  @override
  List<Product> get serProducts;
  @override
  List<Product> get toKOTitems;
  @override
  List<Category> get goodsCategory;
  @override
  List<Category> get serCategory;

  /// Create a copy of StockState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockStateImplCopyWith<_$StockStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
