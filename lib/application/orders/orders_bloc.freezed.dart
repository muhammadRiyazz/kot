// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrdersEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() allorders,
    required TResult Function(String tableNo) tableOrders,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? allorders,
    TResult? Function(String tableNo)? tableOrders,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? allorders,
    TResult Function(String tableNo)? tableOrders,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AllOrders value) allorders,
    required TResult Function(TableOrders value) tableOrders,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AllOrders value)? allorders,
    TResult? Function(TableOrders value)? tableOrders,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AllOrders value)? allorders,
    TResult Function(TableOrders value)? tableOrders,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersEventCopyWith<$Res> {
  factory $OrdersEventCopyWith(
          OrdersEvent value, $Res Function(OrdersEvent) then) =
      _$OrdersEventCopyWithImpl<$Res, OrdersEvent>;
}

/// @nodoc
class _$OrdersEventCopyWithImpl<$Res, $Val extends OrdersEvent>
    implements $OrdersEventCopyWith<$Res> {
  _$OrdersEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AllOrdersImplCopyWith<$Res> {
  factory _$$AllOrdersImplCopyWith(
          _$AllOrdersImpl value, $Res Function(_$AllOrdersImpl) then) =
      __$$AllOrdersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AllOrdersImplCopyWithImpl<$Res>
    extends _$OrdersEventCopyWithImpl<$Res, _$AllOrdersImpl>
    implements _$$AllOrdersImplCopyWith<$Res> {
  __$$AllOrdersImplCopyWithImpl(
      _$AllOrdersImpl _value, $Res Function(_$AllOrdersImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AllOrdersImpl implements AllOrders {
  const _$AllOrdersImpl();

  @override
  String toString() {
    return 'OrdersEvent.allorders()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AllOrdersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() allorders,
    required TResult Function(String tableNo) tableOrders,
  }) {
    return allorders();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? allorders,
    TResult? Function(String tableNo)? tableOrders,
  }) {
    return allorders?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? allorders,
    TResult Function(String tableNo)? tableOrders,
    required TResult orElse(),
  }) {
    if (allorders != null) {
      return allorders();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AllOrders value) allorders,
    required TResult Function(TableOrders value) tableOrders,
  }) {
    return allorders(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AllOrders value)? allorders,
    TResult? Function(TableOrders value)? tableOrders,
  }) {
    return allorders?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AllOrders value)? allorders,
    TResult Function(TableOrders value)? tableOrders,
    required TResult orElse(),
  }) {
    if (allorders != null) {
      return allorders(this);
    }
    return orElse();
  }
}

abstract class AllOrders implements OrdersEvent {
  const factory AllOrders() = _$AllOrdersImpl;
}

/// @nodoc
abstract class _$$TableOrdersImplCopyWith<$Res> {
  factory _$$TableOrdersImplCopyWith(
          _$TableOrdersImpl value, $Res Function(_$TableOrdersImpl) then) =
      __$$TableOrdersImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String tableNo});
}

/// @nodoc
class __$$TableOrdersImplCopyWithImpl<$Res>
    extends _$OrdersEventCopyWithImpl<$Res, _$TableOrdersImpl>
    implements _$$TableOrdersImplCopyWith<$Res> {
  __$$TableOrdersImplCopyWithImpl(
      _$TableOrdersImpl _value, $Res Function(_$TableOrdersImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableNo = null,
  }) {
    return _then(_$TableOrdersImpl(
      tableNo: null == tableNo
          ? _value.tableNo
          : tableNo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TableOrdersImpl implements TableOrders {
  const _$TableOrdersImpl({required this.tableNo});

  @override
  final String tableNo;

  @override
  String toString() {
    return 'OrdersEvent.tableOrders(tableNo: $tableNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableOrdersImpl &&
            (identical(other.tableNo, tableNo) || other.tableNo == tableNo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tableNo);

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TableOrdersImplCopyWith<_$TableOrdersImpl> get copyWith =>
      __$$TableOrdersImplCopyWithImpl<_$TableOrdersImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() allorders,
    required TResult Function(String tableNo) tableOrders,
  }) {
    return tableOrders(tableNo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? allorders,
    TResult? Function(String tableNo)? tableOrders,
  }) {
    return tableOrders?.call(tableNo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? allorders,
    TResult Function(String tableNo)? tableOrders,
    required TResult orElse(),
  }) {
    if (tableOrders != null) {
      return tableOrders(tableNo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AllOrders value) allorders,
    required TResult Function(TableOrders value) tableOrders,
  }) {
    return tableOrders(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AllOrders value)? allorders,
    TResult? Function(TableOrders value)? tableOrders,
  }) {
    return tableOrders?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AllOrders value)? allorders,
    TResult Function(TableOrders value)? tableOrders,
    required TResult orElse(),
  }) {
    if (tableOrders != null) {
      return tableOrders(this);
    }
    return orElse();
  }
}

abstract class TableOrders implements OrdersEvent {
  const factory TableOrders({required final String tableNo}) =
      _$TableOrdersImpl;

  String get tableNo;

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TableOrdersImplCopyWith<_$TableOrdersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrdersState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Order> get tableOrders => throw _privateConstructorUsedError;
  List<Order> get orders => throw _privateConstructorUsedError;

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrdersStateCopyWith<OrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersStateCopyWith<$Res> {
  factory $OrdersStateCopyWith(
          OrdersState value, $Res Function(OrdersState) then) =
      _$OrdersStateCopyWithImpl<$Res, OrdersState>;
  @useResult
  $Res call({bool isLoading, List<Order> tableOrders, List<Order> orders});
}

/// @nodoc
class _$OrdersStateCopyWithImpl<$Res, $Val extends OrdersState>
    implements $OrdersStateCopyWith<$Res> {
  _$OrdersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? tableOrders = null,
    Object? orders = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      tableOrders: null == tableOrders
          ? _value.tableOrders
          : tableOrders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrdersStateImplCopyWith<$Res>
    implements $OrdersStateCopyWith<$Res> {
  factory _$$OrdersStateImplCopyWith(
          _$OrdersStateImpl value, $Res Function(_$OrdersStateImpl) then) =
      __$$OrdersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<Order> tableOrders, List<Order> orders});
}

/// @nodoc
class __$$OrdersStateImplCopyWithImpl<$Res>
    extends _$OrdersStateCopyWithImpl<$Res, _$OrdersStateImpl>
    implements _$$OrdersStateImplCopyWith<$Res> {
  __$$OrdersStateImplCopyWithImpl(
      _$OrdersStateImpl _value, $Res Function(_$OrdersStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? tableOrders = null,
    Object? orders = null,
  }) {
    return _then(_$OrdersStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      tableOrders: null == tableOrders
          ? _value._tableOrders
          : tableOrders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
    ));
  }
}

/// @nodoc

class _$OrdersStateImpl implements _OrdersState {
  _$OrdersStateImpl(
      {required this.isLoading,
      required final List<Order> tableOrders,
      required final List<Order> orders})
      : _tableOrders = tableOrders,
        _orders = orders;

  @override
  final bool isLoading;
  final List<Order> _tableOrders;
  @override
  List<Order> get tableOrders {
    if (_tableOrders is EqualUnmodifiableListView) return _tableOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tableOrders);
  }

  final List<Order> _orders;
  @override
  List<Order> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  String toString() {
    return 'OrdersState(isLoading: $isLoading, tableOrders: $tableOrders, orders: $orders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrdersStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._tableOrders, _tableOrders) &&
            const DeepCollectionEquality().equals(other._orders, _orders));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_tableOrders),
      const DeepCollectionEquality().hash(_orders));

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrdersStateImplCopyWith<_$OrdersStateImpl> get copyWith =>
      __$$OrdersStateImplCopyWithImpl<_$OrdersStateImpl>(this, _$identity);
}

abstract class _OrdersState implements OrdersState {
  factory _OrdersState(
      {required final bool isLoading,
      required final List<Order> tableOrders,
      required final List<Order> orders}) = _$OrdersStateImpl;

  @override
  bool get isLoading;
  @override
  List<Order> get tableOrders;
  @override
  List<Order> get orders;

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrdersStateImplCopyWith<_$OrdersStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
