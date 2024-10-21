// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String orderNo) orderItems,
    required TResult Function(OrderItem currentItem) addQty,
    required TResult Function(OrderItem currentItem) cancelQty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String orderNo)? orderItems,
    TResult? Function(OrderItem currentItem)? addQty,
    TResult? Function(OrderItem currentItem)? cancelQty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orderNo)? orderItems,
    TResult Function(OrderItem currentItem)? addQty,
    TResult Function(OrderItem currentItem)? cancelQty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderDetails value) orderItems,
    required TResult Function(AddQty value) addQty,
    required TResult Function(CancelQty value) cancelQty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderDetails value)? orderItems,
    TResult? Function(AddQty value)? addQty,
    TResult? Function(CancelQty value)? cancelQty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderDetails value)? orderItems,
    TResult Function(AddQty value)? addQty,
    TResult Function(CancelQty value)? cancelQty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailsEventCopyWith<$Res> {
  factory $OrderDetailsEventCopyWith(
          OrderDetailsEvent value, $Res Function(OrderDetailsEvent) then) =
      _$OrderDetailsEventCopyWithImpl<$Res, OrderDetailsEvent>;
}

/// @nodoc
class _$OrderDetailsEventCopyWithImpl<$Res, $Val extends OrderDetailsEvent>
    implements $OrderDetailsEventCopyWith<$Res> {
  _$OrderDetailsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$OrderDetailsImplCopyWith<$Res> {
  factory _$$OrderDetailsImplCopyWith(
          _$OrderDetailsImpl value, $Res Function(_$OrderDetailsImpl) then) =
      __$$OrderDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String orderNo});
}

/// @nodoc
class __$$OrderDetailsImplCopyWithImpl<$Res>
    extends _$OrderDetailsEventCopyWithImpl<$Res, _$OrderDetailsImpl>
    implements _$$OrderDetailsImplCopyWith<$Res> {
  __$$OrderDetailsImplCopyWithImpl(
      _$OrderDetailsImpl _value, $Res Function(_$OrderDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderNo = null,
  }) {
    return _then(_$OrderDetailsImpl(
      orderNo: null == orderNo
          ? _value.orderNo
          : orderNo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OrderDetailsImpl implements OrderDetails {
  const _$OrderDetailsImpl({required this.orderNo});

  @override
  final String orderNo;

  @override
  String toString() {
    return 'OrderDetailsEvent.orderItems(orderNo: $orderNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDetailsImpl &&
            (identical(other.orderNo, orderNo) || other.orderNo == orderNo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderNo);

  /// Create a copy of OrderDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDetailsImplCopyWith<_$OrderDetailsImpl> get copyWith =>
      __$$OrderDetailsImplCopyWithImpl<_$OrderDetailsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String orderNo) orderItems,
    required TResult Function(OrderItem currentItem) addQty,
    required TResult Function(OrderItem currentItem) cancelQty,
  }) {
    return orderItems(orderNo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String orderNo)? orderItems,
    TResult? Function(OrderItem currentItem)? addQty,
    TResult? Function(OrderItem currentItem)? cancelQty,
  }) {
    return orderItems?.call(orderNo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orderNo)? orderItems,
    TResult Function(OrderItem currentItem)? addQty,
    TResult Function(OrderItem currentItem)? cancelQty,
    required TResult orElse(),
  }) {
    if (orderItems != null) {
      return orderItems(orderNo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderDetails value) orderItems,
    required TResult Function(AddQty value) addQty,
    required TResult Function(CancelQty value) cancelQty,
  }) {
    return orderItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderDetails value)? orderItems,
    TResult? Function(AddQty value)? addQty,
    TResult? Function(CancelQty value)? cancelQty,
  }) {
    return orderItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderDetails value)? orderItems,
    TResult Function(AddQty value)? addQty,
    TResult Function(CancelQty value)? cancelQty,
    required TResult orElse(),
  }) {
    if (orderItems != null) {
      return orderItems(this);
    }
    return orElse();
  }
}

abstract class OrderDetails implements OrderDetailsEvent {
  const factory OrderDetails({required final String orderNo}) =
      _$OrderDetailsImpl;

  String get orderNo;

  /// Create a copy of OrderDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderDetailsImplCopyWith<_$OrderDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddQtyImplCopyWith<$Res> {
  factory _$$AddQtyImplCopyWith(
          _$AddQtyImpl value, $Res Function(_$AddQtyImpl) then) =
      __$$AddQtyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OrderItem currentItem});
}

/// @nodoc
class __$$AddQtyImplCopyWithImpl<$Res>
    extends _$OrderDetailsEventCopyWithImpl<$Res, _$AddQtyImpl>
    implements _$$AddQtyImplCopyWith<$Res> {
  __$$AddQtyImplCopyWithImpl(
      _$AddQtyImpl _value, $Res Function(_$AddQtyImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentItem = null,
  }) {
    return _then(_$AddQtyImpl(
      currentItem: null == currentItem
          ? _value.currentItem
          : currentItem // ignore: cast_nullable_to_non_nullable
              as OrderItem,
    ));
  }
}

/// @nodoc

class _$AddQtyImpl implements AddQty {
  const _$AddQtyImpl({required this.currentItem});

  @override
  final OrderItem currentItem;

  @override
  String toString() {
    return 'OrderDetailsEvent.addQty(currentItem: $currentItem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddQtyImpl &&
            (identical(other.currentItem, currentItem) ||
                other.currentItem == currentItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentItem);

  /// Create a copy of OrderDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddQtyImplCopyWith<_$AddQtyImpl> get copyWith =>
      __$$AddQtyImplCopyWithImpl<_$AddQtyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String orderNo) orderItems,
    required TResult Function(OrderItem currentItem) addQty,
    required TResult Function(OrderItem currentItem) cancelQty,
  }) {
    return addQty(currentItem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String orderNo)? orderItems,
    TResult? Function(OrderItem currentItem)? addQty,
    TResult? Function(OrderItem currentItem)? cancelQty,
  }) {
    return addQty?.call(currentItem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orderNo)? orderItems,
    TResult Function(OrderItem currentItem)? addQty,
    TResult Function(OrderItem currentItem)? cancelQty,
    required TResult orElse(),
  }) {
    if (addQty != null) {
      return addQty(currentItem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderDetails value) orderItems,
    required TResult Function(AddQty value) addQty,
    required TResult Function(CancelQty value) cancelQty,
  }) {
    return addQty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderDetails value)? orderItems,
    TResult? Function(AddQty value)? addQty,
    TResult? Function(CancelQty value)? cancelQty,
  }) {
    return addQty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderDetails value)? orderItems,
    TResult Function(AddQty value)? addQty,
    TResult Function(CancelQty value)? cancelQty,
    required TResult orElse(),
  }) {
    if (addQty != null) {
      return addQty(this);
    }
    return orElse();
  }
}

abstract class AddQty implements OrderDetailsEvent {
  const factory AddQty({required final OrderItem currentItem}) = _$AddQtyImpl;

  OrderItem get currentItem;

  /// Create a copy of OrderDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddQtyImplCopyWith<_$AddQtyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelQtyImplCopyWith<$Res> {
  factory _$$CancelQtyImplCopyWith(
          _$CancelQtyImpl value, $Res Function(_$CancelQtyImpl) then) =
      __$$CancelQtyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OrderItem currentItem});
}

/// @nodoc
class __$$CancelQtyImplCopyWithImpl<$Res>
    extends _$OrderDetailsEventCopyWithImpl<$Res, _$CancelQtyImpl>
    implements _$$CancelQtyImplCopyWith<$Res> {
  __$$CancelQtyImplCopyWithImpl(
      _$CancelQtyImpl _value, $Res Function(_$CancelQtyImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentItem = null,
  }) {
    return _then(_$CancelQtyImpl(
      currentItem: null == currentItem
          ? _value.currentItem
          : currentItem // ignore: cast_nullable_to_non_nullable
              as OrderItem,
    ));
  }
}

/// @nodoc

class _$CancelQtyImpl implements CancelQty {
  const _$CancelQtyImpl({required this.currentItem});

  @override
  final OrderItem currentItem;

  @override
  String toString() {
    return 'OrderDetailsEvent.cancelQty(currentItem: $currentItem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelQtyImpl &&
            (identical(other.currentItem, currentItem) ||
                other.currentItem == currentItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentItem);

  /// Create a copy of OrderDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelQtyImplCopyWith<_$CancelQtyImpl> get copyWith =>
      __$$CancelQtyImplCopyWithImpl<_$CancelQtyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String orderNo) orderItems,
    required TResult Function(OrderItem currentItem) addQty,
    required TResult Function(OrderItem currentItem) cancelQty,
  }) {
    return cancelQty(currentItem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String orderNo)? orderItems,
    TResult? Function(OrderItem currentItem)? addQty,
    TResult? Function(OrderItem currentItem)? cancelQty,
  }) {
    return cancelQty?.call(currentItem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orderNo)? orderItems,
    TResult Function(OrderItem currentItem)? addQty,
    TResult Function(OrderItem currentItem)? cancelQty,
    required TResult orElse(),
  }) {
    if (cancelQty != null) {
      return cancelQty(currentItem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderDetails value) orderItems,
    required TResult Function(AddQty value) addQty,
    required TResult Function(CancelQty value) cancelQty,
  }) {
    return cancelQty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderDetails value)? orderItems,
    TResult? Function(AddQty value)? addQty,
    TResult? Function(CancelQty value)? cancelQty,
  }) {
    return cancelQty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderDetails value)? orderItems,
    TResult Function(AddQty value)? addQty,
    TResult Function(CancelQty value)? cancelQty,
    required TResult orElse(),
  }) {
    if (cancelQty != null) {
      return cancelQty(this);
    }
    return orElse();
  }
}

abstract class CancelQty implements OrderDetailsEvent {
  const factory CancelQty({required final OrderItem currentItem}) =
      _$CancelQtyImpl;

  OrderItem get currentItem;

  /// Create a copy of OrderDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancelQtyImplCopyWith<_$CancelQtyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrderDetailsState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<OrderItem> get orderitems => throw _privateConstructorUsedError;
  List<OrderItem> get toAddItems => throw _privateConstructorUsedError;
  List<OrderItem> get toCancelItems => throw _privateConstructorUsedError;

  /// Create a copy of OrderDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderDetailsStateCopyWith<OrderDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailsStateCopyWith<$Res> {
  factory $OrderDetailsStateCopyWith(
          OrderDetailsState value, $Res Function(OrderDetailsState) then) =
      _$OrderDetailsStateCopyWithImpl<$Res, OrderDetailsState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<OrderItem> orderitems,
      List<OrderItem> toAddItems,
      List<OrderItem> toCancelItems});
}

/// @nodoc
class _$OrderDetailsStateCopyWithImpl<$Res, $Val extends OrderDetailsState>
    implements $OrderDetailsStateCopyWith<$Res> {
  _$OrderDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? orderitems = null,
    Object? toAddItems = null,
    Object? toCancelItems = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      orderitems: null == orderitems
          ? _value.orderitems
          : orderitems // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      toAddItems: null == toAddItems
          ? _value.toAddItems
          : toAddItems // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      toCancelItems: null == toCancelItems
          ? _value.toCancelItems
          : toCancelItems // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderDetailsStateImplCopyWith<$Res>
    implements $OrderDetailsStateCopyWith<$Res> {
  factory _$$OrderDetailsStateImplCopyWith(_$OrderDetailsStateImpl value,
          $Res Function(_$OrderDetailsStateImpl) then) =
      __$$OrderDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<OrderItem> orderitems,
      List<OrderItem> toAddItems,
      List<OrderItem> toCancelItems});
}

/// @nodoc
class __$$OrderDetailsStateImplCopyWithImpl<$Res>
    extends _$OrderDetailsStateCopyWithImpl<$Res, _$OrderDetailsStateImpl>
    implements _$$OrderDetailsStateImplCopyWith<$Res> {
  __$$OrderDetailsStateImplCopyWithImpl(_$OrderDetailsStateImpl _value,
      $Res Function(_$OrderDetailsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? orderitems = null,
    Object? toAddItems = null,
    Object? toCancelItems = null,
  }) {
    return _then(_$OrderDetailsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      orderitems: null == orderitems
          ? _value._orderitems
          : orderitems // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      toAddItems: null == toAddItems
          ? _value._toAddItems
          : toAddItems // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      toCancelItems: null == toCancelItems
          ? _value._toCancelItems
          : toCancelItems // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
    ));
  }
}

/// @nodoc

class _$OrderDetailsStateImpl implements _OrderDetailsState {
  _$OrderDetailsStateImpl(
      {required this.isLoading,
      required final List<OrderItem> orderitems,
      required final List<OrderItem> toAddItems,
      required final List<OrderItem> toCancelItems})
      : _orderitems = orderitems,
        _toAddItems = toAddItems,
        _toCancelItems = toCancelItems;

  @override
  final bool isLoading;
  final List<OrderItem> _orderitems;
  @override
  List<OrderItem> get orderitems {
    if (_orderitems is EqualUnmodifiableListView) return _orderitems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderitems);
  }

  final List<OrderItem> _toAddItems;
  @override
  List<OrderItem> get toAddItems {
    if (_toAddItems is EqualUnmodifiableListView) return _toAddItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_toAddItems);
  }

  final List<OrderItem> _toCancelItems;
  @override
  List<OrderItem> get toCancelItems {
    if (_toCancelItems is EqualUnmodifiableListView) return _toCancelItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_toCancelItems);
  }

  @override
  String toString() {
    return 'OrderDetailsState(isLoading: $isLoading, orderitems: $orderitems, toAddItems: $toAddItems, toCancelItems: $toCancelItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDetailsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._orderitems, _orderitems) &&
            const DeepCollectionEquality()
                .equals(other._toAddItems, _toAddItems) &&
            const DeepCollectionEquality()
                .equals(other._toCancelItems, _toCancelItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_orderitems),
      const DeepCollectionEquality().hash(_toAddItems),
      const DeepCollectionEquality().hash(_toCancelItems));

  /// Create a copy of OrderDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDetailsStateImplCopyWith<_$OrderDetailsStateImpl> get copyWith =>
      __$$OrderDetailsStateImplCopyWithImpl<_$OrderDetailsStateImpl>(
          this, _$identity);
}

abstract class _OrderDetailsState implements OrderDetailsState {
  factory _OrderDetailsState(
      {required final bool isLoading,
      required final List<OrderItem> orderitems,
      required final List<OrderItem> toAddItems,
      required final List<OrderItem> toCancelItems}) = _$OrderDetailsStateImpl;

  @override
  bool get isLoading;
  @override
  List<OrderItem> get orderitems;
  @override
  List<OrderItem> get toAddItems;
  @override
  List<OrderItem> get toCancelItems;

  /// Create a copy of OrderDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderDetailsStateImplCopyWith<_$OrderDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
