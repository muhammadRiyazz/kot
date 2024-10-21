// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'items_to_kot_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ItemsToKotEvent {
  List<OrderItem> get items => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<OrderItem> items) itemsFromOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<OrderItem> items)? itemsFromOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<OrderItem> items)? itemsFromOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(itemsFromOrder value) itemsFromOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(itemsFromOrder value)? itemsFromOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(itemsFromOrder value)? itemsFromOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ItemsToKotEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemsToKotEventCopyWith<ItemsToKotEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemsToKotEventCopyWith<$Res> {
  factory $ItemsToKotEventCopyWith(
          ItemsToKotEvent value, $Res Function(ItemsToKotEvent) then) =
      _$ItemsToKotEventCopyWithImpl<$Res, ItemsToKotEvent>;
  @useResult
  $Res call({List<OrderItem> items});
}

/// @nodoc
class _$ItemsToKotEventCopyWithImpl<$Res, $Val extends ItemsToKotEvent>
    implements $ItemsToKotEventCopyWith<$Res> {
  _$ItemsToKotEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItemsToKotEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$itemsFromOrderImplCopyWith<$Res>
    implements $ItemsToKotEventCopyWith<$Res> {
  factory _$$itemsFromOrderImplCopyWith(_$itemsFromOrderImpl value,
          $Res Function(_$itemsFromOrderImpl) then) =
      __$$itemsFromOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<OrderItem> items});
}

/// @nodoc
class __$$itemsFromOrderImplCopyWithImpl<$Res>
    extends _$ItemsToKotEventCopyWithImpl<$Res, _$itemsFromOrderImpl>
    implements _$$itemsFromOrderImplCopyWith<$Res> {
  __$$itemsFromOrderImplCopyWithImpl(
      _$itemsFromOrderImpl _value, $Res Function(_$itemsFromOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItemsToKotEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$itemsFromOrderImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
    ));
  }
}

/// @nodoc

class _$itemsFromOrderImpl implements itemsFromOrder {
  const _$itemsFromOrderImpl({required final List<OrderItem> items})
      : _items = items;

  final List<OrderItem> _items;
  @override
  List<OrderItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ItemsToKotEvent.itemsFromOrder(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$itemsFromOrderImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of ItemsToKotEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$itemsFromOrderImplCopyWith<_$itemsFromOrderImpl> get copyWith =>
      __$$itemsFromOrderImplCopyWithImpl<_$itemsFromOrderImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<OrderItem> items) itemsFromOrder,
  }) {
    return itemsFromOrder(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<OrderItem> items)? itemsFromOrder,
  }) {
    return itemsFromOrder?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<OrderItem> items)? itemsFromOrder,
    required TResult orElse(),
  }) {
    if (itemsFromOrder != null) {
      return itemsFromOrder(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(itemsFromOrder value) itemsFromOrder,
  }) {
    return itemsFromOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(itemsFromOrder value)? itemsFromOrder,
  }) {
    return itemsFromOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(itemsFromOrder value)? itemsFromOrder,
    required TResult orElse(),
  }) {
    if (itemsFromOrder != null) {
      return itemsFromOrder(this);
    }
    return orElse();
  }
}

abstract class itemsFromOrder implements ItemsToKotEvent {
  const factory itemsFromOrder({required final List<OrderItem> items}) =
      _$itemsFromOrderImpl;

  @override
  List<OrderItem> get items;

  /// Create a copy of ItemsToKotEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$itemsFromOrderImplCopyWith<_$itemsFromOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ItemsToKotState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<OrderItem> get selectedItems => throw _privateConstructorUsedError;

  /// Create a copy of ItemsToKotState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemsToKotStateCopyWith<ItemsToKotState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemsToKotStateCopyWith<$Res> {
  factory $ItemsToKotStateCopyWith(
          ItemsToKotState value, $Res Function(ItemsToKotState) then) =
      _$ItemsToKotStateCopyWithImpl<$Res, ItemsToKotState>;
  @useResult
  $Res call({bool isLoading, List<OrderItem> selectedItems});
}

/// @nodoc
class _$ItemsToKotStateCopyWithImpl<$Res, $Val extends ItemsToKotState>
    implements $ItemsToKotStateCopyWith<$Res> {
  _$ItemsToKotStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItemsToKotState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? selectedItems = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedItems: null == selectedItems
          ? _value.selectedItems
          : selectedItems // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemsToKotStateImplCopyWith<$Res>
    implements $ItemsToKotStateCopyWith<$Res> {
  factory _$$ItemsToKotStateImplCopyWith(_$ItemsToKotStateImpl value,
          $Res Function(_$ItemsToKotStateImpl) then) =
      __$$ItemsToKotStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<OrderItem> selectedItems});
}

/// @nodoc
class __$$ItemsToKotStateImplCopyWithImpl<$Res>
    extends _$ItemsToKotStateCopyWithImpl<$Res, _$ItemsToKotStateImpl>
    implements _$$ItemsToKotStateImplCopyWith<$Res> {
  __$$ItemsToKotStateImplCopyWithImpl(
      _$ItemsToKotStateImpl _value, $Res Function(_$ItemsToKotStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItemsToKotState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? selectedItems = null,
  }) {
    return _then(_$ItemsToKotStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedItems: null == selectedItems
          ? _value._selectedItems
          : selectedItems // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
    ));
  }
}

/// @nodoc

class _$ItemsToKotStateImpl implements _ItemsToKotState {
  _$ItemsToKotStateImpl(
      {required this.isLoading, required final List<OrderItem> selectedItems})
      : _selectedItems = selectedItems;

  @override
  final bool isLoading;
  final List<OrderItem> _selectedItems;
  @override
  List<OrderItem> get selectedItems {
    if (_selectedItems is EqualUnmodifiableListView) return _selectedItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedItems);
  }

  @override
  String toString() {
    return 'ItemsToKotState(isLoading: $isLoading, selectedItems: $selectedItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemsToKotStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._selectedItems, _selectedItems));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_selectedItems));

  /// Create a copy of ItemsToKotState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemsToKotStateImplCopyWith<_$ItemsToKotStateImpl> get copyWith =>
      __$$ItemsToKotStateImplCopyWithImpl<_$ItemsToKotStateImpl>(
          this, _$identity);
}

abstract class _ItemsToKotState implements ItemsToKotState {
  factory _ItemsToKotState(
      {required final bool isLoading,
      required final List<OrderItem> selectedItems}) = _$ItemsToKotStateImpl;

  @override
  bool get isLoading;
  @override
  List<OrderItem> get selectedItems;

  /// Create a copy of ItemsToKotState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemsToKotStateImplCopyWith<_$ItemsToKotStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
