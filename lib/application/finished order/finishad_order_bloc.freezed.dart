// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'finishad_order_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FinishadOrderEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchBills,
    required TResult Function(String invNo) fetchDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchBills,
    TResult? Function(String invNo)? fetchDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchBills,
    TResult Function(String invNo)? fetchDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchBills value) fetchBills,
    required TResult Function(FetchDetails value) fetchDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchBills value)? fetchBills,
    TResult? Function(FetchDetails value)? fetchDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchBills value)? fetchBills,
    TResult Function(FetchDetails value)? fetchDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinishadOrderEventCopyWith<$Res> {
  factory $FinishadOrderEventCopyWith(
          FinishadOrderEvent value, $Res Function(FinishadOrderEvent) then) =
      _$FinishadOrderEventCopyWithImpl<$Res, FinishadOrderEvent>;
}

/// @nodoc
class _$FinishadOrderEventCopyWithImpl<$Res, $Val extends FinishadOrderEvent>
    implements $FinishadOrderEventCopyWith<$Res> {
  _$FinishadOrderEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FinishadOrderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchBillsImplCopyWith<$Res> {
  factory _$$FetchBillsImplCopyWith(
          _$FetchBillsImpl value, $Res Function(_$FetchBillsImpl) then) =
      __$$FetchBillsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchBillsImplCopyWithImpl<$Res>
    extends _$FinishadOrderEventCopyWithImpl<$Res, _$FetchBillsImpl>
    implements _$$FetchBillsImplCopyWith<$Res> {
  __$$FetchBillsImplCopyWithImpl(
      _$FetchBillsImpl _value, $Res Function(_$FetchBillsImpl) _then)
      : super(_value, _then);

  /// Create a copy of FinishadOrderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchBillsImpl implements FetchBills {
  const _$FetchBillsImpl();

  @override
  String toString() {
    return 'FinishadOrderEvent.fetchBills()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchBillsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchBills,
    required TResult Function(String invNo) fetchDetails,
  }) {
    return fetchBills();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchBills,
    TResult? Function(String invNo)? fetchDetails,
  }) {
    return fetchBills?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchBills,
    TResult Function(String invNo)? fetchDetails,
    required TResult orElse(),
  }) {
    if (fetchBills != null) {
      return fetchBills();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchBills value) fetchBills,
    required TResult Function(FetchDetails value) fetchDetails,
  }) {
    return fetchBills(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchBills value)? fetchBills,
    TResult? Function(FetchDetails value)? fetchDetails,
  }) {
    return fetchBills?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchBills value)? fetchBills,
    TResult Function(FetchDetails value)? fetchDetails,
    required TResult orElse(),
  }) {
    if (fetchBills != null) {
      return fetchBills(this);
    }
    return orElse();
  }
}

abstract class FetchBills implements FinishadOrderEvent {
  const factory FetchBills() = _$FetchBillsImpl;
}

/// @nodoc
abstract class _$$FetchDetailsImplCopyWith<$Res> {
  factory _$$FetchDetailsImplCopyWith(
          _$FetchDetailsImpl value, $Res Function(_$FetchDetailsImpl) then) =
      __$$FetchDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String invNo});
}

/// @nodoc
class __$$FetchDetailsImplCopyWithImpl<$Res>
    extends _$FinishadOrderEventCopyWithImpl<$Res, _$FetchDetailsImpl>
    implements _$$FetchDetailsImplCopyWith<$Res> {
  __$$FetchDetailsImplCopyWithImpl(
      _$FetchDetailsImpl _value, $Res Function(_$FetchDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of FinishadOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invNo = null,
  }) {
    return _then(_$FetchDetailsImpl(
      invNo: null == invNo
          ? _value.invNo
          : invNo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchDetailsImpl implements FetchDetails {
  const _$FetchDetailsImpl({required this.invNo});

  @override
  final String invNo;

  @override
  String toString() {
    return 'FinishadOrderEvent.fetchDetails(invNo: $invNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchDetailsImpl &&
            (identical(other.invNo, invNo) || other.invNo == invNo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, invNo);

  /// Create a copy of FinishadOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchDetailsImplCopyWith<_$FetchDetailsImpl> get copyWith =>
      __$$FetchDetailsImplCopyWithImpl<_$FetchDetailsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchBills,
    required TResult Function(String invNo) fetchDetails,
  }) {
    return fetchDetails(invNo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchBills,
    TResult? Function(String invNo)? fetchDetails,
  }) {
    return fetchDetails?.call(invNo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchBills,
    TResult Function(String invNo)? fetchDetails,
    required TResult orElse(),
  }) {
    if (fetchDetails != null) {
      return fetchDetails(invNo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchBills value) fetchBills,
    required TResult Function(FetchDetails value) fetchDetails,
  }) {
    return fetchDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchBills value)? fetchBills,
    TResult? Function(FetchDetails value)? fetchDetails,
  }) {
    return fetchDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchBills value)? fetchBills,
    TResult Function(FetchDetails value)? fetchDetails,
    required TResult orElse(),
  }) {
    if (fetchDetails != null) {
      return fetchDetails(this);
    }
    return orElse();
  }
}

abstract class FetchDetails implements FinishadOrderEvent {
  const factory FetchDetails({required final String invNo}) =
      _$FetchDetailsImpl;

  String get invNo;

  /// Create a copy of FinishadOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchDetailsImplCopyWith<_$FetchDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FinishadOrderState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<InvoicesList> get invoices => throw _privateConstructorUsedError;
  List<InvoiceItem>? get invoiceDetails => throw _privateConstructorUsedError;

  /// Create a copy of FinishadOrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FinishadOrderStateCopyWith<FinishadOrderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinishadOrderStateCopyWith<$Res> {
  factory $FinishadOrderStateCopyWith(
          FinishadOrderState value, $Res Function(FinishadOrderState) then) =
      _$FinishadOrderStateCopyWithImpl<$Res, FinishadOrderState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<InvoicesList> invoices,
      List<InvoiceItem>? invoiceDetails});
}

/// @nodoc
class _$FinishadOrderStateCopyWithImpl<$Res, $Val extends FinishadOrderState>
    implements $FinishadOrderStateCopyWith<$Res> {
  _$FinishadOrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FinishadOrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? invoices = null,
    Object? invoiceDetails = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      invoices: null == invoices
          ? _value.invoices
          : invoices // ignore: cast_nullable_to_non_nullable
              as List<InvoicesList>,
      invoiceDetails: freezed == invoiceDetails
          ? _value.invoiceDetails
          : invoiceDetails // ignore: cast_nullable_to_non_nullable
              as List<InvoiceItem>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrdersStateImplCopyWith<$Res>
    implements $FinishadOrderStateCopyWith<$Res> {
  factory _$$OrdersStateImplCopyWith(
          _$OrdersStateImpl value, $Res Function(_$OrdersStateImpl) then) =
      __$$OrdersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<InvoicesList> invoices,
      List<InvoiceItem>? invoiceDetails});
}

/// @nodoc
class __$$OrdersStateImplCopyWithImpl<$Res>
    extends _$FinishadOrderStateCopyWithImpl<$Res, _$OrdersStateImpl>
    implements _$$OrdersStateImplCopyWith<$Res> {
  __$$OrdersStateImplCopyWithImpl(
      _$OrdersStateImpl _value, $Res Function(_$OrdersStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FinishadOrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? invoices = null,
    Object? invoiceDetails = freezed,
  }) {
    return _then(_$OrdersStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      invoices: null == invoices
          ? _value._invoices
          : invoices // ignore: cast_nullable_to_non_nullable
              as List<InvoicesList>,
      invoiceDetails: freezed == invoiceDetails
          ? _value._invoiceDetails
          : invoiceDetails // ignore: cast_nullable_to_non_nullable
              as List<InvoiceItem>?,
    ));
  }
}

/// @nodoc

class _$OrdersStateImpl implements _OrdersState {
  _$OrdersStateImpl(
      {required this.isLoading,
      required final List<InvoicesList> invoices,
      final List<InvoiceItem>? invoiceDetails})
      : _invoices = invoices,
        _invoiceDetails = invoiceDetails;

  @override
  final bool isLoading;
  final List<InvoicesList> _invoices;
  @override
  List<InvoicesList> get invoices {
    if (_invoices is EqualUnmodifiableListView) return _invoices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invoices);
  }

  final List<InvoiceItem>? _invoiceDetails;
  @override
  List<InvoiceItem>? get invoiceDetails {
    final value = _invoiceDetails;
    if (value == null) return null;
    if (_invoiceDetails is EqualUnmodifiableListView) return _invoiceDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FinishadOrderState(isLoading: $isLoading, invoices: $invoices, invoiceDetails: $invoiceDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrdersStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._invoices, _invoices) &&
            const DeepCollectionEquality()
                .equals(other._invoiceDetails, _invoiceDetails));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_invoices),
      const DeepCollectionEquality().hash(_invoiceDetails));

  /// Create a copy of FinishadOrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrdersStateImplCopyWith<_$OrdersStateImpl> get copyWith =>
      __$$OrdersStateImplCopyWithImpl<_$OrdersStateImpl>(this, _$identity);
}

abstract class _OrdersState implements FinishadOrderState {
  factory _OrdersState(
      {required final bool isLoading,
      required final List<InvoicesList> invoices,
      final List<InvoiceItem>? invoiceDetails}) = _$OrdersStateImpl;

  @override
  bool get isLoading;
  @override
  List<InvoicesList> get invoices;
  @override
  List<InvoiceItem>? get invoiceDetails;

  /// Create a copy of FinishadOrderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrdersStateImplCopyWith<_$OrdersStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
