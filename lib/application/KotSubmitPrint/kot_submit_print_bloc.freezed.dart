// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kot_submit_print_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$KotSubmitPrintEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<kotItem> kotitems,
            List<kotItem> kotretunitems,
            CustomerDetails selectedcustomer,
            TableInfo table,
            String? currentorderid,
            List<kotItem>? currentitems,
            String? note)
        submitAndPrint,
    required TResult Function(
            List<kotItem> cancelkotitems,
            CustomerDetails selectedcustomer,
            TableInfo table,
            String currentorderid,
            List<kotItem> currentitems)
        cancelKOT,
    required TResult Function(bool parcel) parcel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<kotItem> kotitems,
            List<kotItem> kotretunitems,
            CustomerDetails selectedcustomer,
            TableInfo table,
            String? currentorderid,
            List<kotItem>? currentitems,
            String? note)?
        submitAndPrint,
    TResult? Function(
            List<kotItem> cancelkotitems,
            CustomerDetails selectedcustomer,
            TableInfo table,
            String currentorderid,
            List<kotItem> currentitems)?
        cancelKOT,
    TResult? Function(bool parcel)? parcel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<kotItem> kotitems,
            List<kotItem> kotretunitems,
            CustomerDetails selectedcustomer,
            TableInfo table,
            String? currentorderid,
            List<kotItem>? currentitems,
            String? note)?
        submitAndPrint,
    TResult Function(
            List<kotItem> cancelkotitems,
            CustomerDetails selectedcustomer,
            TableInfo table,
            String currentorderid,
            List<kotItem> currentitems)?
        cancelKOT,
    TResult Function(bool parcel)? parcel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SubmitAndPrint value) submitAndPrint,
    required TResult Function(CancelKOT value) cancelKOT,
    required TResult Function(Parcel value) parcel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SubmitAndPrint value)? submitAndPrint,
    TResult? Function(CancelKOT value)? cancelKOT,
    TResult? Function(Parcel value)? parcel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SubmitAndPrint value)? submitAndPrint,
    TResult Function(CancelKOT value)? cancelKOT,
    TResult Function(Parcel value)? parcel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KotSubmitPrintEventCopyWith<$Res> {
  factory $KotSubmitPrintEventCopyWith(
          KotSubmitPrintEvent value, $Res Function(KotSubmitPrintEvent) then) =
      _$KotSubmitPrintEventCopyWithImpl<$Res, KotSubmitPrintEvent>;
}

/// @nodoc
class _$KotSubmitPrintEventCopyWithImpl<$Res, $Val extends KotSubmitPrintEvent>
    implements $KotSubmitPrintEventCopyWith<$Res> {
  _$KotSubmitPrintEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KotSubmitPrintEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SubmitAndPrintImplCopyWith<$Res> {
  factory _$$SubmitAndPrintImplCopyWith(_$SubmitAndPrintImpl value,
          $Res Function(_$SubmitAndPrintImpl) then) =
      __$$SubmitAndPrintImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<kotItem> kotitems,
      List<kotItem> kotretunitems,
      CustomerDetails selectedcustomer,
      TableInfo table,
      String? currentorderid,
      List<kotItem>? currentitems,
      String? note});
}

/// @nodoc
class __$$SubmitAndPrintImplCopyWithImpl<$Res>
    extends _$KotSubmitPrintEventCopyWithImpl<$Res, _$SubmitAndPrintImpl>
    implements _$$SubmitAndPrintImplCopyWith<$Res> {
  __$$SubmitAndPrintImplCopyWithImpl(
      _$SubmitAndPrintImpl _value, $Res Function(_$SubmitAndPrintImpl) _then)
      : super(_value, _then);

  /// Create a copy of KotSubmitPrintEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kotitems = null,
    Object? kotretunitems = null,
    Object? selectedcustomer = null,
    Object? table = null,
    Object? currentorderid = freezed,
    Object? currentitems = freezed,
    Object? note = freezed,
  }) {
    return _then(_$SubmitAndPrintImpl(
      kotitems: null == kotitems
          ? _value._kotitems
          : kotitems // ignore: cast_nullable_to_non_nullable
              as List<kotItem>,
      kotretunitems: null == kotretunitems
          ? _value._kotretunitems
          : kotretunitems // ignore: cast_nullable_to_non_nullable
              as List<kotItem>,
      selectedcustomer: null == selectedcustomer
          ? _value.selectedcustomer
          : selectedcustomer // ignore: cast_nullable_to_non_nullable
              as CustomerDetails,
      table: null == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as TableInfo,
      currentorderid: freezed == currentorderid
          ? _value.currentorderid
          : currentorderid // ignore: cast_nullable_to_non_nullable
              as String?,
      currentitems: freezed == currentitems
          ? _value._currentitems
          : currentitems // ignore: cast_nullable_to_non_nullable
              as List<kotItem>?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SubmitAndPrintImpl implements SubmitAndPrint {
  const _$SubmitAndPrintImpl(
      {required final List<kotItem> kotitems,
      required final List<kotItem> kotretunitems,
      required this.selectedcustomer,
      required this.table,
      this.currentorderid,
      final List<kotItem>? currentitems,
      this.note})
      : _kotitems = kotitems,
        _kotretunitems = kotretunitems,
        _currentitems = currentitems;

  final List<kotItem> _kotitems;
  @override
  List<kotItem> get kotitems {
    if (_kotitems is EqualUnmodifiableListView) return _kotitems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_kotitems);
  }

  final List<kotItem> _kotretunitems;
  @override
  List<kotItem> get kotretunitems {
    if (_kotretunitems is EqualUnmodifiableListView) return _kotretunitems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_kotretunitems);
  }

  @override
  final CustomerDetails selectedcustomer;
  @override
  final TableInfo table;
  @override
  final String? currentorderid;
  final List<kotItem>? _currentitems;
  @override
  List<kotItem>? get currentitems {
    final value = _currentitems;
    if (value == null) return null;
    if (_currentitems is EqualUnmodifiableListView) return _currentitems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? note;

  @override
  String toString() {
    return 'KotSubmitPrintEvent.submitAndPrint(kotitems: $kotitems, kotretunitems: $kotretunitems, selectedcustomer: $selectedcustomer, table: $table, currentorderid: $currentorderid, currentitems: $currentitems, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitAndPrintImpl &&
            const DeepCollectionEquality().equals(other._kotitems, _kotitems) &&
            const DeepCollectionEquality()
                .equals(other._kotretunitems, _kotretunitems) &&
            (identical(other.selectedcustomer, selectedcustomer) ||
                other.selectedcustomer == selectedcustomer) &&
            (identical(other.table, table) || other.table == table) &&
            (identical(other.currentorderid, currentorderid) ||
                other.currentorderid == currentorderid) &&
            const DeepCollectionEquality()
                .equals(other._currentitems, _currentitems) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_kotitems),
      const DeepCollectionEquality().hash(_kotretunitems),
      selectedcustomer,
      table,
      currentorderid,
      const DeepCollectionEquality().hash(_currentitems),
      note);

  /// Create a copy of KotSubmitPrintEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitAndPrintImplCopyWith<_$SubmitAndPrintImpl> get copyWith =>
      __$$SubmitAndPrintImplCopyWithImpl<_$SubmitAndPrintImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<kotItem> kotitems,
            List<kotItem> kotretunitems,
            CustomerDetails selectedcustomer,
            TableInfo table,
            String? currentorderid,
            List<kotItem>? currentitems,
            String? note)
        submitAndPrint,
    required TResult Function(
            List<kotItem> cancelkotitems,
            CustomerDetails selectedcustomer,
            TableInfo table,
            String currentorderid,
            List<kotItem> currentitems)
        cancelKOT,
    required TResult Function(bool parcel) parcel,
  }) {
    return submitAndPrint(kotitems, kotretunitems, selectedcustomer, table,
        currentorderid, currentitems, note);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<kotItem> kotitems,
            List<kotItem> kotretunitems,
            CustomerDetails selectedcustomer,
            TableInfo table,
            String? currentorderid,
            List<kotItem>? currentitems,
            String? note)?
        submitAndPrint,
    TResult? Function(
            List<kotItem> cancelkotitems,
            CustomerDetails selectedcustomer,
            TableInfo table,
            String currentorderid,
            List<kotItem> currentitems)?
        cancelKOT,
    TResult? Function(bool parcel)? parcel,
  }) {
    return submitAndPrint?.call(kotitems, kotretunitems, selectedcustomer,
        table, currentorderid, currentitems, note);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<kotItem> kotitems,
            List<kotItem> kotretunitems,
            CustomerDetails selectedcustomer,
            TableInfo table,
            String? currentorderid,
            List<kotItem>? currentitems,
            String? note)?
        submitAndPrint,
    TResult Function(
            List<kotItem> cancelkotitems,
            CustomerDetails selectedcustomer,
            TableInfo table,
            String currentorderid,
            List<kotItem> currentitems)?
        cancelKOT,
    TResult Function(bool parcel)? parcel,
    required TResult orElse(),
  }) {
    if (submitAndPrint != null) {
      return submitAndPrint(kotitems, kotretunitems, selectedcustomer, table,
          currentorderid, currentitems, note);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SubmitAndPrint value) submitAndPrint,
    required TResult Function(CancelKOT value) cancelKOT,
    required TResult Function(Parcel value) parcel,
  }) {
    return submitAndPrint(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SubmitAndPrint value)? submitAndPrint,
    TResult? Function(CancelKOT value)? cancelKOT,
    TResult? Function(Parcel value)? parcel,
  }) {
    return submitAndPrint?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SubmitAndPrint value)? submitAndPrint,
    TResult Function(CancelKOT value)? cancelKOT,
    TResult Function(Parcel value)? parcel,
    required TResult orElse(),
  }) {
    if (submitAndPrint != null) {
      return submitAndPrint(this);
    }
    return orElse();
  }
}

abstract class SubmitAndPrint implements KotSubmitPrintEvent {
  const factory SubmitAndPrint(
      {required final List<kotItem> kotitems,
      required final List<kotItem> kotretunitems,
      required final CustomerDetails selectedcustomer,
      required final TableInfo table,
      final String? currentorderid,
      final List<kotItem>? currentitems,
      final String? note}) = _$SubmitAndPrintImpl;

  List<kotItem> get kotitems;
  List<kotItem> get kotretunitems;
  CustomerDetails get selectedcustomer;
  TableInfo get table;
  String? get currentorderid;
  List<kotItem>? get currentitems;
  String? get note;

  /// Create a copy of KotSubmitPrintEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubmitAndPrintImplCopyWith<_$SubmitAndPrintImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelKOTImplCopyWith<$Res> {
  factory _$$CancelKOTImplCopyWith(
          _$CancelKOTImpl value, $Res Function(_$CancelKOTImpl) then) =
      __$$CancelKOTImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<kotItem> cancelkotitems,
      CustomerDetails selectedcustomer,
      TableInfo table,
      String currentorderid,
      List<kotItem> currentitems});
}

/// @nodoc
class __$$CancelKOTImplCopyWithImpl<$Res>
    extends _$KotSubmitPrintEventCopyWithImpl<$Res, _$CancelKOTImpl>
    implements _$$CancelKOTImplCopyWith<$Res> {
  __$$CancelKOTImplCopyWithImpl(
      _$CancelKOTImpl _value, $Res Function(_$CancelKOTImpl) _then)
      : super(_value, _then);

  /// Create a copy of KotSubmitPrintEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cancelkotitems = null,
    Object? selectedcustomer = null,
    Object? table = null,
    Object? currentorderid = null,
    Object? currentitems = null,
  }) {
    return _then(_$CancelKOTImpl(
      cancelkotitems: null == cancelkotitems
          ? _value._cancelkotitems
          : cancelkotitems // ignore: cast_nullable_to_non_nullable
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
      currentitems: null == currentitems
          ? _value._currentitems
          : currentitems // ignore: cast_nullable_to_non_nullable
              as List<kotItem>,
    ));
  }
}

/// @nodoc

class _$CancelKOTImpl implements CancelKOT {
  const _$CancelKOTImpl(
      {required final List<kotItem> cancelkotitems,
      required this.selectedcustomer,
      required this.table,
      required this.currentorderid,
      required final List<kotItem> currentitems})
      : _cancelkotitems = cancelkotitems,
        _currentitems = currentitems;

  final List<kotItem> _cancelkotitems;
  @override
  List<kotItem> get cancelkotitems {
    if (_cancelkotitems is EqualUnmodifiableListView) return _cancelkotitems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cancelkotitems);
  }

  @override
  final CustomerDetails selectedcustomer;
  @override
  final TableInfo table;
  @override
  final String currentorderid;
  final List<kotItem> _currentitems;
  @override
  List<kotItem> get currentitems {
    if (_currentitems is EqualUnmodifiableListView) return _currentitems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currentitems);
  }

  @override
  String toString() {
    return 'KotSubmitPrintEvent.cancelKOT(cancelkotitems: $cancelkotitems, selectedcustomer: $selectedcustomer, table: $table, currentorderid: $currentorderid, currentitems: $currentitems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelKOTImpl &&
            const DeepCollectionEquality()
                .equals(other._cancelkotitems, _cancelkotitems) &&
            (identical(other.selectedcustomer, selectedcustomer) ||
                other.selectedcustomer == selectedcustomer) &&
            (identical(other.table, table) || other.table == table) &&
            (identical(other.currentorderid, currentorderid) ||
                other.currentorderid == currentorderid) &&
            const DeepCollectionEquality()
                .equals(other._currentitems, _currentitems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cancelkotitems),
      selectedcustomer,
      table,
      currentorderid,
      const DeepCollectionEquality().hash(_currentitems));

  /// Create a copy of KotSubmitPrintEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelKOTImplCopyWith<_$CancelKOTImpl> get copyWith =>
      __$$CancelKOTImplCopyWithImpl<_$CancelKOTImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<kotItem> kotitems,
            List<kotItem> kotretunitems,
            CustomerDetails selectedcustomer,
            TableInfo table,
            String? currentorderid,
            List<kotItem>? currentitems,
            String? note)
        submitAndPrint,
    required TResult Function(
            List<kotItem> cancelkotitems,
            CustomerDetails selectedcustomer,
            TableInfo table,
            String currentorderid,
            List<kotItem> currentitems)
        cancelKOT,
    required TResult Function(bool parcel) parcel,
  }) {
    return cancelKOT(
        cancelkotitems, selectedcustomer, table, currentorderid, currentitems);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<kotItem> kotitems,
            List<kotItem> kotretunitems,
            CustomerDetails selectedcustomer,
            TableInfo table,
            String? currentorderid,
            List<kotItem>? currentitems,
            String? note)?
        submitAndPrint,
    TResult? Function(
            List<kotItem> cancelkotitems,
            CustomerDetails selectedcustomer,
            TableInfo table,
            String currentorderid,
            List<kotItem> currentitems)?
        cancelKOT,
    TResult? Function(bool parcel)? parcel,
  }) {
    return cancelKOT?.call(
        cancelkotitems, selectedcustomer, table, currentorderid, currentitems);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<kotItem> kotitems,
            List<kotItem> kotretunitems,
            CustomerDetails selectedcustomer,
            TableInfo table,
            String? currentorderid,
            List<kotItem>? currentitems,
            String? note)?
        submitAndPrint,
    TResult Function(
            List<kotItem> cancelkotitems,
            CustomerDetails selectedcustomer,
            TableInfo table,
            String currentorderid,
            List<kotItem> currentitems)?
        cancelKOT,
    TResult Function(bool parcel)? parcel,
    required TResult orElse(),
  }) {
    if (cancelKOT != null) {
      return cancelKOT(cancelkotitems, selectedcustomer, table, currentorderid,
          currentitems);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SubmitAndPrint value) submitAndPrint,
    required TResult Function(CancelKOT value) cancelKOT,
    required TResult Function(Parcel value) parcel,
  }) {
    return cancelKOT(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SubmitAndPrint value)? submitAndPrint,
    TResult? Function(CancelKOT value)? cancelKOT,
    TResult? Function(Parcel value)? parcel,
  }) {
    return cancelKOT?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SubmitAndPrint value)? submitAndPrint,
    TResult Function(CancelKOT value)? cancelKOT,
    TResult Function(Parcel value)? parcel,
    required TResult orElse(),
  }) {
    if (cancelKOT != null) {
      return cancelKOT(this);
    }
    return orElse();
  }
}

abstract class CancelKOT implements KotSubmitPrintEvent {
  const factory CancelKOT(
      {required final List<kotItem> cancelkotitems,
      required final CustomerDetails selectedcustomer,
      required final TableInfo table,
      required final String currentorderid,
      required final List<kotItem> currentitems}) = _$CancelKOTImpl;

  List<kotItem> get cancelkotitems;
  CustomerDetails get selectedcustomer;
  TableInfo get table;
  String get currentorderid;
  List<kotItem> get currentitems;

  /// Create a copy of KotSubmitPrintEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancelKOTImplCopyWith<_$CancelKOTImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ParcelImplCopyWith<$Res> {
  factory _$$ParcelImplCopyWith(
          _$ParcelImpl value, $Res Function(_$ParcelImpl) then) =
      __$$ParcelImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool parcel});
}

/// @nodoc
class __$$ParcelImplCopyWithImpl<$Res>
    extends _$KotSubmitPrintEventCopyWithImpl<$Res, _$ParcelImpl>
    implements _$$ParcelImplCopyWith<$Res> {
  __$$ParcelImplCopyWithImpl(
      _$ParcelImpl _value, $Res Function(_$ParcelImpl) _then)
      : super(_value, _then);

  /// Create a copy of KotSubmitPrintEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parcel = null,
  }) {
    return _then(_$ParcelImpl(
      parcel: null == parcel
          ? _value.parcel
          : parcel // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ParcelImpl implements Parcel {
  const _$ParcelImpl({required this.parcel});

  @override
  final bool parcel;

  @override
  String toString() {
    return 'KotSubmitPrintEvent.parcel(parcel: $parcel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParcelImpl &&
            (identical(other.parcel, parcel) || other.parcel == parcel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, parcel);

  /// Create a copy of KotSubmitPrintEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParcelImplCopyWith<_$ParcelImpl> get copyWith =>
      __$$ParcelImplCopyWithImpl<_$ParcelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<kotItem> kotitems,
            List<kotItem> kotretunitems,
            CustomerDetails selectedcustomer,
            TableInfo table,
            String? currentorderid,
            List<kotItem>? currentitems,
            String? note)
        submitAndPrint,
    required TResult Function(
            List<kotItem> cancelkotitems,
            CustomerDetails selectedcustomer,
            TableInfo table,
            String currentorderid,
            List<kotItem> currentitems)
        cancelKOT,
    required TResult Function(bool parcel) parcel,
  }) {
    return parcel(this.parcel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<kotItem> kotitems,
            List<kotItem> kotretunitems,
            CustomerDetails selectedcustomer,
            TableInfo table,
            String? currentorderid,
            List<kotItem>? currentitems,
            String? note)?
        submitAndPrint,
    TResult? Function(
            List<kotItem> cancelkotitems,
            CustomerDetails selectedcustomer,
            TableInfo table,
            String currentorderid,
            List<kotItem> currentitems)?
        cancelKOT,
    TResult? Function(bool parcel)? parcel,
  }) {
    return parcel?.call(this.parcel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<kotItem> kotitems,
            List<kotItem> kotretunitems,
            CustomerDetails selectedcustomer,
            TableInfo table,
            String? currentorderid,
            List<kotItem>? currentitems,
            String? note)?
        submitAndPrint,
    TResult Function(
            List<kotItem> cancelkotitems,
            CustomerDetails selectedcustomer,
            TableInfo table,
            String currentorderid,
            List<kotItem> currentitems)?
        cancelKOT,
    TResult Function(bool parcel)? parcel,
    required TResult orElse(),
  }) {
    if (parcel != null) {
      return parcel(this.parcel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SubmitAndPrint value) submitAndPrint,
    required TResult Function(CancelKOT value) cancelKOT,
    required TResult Function(Parcel value) parcel,
  }) {
    return parcel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SubmitAndPrint value)? submitAndPrint,
    TResult? Function(CancelKOT value)? cancelKOT,
    TResult? Function(Parcel value)? parcel,
  }) {
    return parcel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SubmitAndPrint value)? submitAndPrint,
    TResult Function(CancelKOT value)? cancelKOT,
    TResult Function(Parcel value)? parcel,
    required TResult orElse(),
  }) {
    if (parcel != null) {
      return parcel(this);
    }
    return orElse();
  }
}

abstract class Parcel implements KotSubmitPrintEvent {
  const factory Parcel({required final bool parcel}) = _$ParcelImpl;

  bool get parcel;

  /// Create a copy of KotSubmitPrintEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParcelImplCopyWith<_$ParcelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$KotSubmitPrintState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get parcel => throw _privateConstructorUsedError;
  bool get stockout => throw _privateConstructorUsedError;
  List<kotItem> get outofStock => throw _privateConstructorUsedError;

  /// Create a copy of KotSubmitPrintState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KotSubmitPrintStateCopyWith<KotSubmitPrintState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KotSubmitPrintStateCopyWith<$Res> {
  factory $KotSubmitPrintStateCopyWith(
          KotSubmitPrintState value, $Res Function(KotSubmitPrintState) then) =
      _$KotSubmitPrintStateCopyWithImpl<$Res, KotSubmitPrintState>;
  @useResult
  $Res call(
      {bool isLoading, bool parcel, bool stockout, List<kotItem> outofStock});
}

/// @nodoc
class _$KotSubmitPrintStateCopyWithImpl<$Res, $Val extends KotSubmitPrintState>
    implements $KotSubmitPrintStateCopyWith<$Res> {
  _$KotSubmitPrintStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KotSubmitPrintState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? parcel = null,
    Object? stockout = null,
    Object? outofStock = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      parcel: null == parcel
          ? _value.parcel
          : parcel // ignore: cast_nullable_to_non_nullable
              as bool,
      stockout: null == stockout
          ? _value.stockout
          : stockout // ignore: cast_nullable_to_non_nullable
              as bool,
      outofStock: null == outofStock
          ? _value.outofStock
          : outofStock // ignore: cast_nullable_to_non_nullable
              as List<kotItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KotSubmitPrintStateImplCopyWith<$Res>
    implements $KotSubmitPrintStateCopyWith<$Res> {
  factory _$$KotSubmitPrintStateImplCopyWith(_$KotSubmitPrintStateImpl value,
          $Res Function(_$KotSubmitPrintStateImpl) then) =
      __$$KotSubmitPrintStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading, bool parcel, bool stockout, List<kotItem> outofStock});
}

/// @nodoc
class __$$KotSubmitPrintStateImplCopyWithImpl<$Res>
    extends _$KotSubmitPrintStateCopyWithImpl<$Res, _$KotSubmitPrintStateImpl>
    implements _$$KotSubmitPrintStateImplCopyWith<$Res> {
  __$$KotSubmitPrintStateImplCopyWithImpl(_$KotSubmitPrintStateImpl _value,
      $Res Function(_$KotSubmitPrintStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of KotSubmitPrintState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? parcel = null,
    Object? stockout = null,
    Object? outofStock = null,
  }) {
    return _then(_$KotSubmitPrintStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      parcel: null == parcel
          ? _value.parcel
          : parcel // ignore: cast_nullable_to_non_nullable
              as bool,
      stockout: null == stockout
          ? _value.stockout
          : stockout // ignore: cast_nullable_to_non_nullable
              as bool,
      outofStock: null == outofStock
          ? _value._outofStock
          : outofStock // ignore: cast_nullable_to_non_nullable
              as List<kotItem>,
    ));
  }
}

/// @nodoc

class _$KotSubmitPrintStateImpl implements _KotSubmitPrintState {
  _$KotSubmitPrintStateImpl(
      {required this.isLoading,
      required this.parcel,
      required this.stockout,
      required final List<kotItem> outofStock})
      : _outofStock = outofStock;

  @override
  final bool isLoading;
  @override
  final bool parcel;
  @override
  final bool stockout;
  final List<kotItem> _outofStock;
  @override
  List<kotItem> get outofStock {
    if (_outofStock is EqualUnmodifiableListView) return _outofStock;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_outofStock);
  }

  @override
  String toString() {
    return 'KotSubmitPrintState(isLoading: $isLoading, parcel: $parcel, stockout: $stockout, outofStock: $outofStock)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KotSubmitPrintStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.parcel, parcel) || other.parcel == parcel) &&
            (identical(other.stockout, stockout) ||
                other.stockout == stockout) &&
            const DeepCollectionEquality()
                .equals(other._outofStock, _outofStock));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, parcel, stockout,
      const DeepCollectionEquality().hash(_outofStock));

  /// Create a copy of KotSubmitPrintState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KotSubmitPrintStateImplCopyWith<_$KotSubmitPrintStateImpl> get copyWith =>
      __$$KotSubmitPrintStateImplCopyWithImpl<_$KotSubmitPrintStateImpl>(
          this, _$identity);
}

abstract class _KotSubmitPrintState implements KotSubmitPrintState {
  factory _KotSubmitPrintState(
      {required final bool isLoading,
      required final bool parcel,
      required final bool stockout,
      required final List<kotItem> outofStock}) = _$KotSubmitPrintStateImpl;

  @override
  bool get isLoading;
  @override
  bool get parcel;
  @override
  bool get stockout;
  @override
  List<kotItem> get outofStock;

  /// Create a copy of KotSubmitPrintState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KotSubmitPrintStateImplCopyWith<_$KotSubmitPrintStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
