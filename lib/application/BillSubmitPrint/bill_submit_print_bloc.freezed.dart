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
    required TResult Function() started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
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
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$BillSubmitPrintEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of BillSubmitPrintEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'BillSubmitPrintEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements BillSubmitPrintEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
mixin _$BillSubmitPrintState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get parcel => throw _privateConstructorUsedError;

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
  $Res call({bool isLoading, bool parcel});
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
    Object? parcel = null,
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
  $Res call({bool isLoading, bool parcel});
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
    Object? parcel = null,
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
    ));
  }
}

/// @nodoc

class _$KotSubmitPrintStateImpl implements _KotSubmitPrintState {
  _$KotSubmitPrintStateImpl({required this.isLoading, required this.parcel});

  @override
  final bool isLoading;
  @override
  final bool parcel;

  @override
  String toString() {
    return 'BillSubmitPrintState(isLoading: $isLoading, parcel: $parcel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KotSubmitPrintStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.parcel, parcel) || other.parcel == parcel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, parcel);

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
      required final bool parcel}) = _$KotSubmitPrintStateImpl;

  @override
  bool get isLoading;
  @override
  bool get parcel;

  /// Create a copy of BillSubmitPrintState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KotSubmitPrintStateImplCopyWith<_$KotSubmitPrintStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
