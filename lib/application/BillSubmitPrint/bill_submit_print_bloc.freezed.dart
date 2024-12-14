// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bill_submit_print_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BillSubmitPrintEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<kotItem> items,
            CustomerDetails selectedcustomer,
            TableInfo table,
            String currentorderid)
        billPreview,
    required TResult Function(String userID, PrinterConfig printer, bool paid)
        billSubmitAndPrint,
    required TResult Function(PrinterConfig printer) billRePrint,
    required TResult Function(String paytypeValue) payType,
    required TResult Function(
            PrinterConfig printer, String userId, bool paid, String invNo)
        billUpdateAndPrint,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<kotItem> items, CustomerDetails selectedcustomer,
            TableInfo table, String currentorderid)?
        billPreview,
    TResult? Function(String userID, PrinterConfig printer, bool paid)?
        billSubmitAndPrint,
    TResult? Function(PrinterConfig printer)? billRePrint,
    TResult? Function(String paytypeValue)? payType,
    TResult? Function(
            PrinterConfig printer, String userId, bool paid, String invNo)?
        billUpdateAndPrint,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<kotItem> items, CustomerDetails selectedcustomer,
            TableInfo table, String currentorderid)?
        billPreview,
    TResult Function(String userID, PrinterConfig printer, bool paid)?
        billSubmitAndPrint,
    TResult Function(PrinterConfig printer)? billRePrint,
    TResult Function(String paytypeValue)? payType,
    TResult Function(
            PrinterConfig printer, String userId, bool paid, String invNo)?
        billUpdateAndPrint,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BillPreview value) billPreview,
    required TResult Function(BillSubmitAndPrint value) billSubmitAndPrint,
    required TResult Function(BillRePrint value) billRePrint,
    required TResult Function(payType value) payType,
    required TResult Function(BillUpdateAndPrint value) billUpdateAndPrint,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BillPreview value)? billPreview,
    TResult? Function(BillSubmitAndPrint value)? billSubmitAndPrint,
    TResult? Function(BillRePrint value)? billRePrint,
    TResult? Function(payType value)? payType,
    TResult? Function(BillUpdateAndPrint value)? billUpdateAndPrint,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BillPreview value)? billPreview,
    TResult Function(BillSubmitAndPrint value)? billSubmitAndPrint,
    TResult Function(BillRePrint value)? billRePrint,
    TResult Function(payType value)? payType,
    TResult Function(BillUpdateAndPrint value)? billUpdateAndPrint,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillSubmitPrintEventCopyWith<$Res> {
  factory $BillSubmitPrintEventCopyWith(BillSubmitPrintEvent value,
          $Res Function(BillSubmitPrintEvent) then) =
      _$BillSubmitPrintEventCopyWithImpl<$Res, BillSubmitPrintEvent>;
}

/// @nodoc
class _$BillSubmitPrintEventCopyWithImpl<$Res,
        $Val extends BillSubmitPrintEvent>
    implements $BillSubmitPrintEventCopyWith<$Res> {
  _$BillSubmitPrintEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BillSubmitPrintEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$BillPreviewImplCopyWith<$Res> {
  factory _$$BillPreviewImplCopyWith(
          _$BillPreviewImpl value, $Res Function(_$BillPreviewImpl) then) =
      __$$BillPreviewImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<kotItem> items,
      CustomerDetails selectedcustomer,
      TableInfo table,
      String currentorderid});
}

/// @nodoc
class __$$BillPreviewImplCopyWithImpl<$Res>
    extends _$BillSubmitPrintEventCopyWithImpl<$Res, _$BillPreviewImpl>
    implements _$$BillPreviewImplCopyWith<$Res> {
  __$$BillPreviewImplCopyWithImpl(
      _$BillPreviewImpl _value, $Res Function(_$BillPreviewImpl) _then)
      : super(_value, _then);

  /// Create a copy of BillSubmitPrintEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? selectedcustomer = null,
    Object? table = null,
    Object? currentorderid = null,
  }) {
    return _then(_$BillPreviewImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<kotItem>,
      selectedcustomer: null == selectedcustomer
          ? _value.selectedcustomer
          : selectedcustomer // ignore: cast_nullable_to_non_nullable
              as CustomerDetails,
      table: null == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as TableInfo,
      currentorderid: null == currentorderid
          ? _value.currentorderid
          : currentorderid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BillPreviewImpl implements BillPreview {
  const _$BillPreviewImpl(
      {required final List<kotItem> items,
      required this.selectedcustomer,
      required this.table,
      required this.currentorderid})
      : _items = items;

  final List<kotItem> _items;
  @override
  List<kotItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final CustomerDetails selectedcustomer;
  @override
  final TableInfo table;
  @override
  final String currentorderid;

  @override
  String toString() {
    return 'BillSubmitPrintEvent.billPreview(items: $items, selectedcustomer: $selectedcustomer, table: $table, currentorderid: $currentorderid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillPreviewImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.selectedcustomer, selectedcustomer) ||
                other.selectedcustomer == selectedcustomer) &&
            (identical(other.table, table) || other.table == table) &&
            (identical(other.currentorderid, currentorderid) ||
                other.currentorderid == currentorderid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      selectedcustomer,
      table,
      currentorderid);

  /// Create a copy of BillSubmitPrintEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BillPreviewImplCopyWith<_$BillPreviewImpl> get copyWith =>
      __$$BillPreviewImplCopyWithImpl<_$BillPreviewImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<kotItem> items,
            CustomerDetails selectedcustomer,
            TableInfo table,
            String currentorderid)
        billPreview,
    required TResult Function(String userID, PrinterConfig printer, bool paid)
        billSubmitAndPrint,
    required TResult Function(PrinterConfig printer) billRePrint,
    required TResult Function(String paytypeValue) payType,
    required TResult Function(
            PrinterConfig printer, String userId, bool paid, String invNo)
        billUpdateAndPrint,
  }) {
    return billPreview(items, selectedcustomer, table, currentorderid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<kotItem> items, CustomerDetails selectedcustomer,
            TableInfo table, String currentorderid)?
        billPreview,
    TResult? Function(String userID, PrinterConfig printer, bool paid)?
        billSubmitAndPrint,
    TResult? Function(PrinterConfig printer)? billRePrint,
    TResult? Function(String paytypeValue)? payType,
    TResult? Function(
            PrinterConfig printer, String userId, bool paid, String invNo)?
        billUpdateAndPrint,
  }) {
    return billPreview?.call(items, selectedcustomer, table, currentorderid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<kotItem> items, CustomerDetails selectedcustomer,
            TableInfo table, String currentorderid)?
        billPreview,
    TResult Function(String userID, PrinterConfig printer, bool paid)?
        billSubmitAndPrint,
    TResult Function(PrinterConfig printer)? billRePrint,
    TResult Function(String paytypeValue)? payType,
    TResult Function(
            PrinterConfig printer, String userId, bool paid, String invNo)?
        billUpdateAndPrint,
    required TResult orElse(),
  }) {
    if (billPreview != null) {
      return billPreview(items, selectedcustomer, table, currentorderid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BillPreview value) billPreview,
    required TResult Function(BillSubmitAndPrint value) billSubmitAndPrint,
    required TResult Function(BillRePrint value) billRePrint,
    required TResult Function(payType value) payType,
    required TResult Function(BillUpdateAndPrint value) billUpdateAndPrint,
  }) {
    return billPreview(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BillPreview value)? billPreview,
    TResult? Function(BillSubmitAndPrint value)? billSubmitAndPrint,
    TResult? Function(BillRePrint value)? billRePrint,
    TResult? Function(payType value)? payType,
    TResult? Function(BillUpdateAndPrint value)? billUpdateAndPrint,
  }) {
    return billPreview?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BillPreview value)? billPreview,
    TResult Function(BillSubmitAndPrint value)? billSubmitAndPrint,
    TResult Function(BillRePrint value)? billRePrint,
    TResult Function(payType value)? payType,
    TResult Function(BillUpdateAndPrint value)? billUpdateAndPrint,
    required TResult orElse(),
  }) {
    if (billPreview != null) {
      return billPreview(this);
    }
    return orElse();
  }
}

abstract class BillPreview implements BillSubmitPrintEvent {
  const factory BillPreview(
      {required final List<kotItem> items,
      required final CustomerDetails selectedcustomer,
      required final TableInfo table,
      required final String currentorderid}) = _$BillPreviewImpl;

  List<kotItem> get items;
  CustomerDetails get selectedcustomer;
  TableInfo get table;
  String get currentorderid;

  /// Create a copy of BillSubmitPrintEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BillPreviewImplCopyWith<_$BillPreviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BillSubmitAndPrintImplCopyWith<$Res> {
  factory _$$BillSubmitAndPrintImplCopyWith(_$BillSubmitAndPrintImpl value,
          $Res Function(_$BillSubmitAndPrintImpl) then) =
      __$$BillSubmitAndPrintImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userID, PrinterConfig printer, bool paid});
}

/// @nodoc
class __$$BillSubmitAndPrintImplCopyWithImpl<$Res>
    extends _$BillSubmitPrintEventCopyWithImpl<$Res, _$BillSubmitAndPrintImpl>
    implements _$$BillSubmitAndPrintImplCopyWith<$Res> {
  __$$BillSubmitAndPrintImplCopyWithImpl(_$BillSubmitAndPrintImpl _value,
      $Res Function(_$BillSubmitAndPrintImpl) _then)
      : super(_value, _then);

  /// Create a copy of BillSubmitPrintEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
    Object? printer = null,
    Object? paid = null,
  }) {
    return _then(_$BillSubmitAndPrintImpl(
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      printer: null == printer
          ? _value.printer
          : printer // ignore: cast_nullable_to_non_nullable
              as PrinterConfig,
      paid: null == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BillSubmitAndPrintImpl implements BillSubmitAndPrint {
  const _$BillSubmitAndPrintImpl(
      {required this.userID, required this.printer, required this.paid});

  @override
  final String userID;
  @override
  final PrinterConfig printer;
  @override
  final bool paid;

  @override
  String toString() {
    return 'BillSubmitPrintEvent.billSubmitAndPrint(userID: $userID, printer: $printer, paid: $paid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillSubmitAndPrintImpl &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.printer, printer) || other.printer == printer) &&
            (identical(other.paid, paid) || other.paid == paid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userID, printer, paid);

  /// Create a copy of BillSubmitPrintEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BillSubmitAndPrintImplCopyWith<_$BillSubmitAndPrintImpl> get copyWith =>
      __$$BillSubmitAndPrintImplCopyWithImpl<_$BillSubmitAndPrintImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<kotItem> items,
            CustomerDetails selectedcustomer,
            TableInfo table,
            String currentorderid)
        billPreview,
    required TResult Function(String userID, PrinterConfig printer, bool paid)
        billSubmitAndPrint,
    required TResult Function(PrinterConfig printer) billRePrint,
    required TResult Function(String paytypeValue) payType,
    required TResult Function(
            PrinterConfig printer, String userId, bool paid, String invNo)
        billUpdateAndPrint,
  }) {
    return billSubmitAndPrint(userID, printer, paid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<kotItem> items, CustomerDetails selectedcustomer,
            TableInfo table, String currentorderid)?
        billPreview,
    TResult? Function(String userID, PrinterConfig printer, bool paid)?
        billSubmitAndPrint,
    TResult? Function(PrinterConfig printer)? billRePrint,
    TResult? Function(String paytypeValue)? payType,
    TResult? Function(
            PrinterConfig printer, String userId, bool paid, String invNo)?
        billUpdateAndPrint,
  }) {
    return billSubmitAndPrint?.call(userID, printer, paid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<kotItem> items, CustomerDetails selectedcustomer,
            TableInfo table, String currentorderid)?
        billPreview,
    TResult Function(String userID, PrinterConfig printer, bool paid)?
        billSubmitAndPrint,
    TResult Function(PrinterConfig printer)? billRePrint,
    TResult Function(String paytypeValue)? payType,
    TResult Function(
            PrinterConfig printer, String userId, bool paid, String invNo)?
        billUpdateAndPrint,
    required TResult orElse(),
  }) {
    if (billSubmitAndPrint != null) {
      return billSubmitAndPrint(userID, printer, paid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BillPreview value) billPreview,
    required TResult Function(BillSubmitAndPrint value) billSubmitAndPrint,
    required TResult Function(BillRePrint value) billRePrint,
    required TResult Function(payType value) payType,
    required TResult Function(BillUpdateAndPrint value) billUpdateAndPrint,
  }) {
    return billSubmitAndPrint(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BillPreview value)? billPreview,
    TResult? Function(BillSubmitAndPrint value)? billSubmitAndPrint,
    TResult? Function(BillRePrint value)? billRePrint,
    TResult? Function(payType value)? payType,
    TResult? Function(BillUpdateAndPrint value)? billUpdateAndPrint,
  }) {
    return billSubmitAndPrint?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BillPreview value)? billPreview,
    TResult Function(BillSubmitAndPrint value)? billSubmitAndPrint,
    TResult Function(BillRePrint value)? billRePrint,
    TResult Function(payType value)? payType,
    TResult Function(BillUpdateAndPrint value)? billUpdateAndPrint,
    required TResult orElse(),
  }) {
    if (billSubmitAndPrint != null) {
      return billSubmitAndPrint(this);
    }
    return orElse();
  }
}

abstract class BillSubmitAndPrint implements BillSubmitPrintEvent {
  const factory BillSubmitAndPrint(
      {required final String userID,
      required final PrinterConfig printer,
      required final bool paid}) = _$BillSubmitAndPrintImpl;

  String get userID;
  PrinterConfig get printer;
  bool get paid;

  /// Create a copy of BillSubmitPrintEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BillSubmitAndPrintImplCopyWith<_$BillSubmitAndPrintImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BillRePrintImplCopyWith<$Res> {
  factory _$$BillRePrintImplCopyWith(
          _$BillRePrintImpl value, $Res Function(_$BillRePrintImpl) then) =
      __$$BillRePrintImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PrinterConfig printer});
}

/// @nodoc
class __$$BillRePrintImplCopyWithImpl<$Res>
    extends _$BillSubmitPrintEventCopyWithImpl<$Res, _$BillRePrintImpl>
    implements _$$BillRePrintImplCopyWith<$Res> {
  __$$BillRePrintImplCopyWithImpl(
      _$BillRePrintImpl _value, $Res Function(_$BillRePrintImpl) _then)
      : super(_value, _then);

  /// Create a copy of BillSubmitPrintEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? printer = null,
  }) {
    return _then(_$BillRePrintImpl(
      printer: null == printer
          ? _value.printer
          : printer // ignore: cast_nullable_to_non_nullable
              as PrinterConfig,
    ));
  }
}

/// @nodoc

class _$BillRePrintImpl implements BillRePrint {
  const _$BillRePrintImpl({required this.printer});

  @override
  final PrinterConfig printer;

  @override
  String toString() {
    return 'BillSubmitPrintEvent.billRePrint(printer: $printer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillRePrintImpl &&
            (identical(other.printer, printer) || other.printer == printer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, printer);

  /// Create a copy of BillSubmitPrintEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BillRePrintImplCopyWith<_$BillRePrintImpl> get copyWith =>
      __$$BillRePrintImplCopyWithImpl<_$BillRePrintImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<kotItem> items,
            CustomerDetails selectedcustomer,
            TableInfo table,
            String currentorderid)
        billPreview,
    required TResult Function(String userID, PrinterConfig printer, bool paid)
        billSubmitAndPrint,
    required TResult Function(PrinterConfig printer) billRePrint,
    required TResult Function(String paytypeValue) payType,
    required TResult Function(
            PrinterConfig printer, String userId, bool paid, String invNo)
        billUpdateAndPrint,
  }) {
    return billRePrint(printer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<kotItem> items, CustomerDetails selectedcustomer,
            TableInfo table, String currentorderid)?
        billPreview,
    TResult? Function(String userID, PrinterConfig printer, bool paid)?
        billSubmitAndPrint,
    TResult? Function(PrinterConfig printer)? billRePrint,
    TResult? Function(String paytypeValue)? payType,
    TResult? Function(
            PrinterConfig printer, String userId, bool paid, String invNo)?
        billUpdateAndPrint,
  }) {
    return billRePrint?.call(printer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<kotItem> items, CustomerDetails selectedcustomer,
            TableInfo table, String currentorderid)?
        billPreview,
    TResult Function(String userID, PrinterConfig printer, bool paid)?
        billSubmitAndPrint,
    TResult Function(PrinterConfig printer)? billRePrint,
    TResult Function(String paytypeValue)? payType,
    TResult Function(
            PrinterConfig printer, String userId, bool paid, String invNo)?
        billUpdateAndPrint,
    required TResult orElse(),
  }) {
    if (billRePrint != null) {
      return billRePrint(printer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BillPreview value) billPreview,
    required TResult Function(BillSubmitAndPrint value) billSubmitAndPrint,
    required TResult Function(BillRePrint value) billRePrint,
    required TResult Function(payType value) payType,
    required TResult Function(BillUpdateAndPrint value) billUpdateAndPrint,
  }) {
    return billRePrint(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BillPreview value)? billPreview,
    TResult? Function(BillSubmitAndPrint value)? billSubmitAndPrint,
    TResult? Function(BillRePrint value)? billRePrint,
    TResult? Function(payType value)? payType,
    TResult? Function(BillUpdateAndPrint value)? billUpdateAndPrint,
  }) {
    return billRePrint?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BillPreview value)? billPreview,
    TResult Function(BillSubmitAndPrint value)? billSubmitAndPrint,
    TResult Function(BillRePrint value)? billRePrint,
    TResult Function(payType value)? payType,
    TResult Function(BillUpdateAndPrint value)? billUpdateAndPrint,
    required TResult orElse(),
  }) {
    if (billRePrint != null) {
      return billRePrint(this);
    }
    return orElse();
  }
}

abstract class BillRePrint implements BillSubmitPrintEvent {
  const factory BillRePrint({required final PrinterConfig printer}) =
      _$BillRePrintImpl;

  PrinterConfig get printer;

  /// Create a copy of BillSubmitPrintEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BillRePrintImplCopyWith<_$BillRePrintImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$payTypeImplCopyWith<$Res> {
  factory _$$payTypeImplCopyWith(
          _$payTypeImpl value, $Res Function(_$payTypeImpl) then) =
      __$$payTypeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String paytypeValue});
}

/// @nodoc
class __$$payTypeImplCopyWithImpl<$Res>
    extends _$BillSubmitPrintEventCopyWithImpl<$Res, _$payTypeImpl>
    implements _$$payTypeImplCopyWith<$Res> {
  __$$payTypeImplCopyWithImpl(
      _$payTypeImpl _value, $Res Function(_$payTypeImpl) _then)
      : super(_value, _then);

  /// Create a copy of BillSubmitPrintEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paytypeValue = null,
  }) {
    return _then(_$payTypeImpl(
      paytypeValue: null == paytypeValue
          ? _value.paytypeValue
          : paytypeValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$payTypeImpl implements payType {
  const _$payTypeImpl({required this.paytypeValue});

  @override
  final String paytypeValue;

  @override
  String toString() {
    return 'BillSubmitPrintEvent.payType(paytypeValue: $paytypeValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$payTypeImpl &&
            (identical(other.paytypeValue, paytypeValue) ||
                other.paytypeValue == paytypeValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paytypeValue);

  /// Create a copy of BillSubmitPrintEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$payTypeImplCopyWith<_$payTypeImpl> get copyWith =>
      __$$payTypeImplCopyWithImpl<_$payTypeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<kotItem> items,
            CustomerDetails selectedcustomer,
            TableInfo table,
            String currentorderid)
        billPreview,
    required TResult Function(String userID, PrinterConfig printer, bool paid)
        billSubmitAndPrint,
    required TResult Function(PrinterConfig printer) billRePrint,
    required TResult Function(String paytypeValue) payType,
    required TResult Function(
            PrinterConfig printer, String userId, bool paid, String invNo)
        billUpdateAndPrint,
  }) {
    return payType(paytypeValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<kotItem> items, CustomerDetails selectedcustomer,
            TableInfo table, String currentorderid)?
        billPreview,
    TResult? Function(String userID, PrinterConfig printer, bool paid)?
        billSubmitAndPrint,
    TResult? Function(PrinterConfig printer)? billRePrint,
    TResult? Function(String paytypeValue)? payType,
    TResult? Function(
            PrinterConfig printer, String userId, bool paid, String invNo)?
        billUpdateAndPrint,
  }) {
    return payType?.call(paytypeValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<kotItem> items, CustomerDetails selectedcustomer,
            TableInfo table, String currentorderid)?
        billPreview,
    TResult Function(String userID, PrinterConfig printer, bool paid)?
        billSubmitAndPrint,
    TResult Function(PrinterConfig printer)? billRePrint,
    TResult Function(String paytypeValue)? payType,
    TResult Function(
            PrinterConfig printer, String userId, bool paid, String invNo)?
        billUpdateAndPrint,
    required TResult orElse(),
  }) {
    if (payType != null) {
      return payType(paytypeValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BillPreview value) billPreview,
    required TResult Function(BillSubmitAndPrint value) billSubmitAndPrint,
    required TResult Function(BillRePrint value) billRePrint,
    required TResult Function(payType value) payType,
    required TResult Function(BillUpdateAndPrint value) billUpdateAndPrint,
  }) {
    return payType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BillPreview value)? billPreview,
    TResult? Function(BillSubmitAndPrint value)? billSubmitAndPrint,
    TResult? Function(BillRePrint value)? billRePrint,
    TResult? Function(payType value)? payType,
    TResult? Function(BillUpdateAndPrint value)? billUpdateAndPrint,
  }) {
    return payType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BillPreview value)? billPreview,
    TResult Function(BillSubmitAndPrint value)? billSubmitAndPrint,
    TResult Function(BillRePrint value)? billRePrint,
    TResult Function(payType value)? payType,
    TResult Function(BillUpdateAndPrint value)? billUpdateAndPrint,
    required TResult orElse(),
  }) {
    if (payType != null) {
      return payType(this);
    }
    return orElse();
  }
}

abstract class payType implements BillSubmitPrintEvent {
  const factory payType({required final String paytypeValue}) = _$payTypeImpl;

  String get paytypeValue;

  /// Create a copy of BillSubmitPrintEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$payTypeImplCopyWith<_$payTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BillUpdateAndPrintImplCopyWith<$Res> {
  factory _$$BillUpdateAndPrintImplCopyWith(_$BillUpdateAndPrintImpl value,
          $Res Function(_$BillUpdateAndPrintImpl) then) =
      __$$BillUpdateAndPrintImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PrinterConfig printer, String userId, bool paid, String invNo});
}

/// @nodoc
class __$$BillUpdateAndPrintImplCopyWithImpl<$Res>
    extends _$BillSubmitPrintEventCopyWithImpl<$Res, _$BillUpdateAndPrintImpl>
    implements _$$BillUpdateAndPrintImplCopyWith<$Res> {
  __$$BillUpdateAndPrintImplCopyWithImpl(_$BillUpdateAndPrintImpl _value,
      $Res Function(_$BillUpdateAndPrintImpl) _then)
      : super(_value, _then);

  /// Create a copy of BillSubmitPrintEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? printer = null,
    Object? userId = null,
    Object? paid = null,
    Object? invNo = null,
  }) {
    return _then(_$BillUpdateAndPrintImpl(
      printer: null == printer
          ? _value.printer
          : printer // ignore: cast_nullable_to_non_nullable
              as PrinterConfig,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      paid: null == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as bool,
      invNo: null == invNo
          ? _value.invNo
          : invNo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BillUpdateAndPrintImpl implements BillUpdateAndPrint {
  const _$BillUpdateAndPrintImpl(
      {required this.printer,
      required this.userId,
      required this.paid,
      required this.invNo});

  @override
  final PrinterConfig printer;
  @override
  final String userId;
  @override
  final bool paid;
// String? paymentMethord,
  @override
  final String invNo;

  @override
  String toString() {
    return 'BillSubmitPrintEvent.billUpdateAndPrint(printer: $printer, userId: $userId, paid: $paid, invNo: $invNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillUpdateAndPrintImpl &&
            (identical(other.printer, printer) || other.printer == printer) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.paid, paid) || other.paid == paid) &&
            (identical(other.invNo, invNo) || other.invNo == invNo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, printer, userId, paid, invNo);

  /// Create a copy of BillSubmitPrintEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BillUpdateAndPrintImplCopyWith<_$BillUpdateAndPrintImpl> get copyWith =>
      __$$BillUpdateAndPrintImplCopyWithImpl<_$BillUpdateAndPrintImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<kotItem> items,
            CustomerDetails selectedcustomer,
            TableInfo table,
            String currentorderid)
        billPreview,
    required TResult Function(String userID, PrinterConfig printer, bool paid)
        billSubmitAndPrint,
    required TResult Function(PrinterConfig printer) billRePrint,
    required TResult Function(String paytypeValue) payType,
    required TResult Function(
            PrinterConfig printer, String userId, bool paid, String invNo)
        billUpdateAndPrint,
  }) {
    return billUpdateAndPrint(printer, userId, paid, invNo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<kotItem> items, CustomerDetails selectedcustomer,
            TableInfo table, String currentorderid)?
        billPreview,
    TResult? Function(String userID, PrinterConfig printer, bool paid)?
        billSubmitAndPrint,
    TResult? Function(PrinterConfig printer)? billRePrint,
    TResult? Function(String paytypeValue)? payType,
    TResult? Function(
            PrinterConfig printer, String userId, bool paid, String invNo)?
        billUpdateAndPrint,
  }) {
    return billUpdateAndPrint?.call(printer, userId, paid, invNo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<kotItem> items, CustomerDetails selectedcustomer,
            TableInfo table, String currentorderid)?
        billPreview,
    TResult Function(String userID, PrinterConfig printer, bool paid)?
        billSubmitAndPrint,
    TResult Function(PrinterConfig printer)? billRePrint,
    TResult Function(String paytypeValue)? payType,
    TResult Function(
            PrinterConfig printer, String userId, bool paid, String invNo)?
        billUpdateAndPrint,
    required TResult orElse(),
  }) {
    if (billUpdateAndPrint != null) {
      return billUpdateAndPrint(printer, userId, paid, invNo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BillPreview value) billPreview,
    required TResult Function(BillSubmitAndPrint value) billSubmitAndPrint,
    required TResult Function(BillRePrint value) billRePrint,
    required TResult Function(payType value) payType,
    required TResult Function(BillUpdateAndPrint value) billUpdateAndPrint,
  }) {
    return billUpdateAndPrint(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BillPreview value)? billPreview,
    TResult? Function(BillSubmitAndPrint value)? billSubmitAndPrint,
    TResult? Function(BillRePrint value)? billRePrint,
    TResult? Function(payType value)? payType,
    TResult? Function(BillUpdateAndPrint value)? billUpdateAndPrint,
  }) {
    return billUpdateAndPrint?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BillPreview value)? billPreview,
    TResult Function(BillSubmitAndPrint value)? billSubmitAndPrint,
    TResult Function(BillRePrint value)? billRePrint,
    TResult Function(payType value)? payType,
    TResult Function(BillUpdateAndPrint value)? billUpdateAndPrint,
    required TResult orElse(),
  }) {
    if (billUpdateAndPrint != null) {
      return billUpdateAndPrint(this);
    }
    return orElse();
  }
}

abstract class BillUpdateAndPrint implements BillSubmitPrintEvent {
  const factory BillUpdateAndPrint(
      {required final PrinterConfig printer,
      required final String userId,
      required final bool paid,
      required final String invNo}) = _$BillUpdateAndPrintImpl;

  PrinterConfig get printer;
  String get userId;
  bool get paid; // String? paymentMethord,
  String get invNo;

  /// Create a copy of BillSubmitPrintEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BillUpdateAndPrintImplCopyWith<_$BillUpdateAndPrintImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BillSubmitPrintState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  List<kotItem> get billitems => throw _privateConstructorUsedError;
  List<kotItem> get printitems => throw _privateConstructorUsedError;
  CustomerDetails? get selectedCustomer => throw _privateConstructorUsedError;
  TableInfo? get table => throw _privateConstructorUsedError;
  String? get orderid => throw _privateConstructorUsedError;
  double? get subTotal => throw _privateConstructorUsedError;
  double? get totalAmt => throw _privateConstructorUsedError;
  double? get tax => throw _privateConstructorUsedError;
  double? get cess => throw _privateConstructorUsedError;
  bool get billsubmission => throw _privateConstructorUsedError;
  bool get trafic => throw _privateConstructorUsedError;
  String get invNo => throw _privateConstructorUsedError;
  int get printerstatus => throw _privateConstructorUsedError;
  String? get paytypeValue => throw _privateConstructorUsedError;

  /// Create a copy of BillSubmitPrintState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BillSubmitPrintStateCopyWith<BillSubmitPrintState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillSubmitPrintStateCopyWith<$Res> {
  factory $BillSubmitPrintStateCopyWith(BillSubmitPrintState value,
          $Res Function(BillSubmitPrintState) then) =
      _$BillSubmitPrintStateCopyWithImpl<$Res, BillSubmitPrintState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool loading,
      List<kotItem> billitems,
      List<kotItem> printitems,
      CustomerDetails? selectedCustomer,
      TableInfo? table,
      String? orderid,
      double? subTotal,
      double? totalAmt,
      double? tax,
      double? cess,
      bool billsubmission,
      bool trafic,
      String invNo,
      int printerstatus,
      String? paytypeValue});
}

/// @nodoc
class _$BillSubmitPrintStateCopyWithImpl<$Res,
        $Val extends BillSubmitPrintState>
    implements $BillSubmitPrintStateCopyWith<$Res> {
  _$BillSubmitPrintStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BillSubmitPrintState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? loading = null,
    Object? billitems = null,
    Object? printitems = null,
    Object? selectedCustomer = freezed,
    Object? table = freezed,
    Object? orderid = freezed,
    Object? subTotal = freezed,
    Object? totalAmt = freezed,
    Object? tax = freezed,
    Object? cess = freezed,
    Object? billsubmission = null,
    Object? trafic = null,
    Object? invNo = null,
    Object? printerstatus = null,
    Object? paytypeValue = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      billitems: null == billitems
          ? _value.billitems
          : billitems // ignore: cast_nullable_to_non_nullable
              as List<kotItem>,
      printitems: null == printitems
          ? _value.printitems
          : printitems // ignore: cast_nullable_to_non_nullable
              as List<kotItem>,
      selectedCustomer: freezed == selectedCustomer
          ? _value.selectedCustomer
          : selectedCustomer // ignore: cast_nullable_to_non_nullable
              as CustomerDetails?,
      table: freezed == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as TableInfo?,
      orderid: freezed == orderid
          ? _value.orderid
          : orderid // ignore: cast_nullable_to_non_nullable
              as String?,
      subTotal: freezed == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      totalAmt: freezed == totalAmt
          ? _value.totalAmt
          : totalAmt // ignore: cast_nullable_to_non_nullable
              as double?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      cess: freezed == cess
          ? _value.cess
          : cess // ignore: cast_nullable_to_non_nullable
              as double?,
      billsubmission: null == billsubmission
          ? _value.billsubmission
          : billsubmission // ignore: cast_nullable_to_non_nullable
              as bool,
      trafic: null == trafic
          ? _value.trafic
          : trafic // ignore: cast_nullable_to_non_nullable
              as bool,
      invNo: null == invNo
          ? _value.invNo
          : invNo // ignore: cast_nullable_to_non_nullable
              as String,
      printerstatus: null == printerstatus
          ? _value.printerstatus
          : printerstatus // ignore: cast_nullable_to_non_nullable
              as int,
      paytypeValue: freezed == paytypeValue
          ? _value.paytypeValue
          : paytypeValue // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KotSubmitPrintStateImplCopyWith<$Res>
    implements $BillSubmitPrintStateCopyWith<$Res> {
  factory _$$KotSubmitPrintStateImplCopyWith(_$KotSubmitPrintStateImpl value,
          $Res Function(_$KotSubmitPrintStateImpl) then) =
      __$$KotSubmitPrintStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool loading,
      List<kotItem> billitems,
      List<kotItem> printitems,
      CustomerDetails? selectedCustomer,
      TableInfo? table,
      String? orderid,
      double? subTotal,
      double? totalAmt,
      double? tax,
      double? cess,
      bool billsubmission,
      bool trafic,
      String invNo,
      int printerstatus,
      String? paytypeValue});
}

/// @nodoc
class __$$KotSubmitPrintStateImplCopyWithImpl<$Res>
    extends _$BillSubmitPrintStateCopyWithImpl<$Res, _$KotSubmitPrintStateImpl>
    implements _$$KotSubmitPrintStateImplCopyWith<$Res> {
  __$$KotSubmitPrintStateImplCopyWithImpl(_$KotSubmitPrintStateImpl _value,
      $Res Function(_$KotSubmitPrintStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BillSubmitPrintState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? loading = null,
    Object? billitems = null,
    Object? printitems = null,
    Object? selectedCustomer = freezed,
    Object? table = freezed,
    Object? orderid = freezed,
    Object? subTotal = freezed,
    Object? totalAmt = freezed,
    Object? tax = freezed,
    Object? cess = freezed,
    Object? billsubmission = null,
    Object? trafic = null,
    Object? invNo = null,
    Object? printerstatus = null,
    Object? paytypeValue = freezed,
  }) {
    return _then(_$KotSubmitPrintStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      billitems: null == billitems
          ? _value._billitems
          : billitems // ignore: cast_nullable_to_non_nullable
              as List<kotItem>,
      printitems: null == printitems
          ? _value._printitems
          : printitems // ignore: cast_nullable_to_non_nullable
              as List<kotItem>,
      selectedCustomer: freezed == selectedCustomer
          ? _value.selectedCustomer
          : selectedCustomer // ignore: cast_nullable_to_non_nullable
              as CustomerDetails?,
      table: freezed == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as TableInfo?,
      orderid: freezed == orderid
          ? _value.orderid
          : orderid // ignore: cast_nullable_to_non_nullable
              as String?,
      subTotal: freezed == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      totalAmt: freezed == totalAmt
          ? _value.totalAmt
          : totalAmt // ignore: cast_nullable_to_non_nullable
              as double?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      cess: freezed == cess
          ? _value.cess
          : cess // ignore: cast_nullable_to_non_nullable
              as double?,
      billsubmission: null == billsubmission
          ? _value.billsubmission
          : billsubmission // ignore: cast_nullable_to_non_nullable
              as bool,
      trafic: null == trafic
          ? _value.trafic
          : trafic // ignore: cast_nullable_to_non_nullable
              as bool,
      invNo: null == invNo
          ? _value.invNo
          : invNo // ignore: cast_nullable_to_non_nullable
              as String,
      printerstatus: null == printerstatus
          ? _value.printerstatus
          : printerstatus // ignore: cast_nullable_to_non_nullable
              as int,
      paytypeValue: freezed == paytypeValue
          ? _value.paytypeValue
          : paytypeValue // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$KotSubmitPrintStateImpl implements _KotSubmitPrintState {
  _$KotSubmitPrintStateImpl(
      {required this.isLoading,
      required this.loading,
      required final List<kotItem> billitems,
      required final List<kotItem> printitems,
      this.selectedCustomer,
      this.table,
      this.orderid,
      this.subTotal,
      this.totalAmt,
      this.tax,
      this.cess,
      required this.billsubmission,
      required this.trafic,
      required this.invNo,
      required this.printerstatus,
      this.paytypeValue})
      : _billitems = billitems,
        _printitems = printitems;

  @override
  final bool isLoading;
  @override
  final bool loading;
  final List<kotItem> _billitems;
  @override
  List<kotItem> get billitems {
    if (_billitems is EqualUnmodifiableListView) return _billitems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_billitems);
  }

  final List<kotItem> _printitems;
  @override
  List<kotItem> get printitems {
    if (_printitems is EqualUnmodifiableListView) return _printitems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_printitems);
  }

  @override
  final CustomerDetails? selectedCustomer;
  @override
  final TableInfo? table;
  @override
  final String? orderid;
  @override
  final double? subTotal;
  @override
  final double? totalAmt;
  @override
  final double? tax;
  @override
  final double? cess;
  @override
  final bool billsubmission;
  @override
  final bool trafic;
  @override
  final String invNo;
  @override
  final int printerstatus;
  @override
  final String? paytypeValue;

  @override
  String toString() {
    return 'BillSubmitPrintState(isLoading: $isLoading, loading: $loading, billitems: $billitems, printitems: $printitems, selectedCustomer: $selectedCustomer, table: $table, orderid: $orderid, subTotal: $subTotal, totalAmt: $totalAmt, tax: $tax, cess: $cess, billsubmission: $billsubmission, trafic: $trafic, invNo: $invNo, printerstatus: $printerstatus, paytypeValue: $paytypeValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KotSubmitPrintStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality()
                .equals(other._billitems, _billitems) &&
            const DeepCollectionEquality()
                .equals(other._printitems, _printitems) &&
            (identical(other.selectedCustomer, selectedCustomer) ||
                other.selectedCustomer == selectedCustomer) &&
            (identical(other.table, table) || other.table == table) &&
            (identical(other.orderid, orderid) || other.orderid == orderid) &&
            (identical(other.subTotal, subTotal) ||
                other.subTotal == subTotal) &&
            (identical(other.totalAmt, totalAmt) ||
                other.totalAmt == totalAmt) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.cess, cess) || other.cess == cess) &&
            (identical(other.billsubmission, billsubmission) ||
                other.billsubmission == billsubmission) &&
            (identical(other.trafic, trafic) || other.trafic == trafic) &&
            (identical(other.invNo, invNo) || other.invNo == invNo) &&
            (identical(other.printerstatus, printerstatus) ||
                other.printerstatus == printerstatus) &&
            (identical(other.paytypeValue, paytypeValue) ||
                other.paytypeValue == paytypeValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      loading,
      const DeepCollectionEquality().hash(_billitems),
      const DeepCollectionEquality().hash(_printitems),
      selectedCustomer,
      table,
      orderid,
      subTotal,
      totalAmt,
      tax,
      cess,
      billsubmission,
      trafic,
      invNo,
      printerstatus,
      paytypeValue);

  /// Create a copy of BillSubmitPrintState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KotSubmitPrintStateImplCopyWith<_$KotSubmitPrintStateImpl> get copyWith =>
      __$$KotSubmitPrintStateImplCopyWithImpl<_$KotSubmitPrintStateImpl>(
          this, _$identity);
}

abstract class _KotSubmitPrintState implements BillSubmitPrintState {
  factory _KotSubmitPrintState(
      {required final bool isLoading,
      required final bool loading,
      required final List<kotItem> billitems,
      required final List<kotItem> printitems,
      final CustomerDetails? selectedCustomer,
      final TableInfo? table,
      final String? orderid,
      final double? subTotal,
      final double? totalAmt,
      final double? tax,
      final double? cess,
      required final bool billsubmission,
      required final bool trafic,
      required final String invNo,
      required final int printerstatus,
      final String? paytypeValue}) = _$KotSubmitPrintStateImpl;

  @override
  bool get isLoading;
  @override
  bool get loading;
  @override
  List<kotItem> get billitems;
  @override
  List<kotItem> get printitems;
  @override
  CustomerDetails? get selectedCustomer;
  @override
  TableInfo? get table;
  @override
  String? get orderid;
  @override
  double? get subTotal;
  @override
  double? get totalAmt;
  @override
  double? get tax;
  @override
  double? get cess;
  @override
  bool get billsubmission;
  @override
  bool get trafic;
  @override
  String get invNo;
  @override
  int get printerstatus;
  @override
  String? get paytypeValue;

  /// Create a copy of BillSubmitPrintState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KotSubmitPrintStateImplCopyWith<_$KotSubmitPrintStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
