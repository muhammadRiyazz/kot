// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'support_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SupportEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getinfoData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getinfoData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getinfoData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetinfoData value) getinfoData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetinfoData value)? getinfoData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetinfoData value)? getinfoData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportEventCopyWith<$Res> {
  factory $SupportEventCopyWith(
          SupportEvent value, $Res Function(SupportEvent) then) =
      _$SupportEventCopyWithImpl<$Res, SupportEvent>;
}

/// @nodoc
class _$SupportEventCopyWithImpl<$Res, $Val extends SupportEvent>
    implements $SupportEventCopyWith<$Res> {
  _$SupportEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SupportEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetinfoDataImplCopyWith<$Res> {
  factory _$$GetinfoDataImplCopyWith(
          _$GetinfoDataImpl value, $Res Function(_$GetinfoDataImpl) then) =
      __$$GetinfoDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetinfoDataImplCopyWithImpl<$Res>
    extends _$SupportEventCopyWithImpl<$Res, _$GetinfoDataImpl>
    implements _$$GetinfoDataImplCopyWith<$Res> {
  __$$GetinfoDataImplCopyWithImpl(
      _$GetinfoDataImpl _value, $Res Function(_$GetinfoDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of SupportEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetinfoDataImpl implements GetinfoData {
  const _$GetinfoDataImpl();

  @override
  String toString() {
    return 'SupportEvent.getinfoData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetinfoDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getinfoData,
  }) {
    return getinfoData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getinfoData,
  }) {
    return getinfoData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getinfoData,
    required TResult orElse(),
  }) {
    if (getinfoData != null) {
      return getinfoData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetinfoData value) getinfoData,
  }) {
    return getinfoData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetinfoData value)? getinfoData,
  }) {
    return getinfoData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetinfoData value)? getinfoData,
    required TResult orElse(),
  }) {
    if (getinfoData != null) {
      return getinfoData(this);
    }
    return orElse();
  }
}

abstract class GetinfoData implements SupportEvent {
  const factory GetinfoData() = _$GetinfoDataImpl;
}

/// @nodoc
mixin _$SupportState {
  bool get isLoading => throw _privateConstructorUsedError;
  SupportInfo? get supportInfo => throw _privateConstructorUsedError;

  /// Create a copy of SupportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SupportStateCopyWith<SupportState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportStateCopyWith<$Res> {
  factory $SupportStateCopyWith(
          SupportState value, $Res Function(SupportState) then) =
      _$SupportStateCopyWithImpl<$Res, SupportState>;
  @useResult
  $Res call({bool isLoading, SupportInfo? supportInfo});
}

/// @nodoc
class _$SupportStateCopyWithImpl<$Res, $Val extends SupportState>
    implements $SupportStateCopyWith<$Res> {
  _$SupportStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SupportState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? supportInfo = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      supportInfo: freezed == supportInfo
          ? _value.supportInfo
          : supportInfo // ignore: cast_nullable_to_non_nullable
              as SupportInfo?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SupportStateImplCopyWith<$Res>
    implements $SupportStateCopyWith<$Res> {
  factory _$$SupportStateImplCopyWith(
          _$SupportStateImpl value, $Res Function(_$SupportStateImpl) then) =
      __$$SupportStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, SupportInfo? supportInfo});
}

/// @nodoc
class __$$SupportStateImplCopyWithImpl<$Res>
    extends _$SupportStateCopyWithImpl<$Res, _$SupportStateImpl>
    implements _$$SupportStateImplCopyWith<$Res> {
  __$$SupportStateImplCopyWithImpl(
      _$SupportStateImpl _value, $Res Function(_$SupportStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SupportState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? supportInfo = freezed,
  }) {
    return _then(_$SupportStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      supportInfo: freezed == supportInfo
          ? _value.supportInfo
          : supportInfo // ignore: cast_nullable_to_non_nullable
              as SupportInfo?,
    ));
  }
}

/// @nodoc

class _$SupportStateImpl implements _SupportState {
  const _$SupportStateImpl({required this.isLoading, this.supportInfo});

  @override
  final bool isLoading;
  @override
  final SupportInfo? supportInfo;

  @override
  String toString() {
    return 'SupportState(isLoading: $isLoading, supportInfo: $supportInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SupportStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.supportInfo, supportInfo) ||
                other.supportInfo == supportInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, supportInfo);

  /// Create a copy of SupportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SupportStateImplCopyWith<_$SupportStateImpl> get copyWith =>
      __$$SupportStateImplCopyWithImpl<_$SupportStateImpl>(this, _$identity);
}

abstract class _SupportState implements SupportState {
  const factory _SupportState(
      {required final bool isLoading,
      final SupportInfo? supportInfo}) = _$SupportStateImpl;

  @override
  bool get isLoading;
  @override
  SupportInfo? get supportInfo;

  /// Create a copy of SupportState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SupportStateImplCopyWith<_$SupportStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
