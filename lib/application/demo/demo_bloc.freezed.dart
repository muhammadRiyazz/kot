// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'demo_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DemoEvent {
  String get type => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String type) demodatabase,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String type)? demodatabase,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String type)? demodatabase,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Demodatabase value) demodatabase,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Demodatabase value)? demodatabase,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Demodatabase value)? demodatabase,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of DemoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DemoEventCopyWith<DemoEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DemoEventCopyWith<$Res> {
  factory $DemoEventCopyWith(DemoEvent value, $Res Function(DemoEvent) then) =
      _$DemoEventCopyWithImpl<$Res, DemoEvent>;
  @useResult
  $Res call({String type});
}

/// @nodoc
class _$DemoEventCopyWithImpl<$Res, $Val extends DemoEvent>
    implements $DemoEventCopyWith<$Res> {
  _$DemoEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DemoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DemodatabaseImplCopyWith<$Res>
    implements $DemoEventCopyWith<$Res> {
  factory _$$DemodatabaseImplCopyWith(
          _$DemodatabaseImpl value, $Res Function(_$DemodatabaseImpl) then) =
      __$$DemodatabaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type});
}

/// @nodoc
class __$$DemodatabaseImplCopyWithImpl<$Res>
    extends _$DemoEventCopyWithImpl<$Res, _$DemodatabaseImpl>
    implements _$$DemodatabaseImplCopyWith<$Res> {
  __$$DemodatabaseImplCopyWithImpl(
      _$DemodatabaseImpl _value, $Res Function(_$DemodatabaseImpl) _then)
      : super(_value, _then);

  /// Create a copy of DemoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$DemodatabaseImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DemodatabaseImpl implements Demodatabase {
  const _$DemodatabaseImpl({required this.type});

  @override
  final String type;

  @override
  String toString() {
    return 'DemoEvent.demodatabase(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DemodatabaseImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  /// Create a copy of DemoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DemodatabaseImplCopyWith<_$DemodatabaseImpl> get copyWith =>
      __$$DemodatabaseImplCopyWithImpl<_$DemodatabaseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String type) demodatabase,
  }) {
    return demodatabase(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String type)? demodatabase,
  }) {
    return demodatabase?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String type)? demodatabase,
    required TResult orElse(),
  }) {
    if (demodatabase != null) {
      return demodatabase(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Demodatabase value) demodatabase,
  }) {
    return demodatabase(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Demodatabase value)? demodatabase,
  }) {
    return demodatabase?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Demodatabase value)? demodatabase,
    required TResult orElse(),
  }) {
    if (demodatabase != null) {
      return demodatabase(this);
    }
    return orElse();
  }
}

abstract class Demodatabase implements DemoEvent {
  const factory Demodatabase({required final String type}) = _$DemodatabaseImpl;

  @override
  String get type;

  /// Create a copy of DemoEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DemodatabaseImplCopyWith<_$DemodatabaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DemoState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get loged => throw _privateConstructorUsedError;

  /// Create a copy of DemoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DemoStateCopyWith<DemoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DemoStateCopyWith<$Res> {
  factory $DemoStateCopyWith(DemoState value, $Res Function(DemoState) then) =
      _$DemoStateCopyWithImpl<$Res, DemoState>;
  @useResult
  $Res call({bool isLoading, bool loged});
}

/// @nodoc
class _$DemoStateCopyWithImpl<$Res, $Val extends DemoState>
    implements $DemoStateCopyWith<$Res> {
  _$DemoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DemoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? loged = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      loged: null == loged
          ? _value.loged
          : loged // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DemoStateImplCopyWith<$Res>
    implements $DemoStateCopyWith<$Res> {
  factory _$$DemoStateImplCopyWith(
          _$DemoStateImpl value, $Res Function(_$DemoStateImpl) then) =
      __$$DemoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool loged});
}

/// @nodoc
class __$$DemoStateImplCopyWithImpl<$Res>
    extends _$DemoStateCopyWithImpl<$Res, _$DemoStateImpl>
    implements _$$DemoStateImplCopyWith<$Res> {
  __$$DemoStateImplCopyWithImpl(
      _$DemoStateImpl _value, $Res Function(_$DemoStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DemoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? loged = null,
  }) {
    return _then(_$DemoStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      loged: null == loged
          ? _value.loged
          : loged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DemoStateImpl implements _DemoState {
  _$DemoStateImpl({required this.isLoading, required this.loged});

  @override
  final bool isLoading;
  @override
  final bool loged;

  @override
  String toString() {
    return 'DemoState(isLoading: $isLoading, loged: $loged)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DemoStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.loged, loged) || other.loged == loged));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, loged);

  /// Create a copy of DemoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DemoStateImplCopyWith<_$DemoStateImpl> get copyWith =>
      __$$DemoStateImplCopyWithImpl<_$DemoStateImpl>(this, _$identity);
}

abstract class _DemoState implements DemoState {
  factory _DemoState(
      {required final bool isLoading,
      required final bool loged}) = _$DemoStateImpl;

  @override
  bool get isLoading;
  @override
  bool get loged;

  /// Create a copy of DemoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DemoStateImplCopyWith<_$DemoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
