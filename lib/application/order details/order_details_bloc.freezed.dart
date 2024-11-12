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
    required TResult Function(String currentItemid) addQty,
    required TResult Function(String currentItemid) cancelQty,
    required TResult Function() clearItemSelection,
    required TResult Function(String from, KitchenItem item) itemAction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String orderNo)? orderItems,
    TResult? Function(String currentItemid)? addQty,
    TResult? Function(String currentItemid)? cancelQty,
    TResult? Function()? clearItemSelection,
    TResult? Function(String from, KitchenItem item)? itemAction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orderNo)? orderItems,
    TResult Function(String currentItemid)? addQty,
    TResult Function(String currentItemid)? cancelQty,
    TResult Function()? clearItemSelection,
    TResult Function(String from, KitchenItem item)? itemAction,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderDetails value) orderItems,
    required TResult Function(AddQty value) addQty,
    required TResult Function(CancelQty value) cancelQty,
    required TResult Function(ClearItemSelection value) clearItemSelection,
    required TResult Function(ItemAction value) itemAction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderDetails value)? orderItems,
    TResult? Function(AddQty value)? addQty,
    TResult? Function(CancelQty value)? cancelQty,
    TResult? Function(ClearItemSelection value)? clearItemSelection,
    TResult? Function(ItemAction value)? itemAction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderDetails value)? orderItems,
    TResult Function(AddQty value)? addQty,
    TResult Function(CancelQty value)? cancelQty,
    TResult Function(ClearItemSelection value)? clearItemSelection,
    TResult Function(ItemAction value)? itemAction,
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
    required TResult Function(String currentItemid) addQty,
    required TResult Function(String currentItemid) cancelQty,
    required TResult Function() clearItemSelection,
    required TResult Function(String from, KitchenItem item) itemAction,
  }) {
    return orderItems(orderNo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String orderNo)? orderItems,
    TResult? Function(String currentItemid)? addQty,
    TResult? Function(String currentItemid)? cancelQty,
    TResult? Function()? clearItemSelection,
    TResult? Function(String from, KitchenItem item)? itemAction,
  }) {
    return orderItems?.call(orderNo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orderNo)? orderItems,
    TResult Function(String currentItemid)? addQty,
    TResult Function(String currentItemid)? cancelQty,
    TResult Function()? clearItemSelection,
    TResult Function(String from, KitchenItem item)? itemAction,
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
    required TResult Function(ClearItemSelection value) clearItemSelection,
    required TResult Function(ItemAction value) itemAction,
  }) {
    return orderItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderDetails value)? orderItems,
    TResult? Function(AddQty value)? addQty,
    TResult? Function(CancelQty value)? cancelQty,
    TResult? Function(ClearItemSelection value)? clearItemSelection,
    TResult? Function(ItemAction value)? itemAction,
  }) {
    return orderItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderDetails value)? orderItems,
    TResult Function(AddQty value)? addQty,
    TResult Function(CancelQty value)? cancelQty,
    TResult Function(ClearItemSelection value)? clearItemSelection,
    TResult Function(ItemAction value)? itemAction,
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
  $Res call({String currentItemid});
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
    Object? currentItemid = null,
  }) {
    return _then(_$AddQtyImpl(
      currentItemid: null == currentItemid
          ? _value.currentItemid
          : currentItemid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddQtyImpl implements AddQty {
  const _$AddQtyImpl({required this.currentItemid});

  @override
  final String currentItemid;

  @override
  String toString() {
    return 'OrderDetailsEvent.addQty(currentItemid: $currentItemid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddQtyImpl &&
            (identical(other.currentItemid, currentItemid) ||
                other.currentItemid == currentItemid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentItemid);

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
    required TResult Function(String currentItemid) addQty,
    required TResult Function(String currentItemid) cancelQty,
    required TResult Function() clearItemSelection,
    required TResult Function(String from, KitchenItem item) itemAction,
  }) {
    return addQty(currentItemid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String orderNo)? orderItems,
    TResult? Function(String currentItemid)? addQty,
    TResult? Function(String currentItemid)? cancelQty,
    TResult? Function()? clearItemSelection,
    TResult? Function(String from, KitchenItem item)? itemAction,
  }) {
    return addQty?.call(currentItemid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orderNo)? orderItems,
    TResult Function(String currentItemid)? addQty,
    TResult Function(String currentItemid)? cancelQty,
    TResult Function()? clearItemSelection,
    TResult Function(String from, KitchenItem item)? itemAction,
    required TResult orElse(),
  }) {
    if (addQty != null) {
      return addQty(currentItemid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderDetails value) orderItems,
    required TResult Function(AddQty value) addQty,
    required TResult Function(CancelQty value) cancelQty,
    required TResult Function(ClearItemSelection value) clearItemSelection,
    required TResult Function(ItemAction value) itemAction,
  }) {
    return addQty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderDetails value)? orderItems,
    TResult? Function(AddQty value)? addQty,
    TResult? Function(CancelQty value)? cancelQty,
    TResult? Function(ClearItemSelection value)? clearItemSelection,
    TResult? Function(ItemAction value)? itemAction,
  }) {
    return addQty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderDetails value)? orderItems,
    TResult Function(AddQty value)? addQty,
    TResult Function(CancelQty value)? cancelQty,
    TResult Function(ClearItemSelection value)? clearItemSelection,
    TResult Function(ItemAction value)? itemAction,
    required TResult orElse(),
  }) {
    if (addQty != null) {
      return addQty(this);
    }
    return orElse();
  }
}

abstract class AddQty implements OrderDetailsEvent {
  const factory AddQty({required final String currentItemid}) = _$AddQtyImpl;

  String get currentItemid;

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
  $Res call({String currentItemid});
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
    Object? currentItemid = null,
  }) {
    return _then(_$CancelQtyImpl(
      currentItemid: null == currentItemid
          ? _value.currentItemid
          : currentItemid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CancelQtyImpl implements CancelQty {
  const _$CancelQtyImpl({required this.currentItemid});

  @override
  final String currentItemid;

  @override
  String toString() {
    return 'OrderDetailsEvent.cancelQty(currentItemid: $currentItemid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelQtyImpl &&
            (identical(other.currentItemid, currentItemid) ||
                other.currentItemid == currentItemid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentItemid);

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
    required TResult Function(String currentItemid) addQty,
    required TResult Function(String currentItemid) cancelQty,
    required TResult Function() clearItemSelection,
    required TResult Function(String from, KitchenItem item) itemAction,
  }) {
    return cancelQty(currentItemid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String orderNo)? orderItems,
    TResult? Function(String currentItemid)? addQty,
    TResult? Function(String currentItemid)? cancelQty,
    TResult? Function()? clearItemSelection,
    TResult? Function(String from, KitchenItem item)? itemAction,
  }) {
    return cancelQty?.call(currentItemid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orderNo)? orderItems,
    TResult Function(String currentItemid)? addQty,
    TResult Function(String currentItemid)? cancelQty,
    TResult Function()? clearItemSelection,
    TResult Function(String from, KitchenItem item)? itemAction,
    required TResult orElse(),
  }) {
    if (cancelQty != null) {
      return cancelQty(currentItemid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderDetails value) orderItems,
    required TResult Function(AddQty value) addQty,
    required TResult Function(CancelQty value) cancelQty,
    required TResult Function(ClearItemSelection value) clearItemSelection,
    required TResult Function(ItemAction value) itemAction,
  }) {
    return cancelQty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderDetails value)? orderItems,
    TResult? Function(AddQty value)? addQty,
    TResult? Function(CancelQty value)? cancelQty,
    TResult? Function(ClearItemSelection value)? clearItemSelection,
    TResult? Function(ItemAction value)? itemAction,
  }) {
    return cancelQty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderDetails value)? orderItems,
    TResult Function(AddQty value)? addQty,
    TResult Function(CancelQty value)? cancelQty,
    TResult Function(ClearItemSelection value)? clearItemSelection,
    TResult Function(ItemAction value)? itemAction,
    required TResult orElse(),
  }) {
    if (cancelQty != null) {
      return cancelQty(this);
    }
    return orElse();
  }
}

abstract class CancelQty implements OrderDetailsEvent {
  const factory CancelQty({required final String currentItemid}) =
      _$CancelQtyImpl;

  String get currentItemid;

  /// Create a copy of OrderDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancelQtyImplCopyWith<_$CancelQtyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearItemSelectionImplCopyWith<$Res> {
  factory _$$ClearItemSelectionImplCopyWith(_$ClearItemSelectionImpl value,
          $Res Function(_$ClearItemSelectionImpl) then) =
      __$$ClearItemSelectionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearItemSelectionImplCopyWithImpl<$Res>
    extends _$OrderDetailsEventCopyWithImpl<$Res, _$ClearItemSelectionImpl>
    implements _$$ClearItemSelectionImplCopyWith<$Res> {
  __$$ClearItemSelectionImplCopyWithImpl(_$ClearItemSelectionImpl _value,
      $Res Function(_$ClearItemSelectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearItemSelectionImpl implements ClearItemSelection {
  const _$ClearItemSelectionImpl();

  @override
  String toString() {
    return 'OrderDetailsEvent.clearItemSelection()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearItemSelectionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String orderNo) orderItems,
    required TResult Function(String currentItemid) addQty,
    required TResult Function(String currentItemid) cancelQty,
    required TResult Function() clearItemSelection,
    required TResult Function(String from, KitchenItem item) itemAction,
  }) {
    return clearItemSelection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String orderNo)? orderItems,
    TResult? Function(String currentItemid)? addQty,
    TResult? Function(String currentItemid)? cancelQty,
    TResult? Function()? clearItemSelection,
    TResult? Function(String from, KitchenItem item)? itemAction,
  }) {
    return clearItemSelection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orderNo)? orderItems,
    TResult Function(String currentItemid)? addQty,
    TResult Function(String currentItemid)? cancelQty,
    TResult Function()? clearItemSelection,
    TResult Function(String from, KitchenItem item)? itemAction,
    required TResult orElse(),
  }) {
    if (clearItemSelection != null) {
      return clearItemSelection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderDetails value) orderItems,
    required TResult Function(AddQty value) addQty,
    required TResult Function(CancelQty value) cancelQty,
    required TResult Function(ClearItemSelection value) clearItemSelection,
    required TResult Function(ItemAction value) itemAction,
  }) {
    return clearItemSelection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderDetails value)? orderItems,
    TResult? Function(AddQty value)? addQty,
    TResult? Function(CancelQty value)? cancelQty,
    TResult? Function(ClearItemSelection value)? clearItemSelection,
    TResult? Function(ItemAction value)? itemAction,
  }) {
    return clearItemSelection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderDetails value)? orderItems,
    TResult Function(AddQty value)? addQty,
    TResult Function(CancelQty value)? cancelQty,
    TResult Function(ClearItemSelection value)? clearItemSelection,
    TResult Function(ItemAction value)? itemAction,
    required TResult orElse(),
  }) {
    if (clearItemSelection != null) {
      return clearItemSelection(this);
    }
    return orElse();
  }
}

abstract class ClearItemSelection implements OrderDetailsEvent {
  const factory ClearItemSelection() = _$ClearItemSelectionImpl;
}

/// @nodoc
abstract class _$$ItemActionImplCopyWith<$Res> {
  factory _$$ItemActionImplCopyWith(
          _$ItemActionImpl value, $Res Function(_$ItemActionImpl) then) =
      __$$ItemActionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String from, KitchenItem item});
}

/// @nodoc
class __$$ItemActionImplCopyWithImpl<$Res>
    extends _$OrderDetailsEventCopyWithImpl<$Res, _$ItemActionImpl>
    implements _$$ItemActionImplCopyWith<$Res> {
  __$$ItemActionImplCopyWithImpl(
      _$ItemActionImpl _value, $Res Function(_$ItemActionImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderDetailsEvent
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
              as KitchenItem,
    ));
  }
}

/// @nodoc

class _$ItemActionImpl implements ItemAction {
  const _$ItemActionImpl({required this.from, required this.item});

  @override
  final String from;
  @override
  final KitchenItem item;

  @override
  String toString() {
    return 'OrderDetailsEvent.itemAction(from: $from, item: $item)';
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

  /// Create a copy of OrderDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemActionImplCopyWith<_$ItemActionImpl> get copyWith =>
      __$$ItemActionImplCopyWithImpl<_$ItemActionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String orderNo) orderItems,
    required TResult Function(String currentItemid) addQty,
    required TResult Function(String currentItemid) cancelQty,
    required TResult Function() clearItemSelection,
    required TResult Function(String from, KitchenItem item) itemAction,
  }) {
    return itemAction(from, item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String orderNo)? orderItems,
    TResult? Function(String currentItemid)? addQty,
    TResult? Function(String currentItemid)? cancelQty,
    TResult? Function()? clearItemSelection,
    TResult? Function(String from, KitchenItem item)? itemAction,
  }) {
    return itemAction?.call(from, item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orderNo)? orderItems,
    TResult Function(String currentItemid)? addQty,
    TResult Function(String currentItemid)? cancelQty,
    TResult Function()? clearItemSelection,
    TResult Function(String from, KitchenItem item)? itemAction,
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
    required TResult Function(OrderDetails value) orderItems,
    required TResult Function(AddQty value) addQty,
    required TResult Function(CancelQty value) cancelQty,
    required TResult Function(ClearItemSelection value) clearItemSelection,
    required TResult Function(ItemAction value) itemAction,
  }) {
    return itemAction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderDetails value)? orderItems,
    TResult? Function(AddQty value)? addQty,
    TResult? Function(CancelQty value)? cancelQty,
    TResult? Function(ClearItemSelection value)? clearItemSelection,
    TResult? Function(ItemAction value)? itemAction,
  }) {
    return itemAction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderDetails value)? orderItems,
    TResult Function(AddQty value)? addQty,
    TResult Function(CancelQty value)? cancelQty,
    TResult Function(ClearItemSelection value)? clearItemSelection,
    TResult Function(ItemAction value)? itemAction,
    required TResult orElse(),
  }) {
    if (itemAction != null) {
      return itemAction(this);
    }
    return orElse();
  }
}

abstract class ItemAction implements OrderDetailsEvent {
  const factory ItemAction(
      {required final String from,
      required final KitchenItem item}) = _$ItemActionImpl;

  String get from;
  KitchenItem get item;

  /// Create a copy of OrderDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemActionImplCopyWith<_$ItemActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrderDetailsState {
  bool get isLoading =>
      throw _privateConstructorUsedError; // required      List<OrderItem> orderitems,
  List<KitchenItem> get toAddItems => throw _privateConstructorUsedError;
  List<KitchenItem> get toCancelItems => throw _privateConstructorUsedError;
  List<KitchenItem> get orderitems => throw _privateConstructorUsedError;

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
      List<KitchenItem> toAddItems,
      List<KitchenItem> toCancelItems,
      List<KitchenItem> orderitems});
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
    Object? toAddItems = null,
    Object? toCancelItems = null,
    Object? orderitems = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      toAddItems: null == toAddItems
          ? _value.toAddItems
          : toAddItems // ignore: cast_nullable_to_non_nullable
              as List<KitchenItem>,
      toCancelItems: null == toCancelItems
          ? _value.toCancelItems
          : toCancelItems // ignore: cast_nullable_to_non_nullable
              as List<KitchenItem>,
      orderitems: null == orderitems
          ? _value.orderitems
          : orderitems // ignore: cast_nullable_to_non_nullable
              as List<KitchenItem>,
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
      List<KitchenItem> toAddItems,
      List<KitchenItem> toCancelItems,
      List<KitchenItem> orderitems});
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
    Object? toAddItems = null,
    Object? toCancelItems = null,
    Object? orderitems = null,
  }) {
    return _then(_$OrderDetailsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      toAddItems: null == toAddItems
          ? _value._toAddItems
          : toAddItems // ignore: cast_nullable_to_non_nullable
              as List<KitchenItem>,
      toCancelItems: null == toCancelItems
          ? _value._toCancelItems
          : toCancelItems // ignore: cast_nullable_to_non_nullable
              as List<KitchenItem>,
      orderitems: null == orderitems
          ? _value._orderitems
          : orderitems // ignore: cast_nullable_to_non_nullable
              as List<KitchenItem>,
    ));
  }
}

/// @nodoc

class _$OrderDetailsStateImpl implements _OrderDetailsState {
  _$OrderDetailsStateImpl(
      {required this.isLoading,
      required final List<KitchenItem> toAddItems,
      required final List<KitchenItem> toCancelItems,
      required final List<KitchenItem> orderitems})
      : _toAddItems = toAddItems,
        _toCancelItems = toCancelItems,
        _orderitems = orderitems;

  @override
  final bool isLoading;
// required      List<OrderItem> orderitems,
  final List<KitchenItem> _toAddItems;
// required      List<OrderItem> orderitems,
  @override
  List<KitchenItem> get toAddItems {
    if (_toAddItems is EqualUnmodifiableListView) return _toAddItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_toAddItems);
  }

  final List<KitchenItem> _toCancelItems;
  @override
  List<KitchenItem> get toCancelItems {
    if (_toCancelItems is EqualUnmodifiableListView) return _toCancelItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_toCancelItems);
  }

  final List<KitchenItem> _orderitems;
  @override
  List<KitchenItem> get orderitems {
    if (_orderitems is EqualUnmodifiableListView) return _orderitems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderitems);
  }

  @override
  String toString() {
    return 'OrderDetailsState(isLoading: $isLoading, toAddItems: $toAddItems, toCancelItems: $toCancelItems, orderitems: $orderitems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDetailsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._toAddItems, _toAddItems) &&
            const DeepCollectionEquality()
                .equals(other._toCancelItems, _toCancelItems) &&
            const DeepCollectionEquality()
                .equals(other._orderitems, _orderitems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_toAddItems),
      const DeepCollectionEquality().hash(_toCancelItems),
      const DeepCollectionEquality().hash(_orderitems));

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
      required final List<KitchenItem> toAddItems,
      required final List<KitchenItem> toCancelItems,
      required final List<KitchenItem> orderitems}) = _$OrderDetailsStateImpl;

  @override
  bool get isLoading; // required      List<OrderItem> orderitems,
  @override
  List<KitchenItem> get toAddItems;
  @override
  List<KitchenItem> get toCancelItems;
  @override
  List<KitchenItem> get orderitems;

  /// Create a copy of OrderDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderDetailsStateImplCopyWith<_$OrderDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
