// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customerpart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomerpartEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cfetchlist,
    required TResult Function(CustomerDetails selectedcustomer) changeSelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? cfetchlist,
    TResult? Function(CustomerDetails selectedcustomer)? changeSelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cfetchlist,
    TResult Function(CustomerDetails selectedcustomer)? changeSelection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CFetchlist value) cfetchlist,
    required TResult Function(ChangeSelection value) changeSelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CFetchlist value)? cfetchlist,
    TResult? Function(ChangeSelection value)? changeSelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CFetchlist value)? cfetchlist,
    TResult Function(ChangeSelection value)? changeSelection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerpartEventCopyWith<$Res> {
  factory $CustomerpartEventCopyWith(
          CustomerpartEvent value, $Res Function(CustomerpartEvent) then) =
      _$CustomerpartEventCopyWithImpl<$Res, CustomerpartEvent>;
}

/// @nodoc
class _$CustomerpartEventCopyWithImpl<$Res, $Val extends CustomerpartEvent>
    implements $CustomerpartEventCopyWith<$Res> {
  _$CustomerpartEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerpartEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CFetchlistImplCopyWith<$Res> {
  factory _$$CFetchlistImplCopyWith(
          _$CFetchlistImpl value, $Res Function(_$CFetchlistImpl) then) =
      __$$CFetchlistImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CFetchlistImplCopyWithImpl<$Res>
    extends _$CustomerpartEventCopyWithImpl<$Res, _$CFetchlistImpl>
    implements _$$CFetchlistImplCopyWith<$Res> {
  __$$CFetchlistImplCopyWithImpl(
      _$CFetchlistImpl _value, $Res Function(_$CFetchlistImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerpartEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CFetchlistImpl implements CFetchlist {
  const _$CFetchlistImpl();

  @override
  String toString() {
    return 'CustomerpartEvent.cfetchlist()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CFetchlistImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cfetchlist,
    required TResult Function(CustomerDetails selectedcustomer) changeSelection,
  }) {
    return cfetchlist();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? cfetchlist,
    TResult? Function(CustomerDetails selectedcustomer)? changeSelection,
  }) {
    return cfetchlist?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cfetchlist,
    TResult Function(CustomerDetails selectedcustomer)? changeSelection,
    required TResult orElse(),
  }) {
    if (cfetchlist != null) {
      return cfetchlist();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CFetchlist value) cfetchlist,
    required TResult Function(ChangeSelection value) changeSelection,
  }) {
    return cfetchlist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CFetchlist value)? cfetchlist,
    TResult? Function(ChangeSelection value)? changeSelection,
  }) {
    return cfetchlist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CFetchlist value)? cfetchlist,
    TResult Function(ChangeSelection value)? changeSelection,
    required TResult orElse(),
  }) {
    if (cfetchlist != null) {
      return cfetchlist(this);
    }
    return orElse();
  }
}

abstract class CFetchlist implements CustomerpartEvent {
  const factory CFetchlist() = _$CFetchlistImpl;
}

/// @nodoc
abstract class _$$ChangeSelectionImplCopyWith<$Res> {
  factory _$$ChangeSelectionImplCopyWith(_$ChangeSelectionImpl value,
          $Res Function(_$ChangeSelectionImpl) then) =
      __$$ChangeSelectionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CustomerDetails selectedcustomer});
}

/// @nodoc
class __$$ChangeSelectionImplCopyWithImpl<$Res>
    extends _$CustomerpartEventCopyWithImpl<$Res, _$ChangeSelectionImpl>
    implements _$$ChangeSelectionImplCopyWith<$Res> {
  __$$ChangeSelectionImplCopyWithImpl(
      _$ChangeSelectionImpl _value, $Res Function(_$ChangeSelectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerpartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedcustomer = null,
  }) {
    return _then(_$ChangeSelectionImpl(
      selectedcustomer: null == selectedcustomer
          ? _value.selectedcustomer
          : selectedcustomer // ignore: cast_nullable_to_non_nullable
              as CustomerDetails,
    ));
  }
}

/// @nodoc

class _$ChangeSelectionImpl implements ChangeSelection {
  const _$ChangeSelectionImpl({required this.selectedcustomer});

  @override
  final CustomerDetails selectedcustomer;

  @override
  String toString() {
    return 'CustomerpartEvent.changeSelection(selectedcustomer: $selectedcustomer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeSelectionImpl &&
            (identical(other.selectedcustomer, selectedcustomer) ||
                other.selectedcustomer == selectedcustomer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedcustomer);

  /// Create a copy of CustomerpartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeSelectionImplCopyWith<_$ChangeSelectionImpl> get copyWith =>
      __$$ChangeSelectionImplCopyWithImpl<_$ChangeSelectionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cfetchlist,
    required TResult Function(CustomerDetails selectedcustomer) changeSelection,
  }) {
    return changeSelection(selectedcustomer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? cfetchlist,
    TResult? Function(CustomerDetails selectedcustomer)? changeSelection,
  }) {
    return changeSelection?.call(selectedcustomer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cfetchlist,
    TResult Function(CustomerDetails selectedcustomer)? changeSelection,
    required TResult orElse(),
  }) {
    if (changeSelection != null) {
      return changeSelection(selectedcustomer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CFetchlist value) cfetchlist,
    required TResult Function(ChangeSelection value) changeSelection,
  }) {
    return changeSelection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CFetchlist value)? cfetchlist,
    TResult? Function(ChangeSelection value)? changeSelection,
  }) {
    return changeSelection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CFetchlist value)? cfetchlist,
    TResult Function(ChangeSelection value)? changeSelection,
    required TResult orElse(),
  }) {
    if (changeSelection != null) {
      return changeSelection(this);
    }
    return orElse();
  }
}

abstract class ChangeSelection implements CustomerpartEvent {
  const factory ChangeSelection(
          {required final CustomerDetails selectedcustomer}) =
      _$ChangeSelectionImpl;

  CustomerDetails get selectedcustomer;

  /// Create a copy of CustomerpartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeSelectionImplCopyWith<_$ChangeSelectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CustomerpartState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<CustomerDetails> get customerlist => throw _privateConstructorUsedError;
  CustomerDetails? get selectedcustomer => throw _privateConstructorUsedError;

  /// Create a copy of CustomerpartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerpartStateCopyWith<CustomerpartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerpartStateCopyWith<$Res> {
  factory $CustomerpartStateCopyWith(
          CustomerpartState value, $Res Function(CustomerpartState) then) =
      _$CustomerpartStateCopyWithImpl<$Res, CustomerpartState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<CustomerDetails> customerlist,
      CustomerDetails? selectedcustomer});
}

/// @nodoc
class _$CustomerpartStateCopyWithImpl<$Res, $Val extends CustomerpartState>
    implements $CustomerpartStateCopyWith<$Res> {
  _$CustomerpartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerpartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? customerlist = null,
    Object? selectedcustomer = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      customerlist: null == customerlist
          ? _value.customerlist
          : customerlist // ignore: cast_nullable_to_non_nullable
              as List<CustomerDetails>,
      selectedcustomer: freezed == selectedcustomer
          ? _value.selectedcustomer
          : selectedcustomer // ignore: cast_nullable_to_non_nullable
              as CustomerDetails?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerpartStateImplCopyWith<$Res>
    implements $CustomerpartStateCopyWith<$Res> {
  factory _$$CustomerpartStateImplCopyWith(_$CustomerpartStateImpl value,
          $Res Function(_$CustomerpartStateImpl) then) =
      __$$CustomerpartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<CustomerDetails> customerlist,
      CustomerDetails? selectedcustomer});
}

/// @nodoc
class __$$CustomerpartStateImplCopyWithImpl<$Res>
    extends _$CustomerpartStateCopyWithImpl<$Res, _$CustomerpartStateImpl>
    implements _$$CustomerpartStateImplCopyWith<$Res> {
  __$$CustomerpartStateImplCopyWithImpl(_$CustomerpartStateImpl _value,
      $Res Function(_$CustomerpartStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerpartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? customerlist = null,
    Object? selectedcustomer = freezed,
  }) {
    return _then(_$CustomerpartStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      customerlist: null == customerlist
          ? _value._customerlist
          : customerlist // ignore: cast_nullable_to_non_nullable
              as List<CustomerDetails>,
      selectedcustomer: freezed == selectedcustomer
          ? _value.selectedcustomer
          : selectedcustomer // ignore: cast_nullable_to_non_nullable
              as CustomerDetails?,
    ));
  }
}

/// @nodoc

class _$CustomerpartStateImpl implements _CustomerpartState {
  _$CustomerpartStateImpl(
      {required this.isLoading,
      required final List<CustomerDetails> customerlist,
      this.selectedcustomer})
      : _customerlist = customerlist;

  @override
  final bool isLoading;
  final List<CustomerDetails> _customerlist;
  @override
  List<CustomerDetails> get customerlist {
    if (_customerlist is EqualUnmodifiableListView) return _customerlist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customerlist);
  }

  @override
  final CustomerDetails? selectedcustomer;

  @override
  String toString() {
    return 'CustomerpartState(isLoading: $isLoading, customerlist: $customerlist, selectedcustomer: $selectedcustomer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerpartStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._customerlist, _customerlist) &&
            (identical(other.selectedcustomer, selectedcustomer) ||
                other.selectedcustomer == selectedcustomer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_customerlist), selectedcustomer);

  /// Create a copy of CustomerpartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerpartStateImplCopyWith<_$CustomerpartStateImpl> get copyWith =>
      __$$CustomerpartStateImplCopyWithImpl<_$CustomerpartStateImpl>(
          this, _$identity);
}

abstract class _CustomerpartState implements CustomerpartState {
  factory _CustomerpartState(
      {required final bool isLoading,
      required final List<CustomerDetails> customerlist,
      final CustomerDetails? selectedcustomer}) = _$CustomerpartStateImpl;

  @override
  bool get isLoading;
  @override
  List<CustomerDetails> get customerlist;
  @override
  CustomerDetails? get selectedcustomer;

  /// Create a copy of CustomerpartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerpartStateImplCopyWith<_$CustomerpartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
