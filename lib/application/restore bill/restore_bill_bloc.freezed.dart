// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restore_bill_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RestoreBillEvent {
  String get invNo => throw _privateConstructorUsedError;
  String get ordNo => throw _privateConstructorUsedError;
  String get amt => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String invNo, String ordNo, String amt) restore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String invNo, String ordNo, String amt)? restore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String invNo, String ordNo, String amt)? restore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Restore value) restore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Restore value)? restore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Restore value)? restore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of RestoreBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestoreBillEventCopyWith<RestoreBillEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestoreBillEventCopyWith<$Res> {
  factory $RestoreBillEventCopyWith(
          RestoreBillEvent value, $Res Function(RestoreBillEvent) then) =
      _$RestoreBillEventCopyWithImpl<$Res, RestoreBillEvent>;
  @useResult
  $Res call({String invNo, String ordNo, String amt});
}

/// @nodoc
class _$RestoreBillEventCopyWithImpl<$Res, $Val extends RestoreBillEvent>
    implements $RestoreBillEventCopyWith<$Res> {
  _$RestoreBillEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RestoreBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invNo = null,
    Object? ordNo = null,
    Object? amt = null,
  }) {
    return _then(_value.copyWith(
      invNo: null == invNo
          ? _value.invNo
          : invNo // ignore: cast_nullable_to_non_nullable
              as String,
      ordNo: null == ordNo
          ? _value.ordNo
          : ordNo // ignore: cast_nullable_to_non_nullable
              as String,
      amt: null == amt
          ? _value.amt
          : amt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestoreImplCopyWith<$Res>
    implements $RestoreBillEventCopyWith<$Res> {
  factory _$$RestoreImplCopyWith(
          _$RestoreImpl value, $Res Function(_$RestoreImpl) then) =
      __$$RestoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String invNo, String ordNo, String amt});
}

/// @nodoc
class __$$RestoreImplCopyWithImpl<$Res>
    extends _$RestoreBillEventCopyWithImpl<$Res, _$RestoreImpl>
    implements _$$RestoreImplCopyWith<$Res> {
  __$$RestoreImplCopyWithImpl(
      _$RestoreImpl _value, $Res Function(_$RestoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of RestoreBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invNo = null,
    Object? ordNo = null,
    Object? amt = null,
  }) {
    return _then(_$RestoreImpl(
      invNo: null == invNo
          ? _value.invNo
          : invNo // ignore: cast_nullable_to_non_nullable
              as String,
      ordNo: null == ordNo
          ? _value.ordNo
          : ordNo // ignore: cast_nullable_to_non_nullable
              as String,
      amt: null == amt
          ? _value.amt
          : amt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RestoreImpl implements Restore {
  const _$RestoreImpl(
      {required this.invNo, required this.ordNo, required this.amt});

  @override
  final String invNo;
  @override
  final String ordNo;
  @override
  final String amt;

  @override
  String toString() {
    return 'RestoreBillEvent.restore(invNo: $invNo, ordNo: $ordNo, amt: $amt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestoreImpl &&
            (identical(other.invNo, invNo) || other.invNo == invNo) &&
            (identical(other.ordNo, ordNo) || other.ordNo == ordNo) &&
            (identical(other.amt, amt) || other.amt == amt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, invNo, ordNo, amt);

  /// Create a copy of RestoreBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestoreImplCopyWith<_$RestoreImpl> get copyWith =>
      __$$RestoreImplCopyWithImpl<_$RestoreImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String invNo, String ordNo, String amt) restore,
  }) {
    return restore(invNo, ordNo, amt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String invNo, String ordNo, String amt)? restore,
  }) {
    return restore?.call(invNo, ordNo, amt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String invNo, String ordNo, String amt)? restore,
    required TResult orElse(),
  }) {
    if (restore != null) {
      return restore(invNo, ordNo, amt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Restore value) restore,
  }) {
    return restore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Restore value)? restore,
  }) {
    return restore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Restore value)? restore,
    required TResult orElse(),
  }) {
    if (restore != null) {
      return restore(this);
    }
    return orElse();
  }
}

abstract class Restore implements RestoreBillEvent {
  const factory Restore(
      {required final String invNo,
      required final String ordNo,
      required final String amt}) = _$RestoreImpl;

  @override
  String get invNo;
  @override
  String get ordNo;
  @override
  String get amt;

  /// Create a copy of RestoreBillEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestoreImplCopyWith<_$RestoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RestoreBillState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get updated => throw _privateConstructorUsedError;

  /// Create a copy of RestoreBillState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestoreBillStateCopyWith<RestoreBillState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestoreBillStateCopyWith<$Res> {
  factory $RestoreBillStateCopyWith(
          RestoreBillState value, $Res Function(RestoreBillState) then) =
      _$RestoreBillStateCopyWithImpl<$Res, RestoreBillState>;
  @useResult
  $Res call({bool isLoading, bool updated});
}

/// @nodoc
class _$RestoreBillStateCopyWithImpl<$Res, $Val extends RestoreBillState>
    implements $RestoreBillStateCopyWith<$Res> {
  _$RestoreBillStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RestoreBillState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? updated = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestoreBillStateImplCopyWith<$Res>
    implements $RestoreBillStateCopyWith<$Res> {
  factory _$$RestoreBillStateImplCopyWith(_$RestoreBillStateImpl value,
          $Res Function(_$RestoreBillStateImpl) then) =
      __$$RestoreBillStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool updated});
}

/// @nodoc
class __$$RestoreBillStateImplCopyWithImpl<$Res>
    extends _$RestoreBillStateCopyWithImpl<$Res, _$RestoreBillStateImpl>
    implements _$$RestoreBillStateImplCopyWith<$Res> {
  __$$RestoreBillStateImplCopyWithImpl(_$RestoreBillStateImpl _value,
      $Res Function(_$RestoreBillStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RestoreBillState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? updated = null,
  }) {
    return _then(_$RestoreBillStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RestoreBillStateImpl implements _RestoreBillState {
  _$RestoreBillStateImpl({required this.isLoading, required this.updated});

  @override
  final bool isLoading;
  @override
  final bool updated;

  @override
  String toString() {
    return 'RestoreBillState(isLoading: $isLoading, updated: $updated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestoreBillStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.updated, updated) || other.updated == updated));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, updated);

  /// Create a copy of RestoreBillState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestoreBillStateImplCopyWith<_$RestoreBillStateImpl> get copyWith =>
      __$$RestoreBillStateImplCopyWithImpl<_$RestoreBillStateImpl>(
          this, _$identity);
}

abstract class _RestoreBillState implements RestoreBillState {
  factory _RestoreBillState(
      {required final bool isLoading,
      required final bool updated}) = _$RestoreBillStateImpl;

  @override
  bool get isLoading;
  @override
  bool get updated;

  /// Create a copy of RestoreBillState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestoreBillStateImplCopyWith<_$RestoreBillStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
