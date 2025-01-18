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
    required TResult Function() clearitem,
    required TResult Function(Order item) longpress,
    required TResult Function(Order item) ontap,
    required TResult Function() mergeAndprint,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? allorders,
    TResult? Function(String tableNo)? tableOrders,
    TResult? Function()? clearitem,
    TResult? Function(Order item)? longpress,
    TResult? Function(Order item)? ontap,
    TResult? Function()? mergeAndprint,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? allorders,
    TResult Function(String tableNo)? tableOrders,
    TResult Function()? clearitem,
    TResult Function(Order item)? longpress,
    TResult Function(Order item)? ontap,
    TResult Function()? mergeAndprint,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AllOrders value) allorders,
    required TResult Function(TableOrders value) tableOrders,
    required TResult Function(Clearitem value) clearitem,
    required TResult Function(Longpress value) longpress,
    required TResult Function(Ontap value) ontap,
    required TResult Function(MergeAndPrint value) mergeAndprint,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AllOrders value)? allorders,
    TResult? Function(TableOrders value)? tableOrders,
    TResult? Function(Clearitem value)? clearitem,
    TResult? Function(Longpress value)? longpress,
    TResult? Function(Ontap value)? ontap,
    TResult? Function(MergeAndPrint value)? mergeAndprint,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AllOrders value)? allorders,
    TResult Function(TableOrders value)? tableOrders,
    TResult Function(Clearitem value)? clearitem,
    TResult Function(Longpress value)? longpress,
    TResult Function(Ontap value)? ontap,
    TResult Function(MergeAndPrint value)? mergeAndprint,
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
    required TResult Function() clearitem,
    required TResult Function(Order item) longpress,
    required TResult Function(Order item) ontap,
    required TResult Function() mergeAndprint,
  }) {
    return allorders();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? allorders,
    TResult? Function(String tableNo)? tableOrders,
    TResult? Function()? clearitem,
    TResult? Function(Order item)? longpress,
    TResult? Function(Order item)? ontap,
    TResult? Function()? mergeAndprint,
  }) {
    return allorders?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? allorders,
    TResult Function(String tableNo)? tableOrders,
    TResult Function()? clearitem,
    TResult Function(Order item)? longpress,
    TResult Function(Order item)? ontap,
    TResult Function()? mergeAndprint,
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
    required TResult Function(Clearitem value) clearitem,
    required TResult Function(Longpress value) longpress,
    required TResult Function(Ontap value) ontap,
    required TResult Function(MergeAndPrint value) mergeAndprint,
  }) {
    return allorders(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AllOrders value)? allorders,
    TResult? Function(TableOrders value)? tableOrders,
    TResult? Function(Clearitem value)? clearitem,
    TResult? Function(Longpress value)? longpress,
    TResult? Function(Ontap value)? ontap,
    TResult? Function(MergeAndPrint value)? mergeAndprint,
  }) {
    return allorders?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AllOrders value)? allorders,
    TResult Function(TableOrders value)? tableOrders,
    TResult Function(Clearitem value)? clearitem,
    TResult Function(Longpress value)? longpress,
    TResult Function(Ontap value)? ontap,
    TResult Function(MergeAndPrint value)? mergeAndprint,
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
    required TResult Function() clearitem,
    required TResult Function(Order item) longpress,
    required TResult Function(Order item) ontap,
    required TResult Function() mergeAndprint,
  }) {
    return tableOrders(tableNo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? allorders,
    TResult? Function(String tableNo)? tableOrders,
    TResult? Function()? clearitem,
    TResult? Function(Order item)? longpress,
    TResult? Function(Order item)? ontap,
    TResult? Function()? mergeAndprint,
  }) {
    return tableOrders?.call(tableNo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? allorders,
    TResult Function(String tableNo)? tableOrders,
    TResult Function()? clearitem,
    TResult Function(Order item)? longpress,
    TResult Function(Order item)? ontap,
    TResult Function()? mergeAndprint,
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
    required TResult Function(Clearitem value) clearitem,
    required TResult Function(Longpress value) longpress,
    required TResult Function(Ontap value) ontap,
    required TResult Function(MergeAndPrint value) mergeAndprint,
  }) {
    return tableOrders(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AllOrders value)? allorders,
    TResult? Function(TableOrders value)? tableOrders,
    TResult? Function(Clearitem value)? clearitem,
    TResult? Function(Longpress value)? longpress,
    TResult? Function(Ontap value)? ontap,
    TResult? Function(MergeAndPrint value)? mergeAndprint,
  }) {
    return tableOrders?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AllOrders value)? allorders,
    TResult Function(TableOrders value)? tableOrders,
    TResult Function(Clearitem value)? clearitem,
    TResult Function(Longpress value)? longpress,
    TResult Function(Ontap value)? ontap,
    TResult Function(MergeAndPrint value)? mergeAndprint,
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
abstract class _$$ClearitemImplCopyWith<$Res> {
  factory _$$ClearitemImplCopyWith(
          _$ClearitemImpl value, $Res Function(_$ClearitemImpl) then) =
      __$$ClearitemImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearitemImplCopyWithImpl<$Res>
    extends _$OrdersEventCopyWithImpl<$Res, _$ClearitemImpl>
    implements _$$ClearitemImplCopyWith<$Res> {
  __$$ClearitemImplCopyWithImpl(
      _$ClearitemImpl _value, $Res Function(_$ClearitemImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearitemImpl implements Clearitem {
  const _$ClearitemImpl();

  @override
  String toString() {
    return 'OrdersEvent.clearitem()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearitemImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() allorders,
    required TResult Function(String tableNo) tableOrders,
    required TResult Function() clearitem,
    required TResult Function(Order item) longpress,
    required TResult Function(Order item) ontap,
    required TResult Function() mergeAndprint,
  }) {
    return clearitem();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? allorders,
    TResult? Function(String tableNo)? tableOrders,
    TResult? Function()? clearitem,
    TResult? Function(Order item)? longpress,
    TResult? Function(Order item)? ontap,
    TResult? Function()? mergeAndprint,
  }) {
    return clearitem?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? allorders,
    TResult Function(String tableNo)? tableOrders,
    TResult Function()? clearitem,
    TResult Function(Order item)? longpress,
    TResult Function(Order item)? ontap,
    TResult Function()? mergeAndprint,
    required TResult orElse(),
  }) {
    if (clearitem != null) {
      return clearitem();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AllOrders value) allorders,
    required TResult Function(TableOrders value) tableOrders,
    required TResult Function(Clearitem value) clearitem,
    required TResult Function(Longpress value) longpress,
    required TResult Function(Ontap value) ontap,
    required TResult Function(MergeAndPrint value) mergeAndprint,
  }) {
    return clearitem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AllOrders value)? allorders,
    TResult? Function(TableOrders value)? tableOrders,
    TResult? Function(Clearitem value)? clearitem,
    TResult? Function(Longpress value)? longpress,
    TResult? Function(Ontap value)? ontap,
    TResult? Function(MergeAndPrint value)? mergeAndprint,
  }) {
    return clearitem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AllOrders value)? allorders,
    TResult Function(TableOrders value)? tableOrders,
    TResult Function(Clearitem value)? clearitem,
    TResult Function(Longpress value)? longpress,
    TResult Function(Ontap value)? ontap,
    TResult Function(MergeAndPrint value)? mergeAndprint,
    required TResult orElse(),
  }) {
    if (clearitem != null) {
      return clearitem(this);
    }
    return orElse();
  }
}

abstract class Clearitem implements OrdersEvent {
  const factory Clearitem() = _$ClearitemImpl;
}

/// @nodoc
abstract class _$$LongpressImplCopyWith<$Res> {
  factory _$$LongpressImplCopyWith(
          _$LongpressImpl value, $Res Function(_$LongpressImpl) then) =
      __$$LongpressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Order item});
}

/// @nodoc
class __$$LongpressImplCopyWithImpl<$Res>
    extends _$OrdersEventCopyWithImpl<$Res, _$LongpressImpl>
    implements _$$LongpressImplCopyWith<$Res> {
  __$$LongpressImplCopyWithImpl(
      _$LongpressImpl _value, $Res Function(_$LongpressImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$LongpressImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Order,
    ));
  }
}

/// @nodoc

class _$LongpressImpl implements Longpress {
  const _$LongpressImpl({required this.item});

  @override
  final Order item;

  @override
  String toString() {
    return 'OrdersEvent.longpress(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LongpressImpl &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LongpressImplCopyWith<_$LongpressImpl> get copyWith =>
      __$$LongpressImplCopyWithImpl<_$LongpressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() allorders,
    required TResult Function(String tableNo) tableOrders,
    required TResult Function() clearitem,
    required TResult Function(Order item) longpress,
    required TResult Function(Order item) ontap,
    required TResult Function() mergeAndprint,
  }) {
    return longpress(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? allorders,
    TResult? Function(String tableNo)? tableOrders,
    TResult? Function()? clearitem,
    TResult? Function(Order item)? longpress,
    TResult? Function(Order item)? ontap,
    TResult? Function()? mergeAndprint,
  }) {
    return longpress?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? allorders,
    TResult Function(String tableNo)? tableOrders,
    TResult Function()? clearitem,
    TResult Function(Order item)? longpress,
    TResult Function(Order item)? ontap,
    TResult Function()? mergeAndprint,
    required TResult orElse(),
  }) {
    if (longpress != null) {
      return longpress(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AllOrders value) allorders,
    required TResult Function(TableOrders value) tableOrders,
    required TResult Function(Clearitem value) clearitem,
    required TResult Function(Longpress value) longpress,
    required TResult Function(Ontap value) ontap,
    required TResult Function(MergeAndPrint value) mergeAndprint,
  }) {
    return longpress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AllOrders value)? allorders,
    TResult? Function(TableOrders value)? tableOrders,
    TResult? Function(Clearitem value)? clearitem,
    TResult? Function(Longpress value)? longpress,
    TResult? Function(Ontap value)? ontap,
    TResult? Function(MergeAndPrint value)? mergeAndprint,
  }) {
    return longpress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AllOrders value)? allorders,
    TResult Function(TableOrders value)? tableOrders,
    TResult Function(Clearitem value)? clearitem,
    TResult Function(Longpress value)? longpress,
    TResult Function(Ontap value)? ontap,
    TResult Function(MergeAndPrint value)? mergeAndprint,
    required TResult orElse(),
  }) {
    if (longpress != null) {
      return longpress(this);
    }
    return orElse();
  }
}

abstract class Longpress implements OrdersEvent {
  const factory Longpress({required final Order item}) = _$LongpressImpl;

  Order get item;

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LongpressImplCopyWith<_$LongpressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OntapImplCopyWith<$Res> {
  factory _$$OntapImplCopyWith(
          _$OntapImpl value, $Res Function(_$OntapImpl) then) =
      __$$OntapImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Order item});
}

/// @nodoc
class __$$OntapImplCopyWithImpl<$Res>
    extends _$OrdersEventCopyWithImpl<$Res, _$OntapImpl>
    implements _$$OntapImplCopyWith<$Res> {
  __$$OntapImplCopyWithImpl(
      _$OntapImpl _value, $Res Function(_$OntapImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$OntapImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Order,
    ));
  }
}

/// @nodoc

class _$OntapImpl implements Ontap {
  const _$OntapImpl({required this.item});

  @override
  final Order item;

  @override
  String toString() {
    return 'OrdersEvent.ontap(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OntapImpl &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OntapImplCopyWith<_$OntapImpl> get copyWith =>
      __$$OntapImplCopyWithImpl<_$OntapImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() allorders,
    required TResult Function(String tableNo) tableOrders,
    required TResult Function() clearitem,
    required TResult Function(Order item) longpress,
    required TResult Function(Order item) ontap,
    required TResult Function() mergeAndprint,
  }) {
    return ontap(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? allorders,
    TResult? Function(String tableNo)? tableOrders,
    TResult? Function()? clearitem,
    TResult? Function(Order item)? longpress,
    TResult? Function(Order item)? ontap,
    TResult? Function()? mergeAndprint,
  }) {
    return ontap?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? allorders,
    TResult Function(String tableNo)? tableOrders,
    TResult Function()? clearitem,
    TResult Function(Order item)? longpress,
    TResult Function(Order item)? ontap,
    TResult Function()? mergeAndprint,
    required TResult orElse(),
  }) {
    if (ontap != null) {
      return ontap(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AllOrders value) allorders,
    required TResult Function(TableOrders value) tableOrders,
    required TResult Function(Clearitem value) clearitem,
    required TResult Function(Longpress value) longpress,
    required TResult Function(Ontap value) ontap,
    required TResult Function(MergeAndPrint value) mergeAndprint,
  }) {
    return ontap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AllOrders value)? allorders,
    TResult? Function(TableOrders value)? tableOrders,
    TResult? Function(Clearitem value)? clearitem,
    TResult? Function(Longpress value)? longpress,
    TResult? Function(Ontap value)? ontap,
    TResult? Function(MergeAndPrint value)? mergeAndprint,
  }) {
    return ontap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AllOrders value)? allorders,
    TResult Function(TableOrders value)? tableOrders,
    TResult Function(Clearitem value)? clearitem,
    TResult Function(Longpress value)? longpress,
    TResult Function(Ontap value)? ontap,
    TResult Function(MergeAndPrint value)? mergeAndprint,
    required TResult orElse(),
  }) {
    if (ontap != null) {
      return ontap(this);
    }
    return orElse();
  }
}

abstract class Ontap implements OrdersEvent {
  const factory Ontap({required final Order item}) = _$OntapImpl;

  Order get item;

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OntapImplCopyWith<_$OntapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MergeAndPrintImplCopyWith<$Res> {
  factory _$$MergeAndPrintImplCopyWith(
          _$MergeAndPrintImpl value, $Res Function(_$MergeAndPrintImpl) then) =
      __$$MergeAndPrintImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MergeAndPrintImplCopyWithImpl<$Res>
    extends _$OrdersEventCopyWithImpl<$Res, _$MergeAndPrintImpl>
    implements _$$MergeAndPrintImplCopyWith<$Res> {
  __$$MergeAndPrintImplCopyWithImpl(
      _$MergeAndPrintImpl _value, $Res Function(_$MergeAndPrintImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MergeAndPrintImpl implements MergeAndPrint {
  const _$MergeAndPrintImpl();

  @override
  String toString() {
    return 'OrdersEvent.mergeAndprint()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MergeAndPrintImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() allorders,
    required TResult Function(String tableNo) tableOrders,
    required TResult Function() clearitem,
    required TResult Function(Order item) longpress,
    required TResult Function(Order item) ontap,
    required TResult Function() mergeAndprint,
  }) {
    return mergeAndprint();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? allorders,
    TResult? Function(String tableNo)? tableOrders,
    TResult? Function()? clearitem,
    TResult? Function(Order item)? longpress,
    TResult? Function(Order item)? ontap,
    TResult? Function()? mergeAndprint,
  }) {
    return mergeAndprint?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? allorders,
    TResult Function(String tableNo)? tableOrders,
    TResult Function()? clearitem,
    TResult Function(Order item)? longpress,
    TResult Function(Order item)? ontap,
    TResult Function()? mergeAndprint,
    required TResult orElse(),
  }) {
    if (mergeAndprint != null) {
      return mergeAndprint();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AllOrders value) allorders,
    required TResult Function(TableOrders value) tableOrders,
    required TResult Function(Clearitem value) clearitem,
    required TResult Function(Longpress value) longpress,
    required TResult Function(Ontap value) ontap,
    required TResult Function(MergeAndPrint value) mergeAndprint,
  }) {
    return mergeAndprint(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AllOrders value)? allorders,
    TResult? Function(TableOrders value)? tableOrders,
    TResult? Function(Clearitem value)? clearitem,
    TResult? Function(Longpress value)? longpress,
    TResult? Function(Ontap value)? ontap,
    TResult? Function(MergeAndPrint value)? mergeAndprint,
  }) {
    return mergeAndprint?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AllOrders value)? allorders,
    TResult Function(TableOrders value)? tableOrders,
    TResult Function(Clearitem value)? clearitem,
    TResult Function(Longpress value)? longpress,
    TResult Function(Ontap value)? ontap,
    TResult Function(MergeAndPrint value)? mergeAndprint,
    required TResult orElse(),
  }) {
    if (mergeAndprint != null) {
      return mergeAndprint(this);
    }
    return orElse();
  }
}

abstract class MergeAndPrint implements OrdersEvent {
  const factory MergeAndPrint() = _$MergeAndPrintImpl;
}

/// @nodoc
mixin _$OrdersState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get mergeisLoading => throw _privateConstructorUsedError;
  int get mergeStatus => throw _privateConstructorUsedError;
  List<Order> get tableOrders => throw _privateConstructorUsedError;
  List<Order> get orders => throw _privateConstructorUsedError;
  List<Order> get isSelected => throw _privateConstructorUsedError;
  bool get isMultiSelectMode => throw _privateConstructorUsedError;
  int get printerstatus => throw _privateConstructorUsedError;

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
  $Res call(
      {bool isLoading,
      bool mergeisLoading,
      int mergeStatus,
      List<Order> tableOrders,
      List<Order> orders,
      List<Order> isSelected,
      bool isMultiSelectMode,
      int printerstatus});
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
    Object? mergeisLoading = null,
    Object? mergeStatus = null,
    Object? tableOrders = null,
    Object? orders = null,
    Object? isSelected = null,
    Object? isMultiSelectMode = null,
    Object? printerstatus = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      mergeisLoading: null == mergeisLoading
          ? _value.mergeisLoading
          : mergeisLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      mergeStatus: null == mergeStatus
          ? _value.mergeStatus
          : mergeStatus // ignore: cast_nullable_to_non_nullable
              as int,
      tableOrders: null == tableOrders
          ? _value.tableOrders
          : tableOrders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      isMultiSelectMode: null == isMultiSelectMode
          ? _value.isMultiSelectMode
          : isMultiSelectMode // ignore: cast_nullable_to_non_nullable
              as bool,
      printerstatus: null == printerstatus
          ? _value.printerstatus
          : printerstatus // ignore: cast_nullable_to_non_nullable
              as int,
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
  $Res call(
      {bool isLoading,
      bool mergeisLoading,
      int mergeStatus,
      List<Order> tableOrders,
      List<Order> orders,
      List<Order> isSelected,
      bool isMultiSelectMode,
      int printerstatus});
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
    Object? mergeisLoading = null,
    Object? mergeStatus = null,
    Object? tableOrders = null,
    Object? orders = null,
    Object? isSelected = null,
    Object? isMultiSelectMode = null,
    Object? printerstatus = null,
  }) {
    return _then(_$OrdersStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      mergeisLoading: null == mergeisLoading
          ? _value.mergeisLoading
          : mergeisLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      mergeStatus: null == mergeStatus
          ? _value.mergeStatus
          : mergeStatus // ignore: cast_nullable_to_non_nullable
              as int,
      tableOrders: null == tableOrders
          ? _value._tableOrders
          : tableOrders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      isSelected: null == isSelected
          ? _value._isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as List<Order>,
      isMultiSelectMode: null == isMultiSelectMode
          ? _value.isMultiSelectMode
          : isMultiSelectMode // ignore: cast_nullable_to_non_nullable
              as bool,
      printerstatus: null == printerstatus
          ? _value.printerstatus
          : printerstatus // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$OrdersStateImpl implements _OrdersState {
  _$OrdersStateImpl(
      {required this.isLoading,
      required this.mergeisLoading,
      required this.mergeStatus,
      required final List<Order> tableOrders,
      required final List<Order> orders,
      required final List<Order> isSelected,
      required this.isMultiSelectMode,
      required this.printerstatus})
      : _tableOrders = tableOrders,
        _orders = orders,
        _isSelected = isSelected;

  @override
  final bool isLoading;
  @override
  final bool mergeisLoading;
  @override
  final int mergeStatus;
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

  final List<Order> _isSelected;
  @override
  List<Order> get isSelected {
    if (_isSelected is EqualUnmodifiableListView) return _isSelected;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_isSelected);
  }

  @override
  final bool isMultiSelectMode;
  @override
  final int printerstatus;

  @override
  String toString() {
    return 'OrdersState(isLoading: $isLoading, mergeisLoading: $mergeisLoading, mergeStatus: $mergeStatus, tableOrders: $tableOrders, orders: $orders, isSelected: $isSelected, isMultiSelectMode: $isMultiSelectMode, printerstatus: $printerstatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrdersStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.mergeisLoading, mergeisLoading) ||
                other.mergeisLoading == mergeisLoading) &&
            (identical(other.mergeStatus, mergeStatus) ||
                other.mergeStatus == mergeStatus) &&
            const DeepCollectionEquality()
                .equals(other._tableOrders, _tableOrders) &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            const DeepCollectionEquality()
                .equals(other._isSelected, _isSelected) &&
            (identical(other.isMultiSelectMode, isMultiSelectMode) ||
                other.isMultiSelectMode == isMultiSelectMode) &&
            (identical(other.printerstatus, printerstatus) ||
                other.printerstatus == printerstatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      mergeisLoading,
      mergeStatus,
      const DeepCollectionEquality().hash(_tableOrders),
      const DeepCollectionEquality().hash(_orders),
      const DeepCollectionEquality().hash(_isSelected),
      isMultiSelectMode,
      printerstatus);

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
      required final bool mergeisLoading,
      required final int mergeStatus,
      required final List<Order> tableOrders,
      required final List<Order> orders,
      required final List<Order> isSelected,
      required final bool isMultiSelectMode,
      required final int printerstatus}) = _$OrdersStateImpl;

  @override
  bool get isLoading;
  @override
  bool get mergeisLoading;
  @override
  int get mergeStatus;
  @override
  List<Order> get tableOrders;
  @override
  List<Order> get orders;
  @override
  List<Order> get isSelected;
  @override
  bool get isMultiSelectMode;
  @override
  int get printerstatus;

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrdersStateImplCopyWith<_$OrdersStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
