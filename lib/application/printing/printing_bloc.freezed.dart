// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'printing_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PrintingEvent {
  PrinterConfig get printer => throw _privateConstructorUsedError;
  List<kotItem> get items => throw _privateConstructorUsedError;
  String get invNo => throw _privateConstructorUsedError;
  double get taxable => throw _privateConstructorUsedError;
  double get netAmount => throw _privateConstructorUsedError;
  double get cGst => throw _privateConstructorUsedError;
  double get sGst => throw _privateConstructorUsedError;
  String get orderID => throw _privateConstructorUsedError;
  String get tableName => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PrinterConfig printer,
            List<kotItem> items,
            String invNo,
            double taxable,
            double netAmount,
            double cGst,
            double sGst,
            String orderID,
            String tableName)
        printBill,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PrinterConfig printer,
            List<kotItem> items,
            String invNo,
            double taxable,
            double netAmount,
            double cGst,
            double sGst,
            String orderID,
            String tableName)?
        printBill,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PrinterConfig printer,
            List<kotItem> items,
            String invNo,
            double taxable,
            double netAmount,
            double cGst,
            double sGst,
            String orderID,
            String tableName)?
        printBill,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PrintBill value) printBill,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PrintBill value)? printBill,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PrintBill value)? printBill,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of PrintingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrintingEventCopyWith<PrintingEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrintingEventCopyWith<$Res> {
  factory $PrintingEventCopyWith(
          PrintingEvent value, $Res Function(PrintingEvent) then) =
      _$PrintingEventCopyWithImpl<$Res, PrintingEvent>;
  @useResult
  $Res call(
      {PrinterConfig printer,
      List<kotItem> items,
      String invNo,
      double taxable,
      double netAmount,
      double cGst,
      double sGst,
      String orderID,
      String tableName});
}

/// @nodoc
class _$PrintingEventCopyWithImpl<$Res, $Val extends PrintingEvent>
    implements $PrintingEventCopyWith<$Res> {
  _$PrintingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrintingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? printer = null,
    Object? items = null,
    Object? invNo = null,
    Object? taxable = null,
    Object? netAmount = null,
    Object? cGst = null,
    Object? sGst = null,
    Object? orderID = null,
    Object? tableName = null,
  }) {
    return _then(_value.copyWith(
      printer: null == printer
          ? _value.printer
          : printer // ignore: cast_nullable_to_non_nullable
              as PrinterConfig,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<kotItem>,
      invNo: null == invNo
          ? _value.invNo
          : invNo // ignore: cast_nullable_to_non_nullable
              as String,
      taxable: null == taxable
          ? _value.taxable
          : taxable // ignore: cast_nullable_to_non_nullable
              as double,
      netAmount: null == netAmount
          ? _value.netAmount
          : netAmount // ignore: cast_nullable_to_non_nullable
              as double,
      cGst: null == cGst
          ? _value.cGst
          : cGst // ignore: cast_nullable_to_non_nullable
              as double,
      sGst: null == sGst
          ? _value.sGst
          : sGst // ignore: cast_nullable_to_non_nullable
              as double,
      orderID: null == orderID
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as String,
      tableName: null == tableName
          ? _value.tableName
          : tableName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrintBillImplCopyWith<$Res>
    implements $PrintingEventCopyWith<$Res> {
  factory _$$PrintBillImplCopyWith(
          _$PrintBillImpl value, $Res Function(_$PrintBillImpl) then) =
      __$$PrintBillImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PrinterConfig printer,
      List<kotItem> items,
      String invNo,
      double taxable,
      double netAmount,
      double cGst,
      double sGst,
      String orderID,
      String tableName});
}

/// @nodoc
class __$$PrintBillImplCopyWithImpl<$Res>
    extends _$PrintingEventCopyWithImpl<$Res, _$PrintBillImpl>
    implements _$$PrintBillImplCopyWith<$Res> {
  __$$PrintBillImplCopyWithImpl(
      _$PrintBillImpl _value, $Res Function(_$PrintBillImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrintingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? printer = null,
    Object? items = null,
    Object? invNo = null,
    Object? taxable = null,
    Object? netAmount = null,
    Object? cGst = null,
    Object? sGst = null,
    Object? orderID = null,
    Object? tableName = null,
  }) {
    return _then(_$PrintBillImpl(
      printer: null == printer
          ? _value.printer
          : printer // ignore: cast_nullable_to_non_nullable
              as PrinterConfig,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<kotItem>,
      invNo: null == invNo
          ? _value.invNo
          : invNo // ignore: cast_nullable_to_non_nullable
              as String,
      taxable: null == taxable
          ? _value.taxable
          : taxable // ignore: cast_nullable_to_non_nullable
              as double,
      netAmount: null == netAmount
          ? _value.netAmount
          : netAmount // ignore: cast_nullable_to_non_nullable
              as double,
      cGst: null == cGst
          ? _value.cGst
          : cGst // ignore: cast_nullable_to_non_nullable
              as double,
      sGst: null == sGst
          ? _value.sGst
          : sGst // ignore: cast_nullable_to_non_nullable
              as double,
      orderID: null == orderID
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as String,
      tableName: null == tableName
          ? _value.tableName
          : tableName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PrintBillImpl implements PrintBill {
  const _$PrintBillImpl(
      {required this.printer,
      required final List<kotItem> items,
      required this.invNo,
      required this.taxable,
      required this.netAmount,
      required this.cGst,
      required this.sGst,
      required this.orderID,
      required this.tableName})
      : _items = items;

  @override
  final PrinterConfig printer;
  final List<kotItem> _items;
  @override
  List<kotItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String invNo;
  @override
  final double taxable;
  @override
  final double netAmount;
  @override
  final double cGst;
  @override
  final double sGst;
  @override
  final String orderID;
  @override
  final String tableName;

  @override
  String toString() {
    return 'PrintingEvent.printBill(printer: $printer, items: $items, invNo: $invNo, taxable: $taxable, netAmount: $netAmount, cGst: $cGst, sGst: $sGst, orderID: $orderID, tableName: $tableName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrintBillImpl &&
            (identical(other.printer, printer) || other.printer == printer) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.invNo, invNo) || other.invNo == invNo) &&
            (identical(other.taxable, taxable) || other.taxable == taxable) &&
            (identical(other.netAmount, netAmount) ||
                other.netAmount == netAmount) &&
            (identical(other.cGst, cGst) || other.cGst == cGst) &&
            (identical(other.sGst, sGst) || other.sGst == sGst) &&
            (identical(other.orderID, orderID) || other.orderID == orderID) &&
            (identical(other.tableName, tableName) ||
                other.tableName == tableName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      printer,
      const DeepCollectionEquality().hash(_items),
      invNo,
      taxable,
      netAmount,
      cGst,
      sGst,
      orderID,
      tableName);

  /// Create a copy of PrintingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrintBillImplCopyWith<_$PrintBillImpl> get copyWith =>
      __$$PrintBillImplCopyWithImpl<_$PrintBillImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PrinterConfig printer,
            List<kotItem> items,
            String invNo,
            double taxable,
            double netAmount,
            double cGst,
            double sGst,
            String orderID,
            String tableName)
        printBill,
  }) {
    return printBill(printer, items, invNo, taxable, netAmount, cGst, sGst,
        orderID, tableName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PrinterConfig printer,
            List<kotItem> items,
            String invNo,
            double taxable,
            double netAmount,
            double cGst,
            double sGst,
            String orderID,
            String tableName)?
        printBill,
  }) {
    return printBill?.call(printer, items, invNo, taxable, netAmount, cGst,
        sGst, orderID, tableName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PrinterConfig printer,
            List<kotItem> items,
            String invNo,
            double taxable,
            double netAmount,
            double cGst,
            double sGst,
            String orderID,
            String tableName)?
        printBill,
    required TResult orElse(),
  }) {
    if (printBill != null) {
      return printBill(printer, items, invNo, taxable, netAmount, cGst, sGst,
          orderID, tableName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PrintBill value) printBill,
  }) {
    return printBill(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PrintBill value)? printBill,
  }) {
    return printBill?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PrintBill value)? printBill,
    required TResult orElse(),
  }) {
    if (printBill != null) {
      return printBill(this);
    }
    return orElse();
  }
}

abstract class PrintBill implements PrintingEvent {
  const factory PrintBill(
      {required final PrinterConfig printer,
      required final List<kotItem> items,
      required final String invNo,
      required final double taxable,
      required final double netAmount,
      required final double cGst,
      required final double sGst,
      required final String orderID,
      required final String tableName}) = _$PrintBillImpl;

  @override
  PrinterConfig get printer;
  @override
  List<kotItem> get items;
  @override
  String get invNo;
  @override
  double get taxable;
  @override
  double get netAmount;
  @override
  double get cGst;
  @override
  double get sGst;
  @override
  String get orderID;
  @override
  String get tableName;

  /// Create a copy of PrintingEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrintBillImplCopyWith<_$PrintBillImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PrintingState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get printed => throw _privateConstructorUsedError;

  /// Create a copy of PrintingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrintingStateCopyWith<PrintingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrintingStateCopyWith<$Res> {
  factory $PrintingStateCopyWith(
          PrintingState value, $Res Function(PrintingState) then) =
      _$PrintingStateCopyWithImpl<$Res, PrintingState>;
  @useResult
  $Res call({bool isLoading, bool printed});
}

/// @nodoc
class _$PrintingStateCopyWithImpl<$Res, $Val extends PrintingState>
    implements $PrintingStateCopyWith<$Res> {
  _$PrintingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrintingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? printed = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      printed: null == printed
          ? _value.printed
          : printed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrintingStateImplCopyWith<$Res>
    implements $PrintingStateCopyWith<$Res> {
  factory _$$PrintingStateImplCopyWith(
          _$PrintingStateImpl value, $Res Function(_$PrintingStateImpl) then) =
      __$$PrintingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool printed});
}

/// @nodoc
class __$$PrintingStateImplCopyWithImpl<$Res>
    extends _$PrintingStateCopyWithImpl<$Res, _$PrintingStateImpl>
    implements _$$PrintingStateImplCopyWith<$Res> {
  __$$PrintingStateImplCopyWithImpl(
      _$PrintingStateImpl _value, $Res Function(_$PrintingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrintingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? printed = null,
  }) {
    return _then(_$PrintingStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      printed: null == printed
          ? _value.printed
          : printed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PrintingStateImpl implements _PrintingState {
  _$PrintingStateImpl({required this.isLoading, required this.printed});

  @override
  final bool isLoading;
  @override
  final bool printed;

  @override
  String toString() {
    return 'PrintingState(isLoading: $isLoading, printed: $printed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrintingStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.printed, printed) || other.printed == printed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, printed);

  /// Create a copy of PrintingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrintingStateImplCopyWith<_$PrintingStateImpl> get copyWith =>
      __$$PrintingStateImplCopyWithImpl<_$PrintingStateImpl>(this, _$identity);
}

abstract class _PrintingState implements PrintingState {
  factory _PrintingState(
      {required final bool isLoading,
      required final bool printed}) = _$PrintingStateImpl;

  @override
  bool get isLoading;
  @override
  bool get printed;

  /// Create a copy of PrintingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrintingStateImplCopyWith<_$PrintingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
