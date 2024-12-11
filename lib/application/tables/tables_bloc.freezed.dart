// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tables_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TablesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String tablename) select,
    required TResult Function() taledata,
    required TResult Function(String floor) chooseFloor,
    required TResult Function(String tablename, String orderNo) change,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String tablename)? select,
    TResult? Function()? taledata,
    TResult? Function(String floor)? chooseFloor,
    TResult? Function(String tablename, String orderNo)? change,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String tablename)? select,
    TResult Function()? taledata,
    TResult Function(String floor)? chooseFloor,
    TResult Function(String tablename, String orderNo)? change,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Select value) select,
    required TResult Function(TableData value) taledata,
    required TResult Function(ChooseFloor value) chooseFloor,
    required TResult Function(Change value) change,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Select value)? select,
    TResult? Function(TableData value)? taledata,
    TResult? Function(ChooseFloor value)? chooseFloor,
    TResult? Function(Change value)? change,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Select value)? select,
    TResult Function(TableData value)? taledata,
    TResult Function(ChooseFloor value)? chooseFloor,
    TResult Function(Change value)? change,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TablesEventCopyWith<$Res> {
  factory $TablesEventCopyWith(
          TablesEvent value, $Res Function(TablesEvent) then) =
      _$TablesEventCopyWithImpl<$Res, TablesEvent>;
}

/// @nodoc
class _$TablesEventCopyWithImpl<$Res, $Val extends TablesEvent>
    implements $TablesEventCopyWith<$Res> {
  _$TablesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TablesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SelectImplCopyWith<$Res> {
  factory _$$SelectImplCopyWith(
          _$SelectImpl value, $Res Function(_$SelectImpl) then) =
      __$$SelectImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String tablename});
}

/// @nodoc
class __$$SelectImplCopyWithImpl<$Res>
    extends _$TablesEventCopyWithImpl<$Res, _$SelectImpl>
    implements _$$SelectImplCopyWith<$Res> {
  __$$SelectImplCopyWithImpl(
      _$SelectImpl _value, $Res Function(_$SelectImpl) _then)
      : super(_value, _then);

  /// Create a copy of TablesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tablename = null,
  }) {
    return _then(_$SelectImpl(
      tablename: null == tablename
          ? _value.tablename
          : tablename // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SelectImpl implements Select {
  const _$SelectImpl({required this.tablename});

  @override
  final String tablename;

  @override
  String toString() {
    return 'TablesEvent.select(tablename: $tablename)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectImpl &&
            (identical(other.tablename, tablename) ||
                other.tablename == tablename));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tablename);

  /// Create a copy of TablesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectImplCopyWith<_$SelectImpl> get copyWith =>
      __$$SelectImplCopyWithImpl<_$SelectImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String tablename) select,
    required TResult Function() taledata,
    required TResult Function(String floor) chooseFloor,
    required TResult Function(String tablename, String orderNo) change,
  }) {
    return select(tablename);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String tablename)? select,
    TResult? Function()? taledata,
    TResult? Function(String floor)? chooseFloor,
    TResult? Function(String tablename, String orderNo)? change,
  }) {
    return select?.call(tablename);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String tablename)? select,
    TResult Function()? taledata,
    TResult Function(String floor)? chooseFloor,
    TResult Function(String tablename, String orderNo)? change,
    required TResult orElse(),
  }) {
    if (select != null) {
      return select(tablename);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Select value) select,
    required TResult Function(TableData value) taledata,
    required TResult Function(ChooseFloor value) chooseFloor,
    required TResult Function(Change value) change,
  }) {
    return select(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Select value)? select,
    TResult? Function(TableData value)? taledata,
    TResult? Function(ChooseFloor value)? chooseFloor,
    TResult? Function(Change value)? change,
  }) {
    return select?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Select value)? select,
    TResult Function(TableData value)? taledata,
    TResult Function(ChooseFloor value)? chooseFloor,
    TResult Function(Change value)? change,
    required TResult orElse(),
  }) {
    if (select != null) {
      return select(this);
    }
    return orElse();
  }
}

abstract class Select implements TablesEvent {
  const factory Select({required final String tablename}) = _$SelectImpl;

  String get tablename;

  /// Create a copy of TablesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectImplCopyWith<_$SelectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TableDataImplCopyWith<$Res> {
  factory _$$TableDataImplCopyWith(
          _$TableDataImpl value, $Res Function(_$TableDataImpl) then) =
      __$$TableDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TableDataImplCopyWithImpl<$Res>
    extends _$TablesEventCopyWithImpl<$Res, _$TableDataImpl>
    implements _$$TableDataImplCopyWith<$Res> {
  __$$TableDataImplCopyWithImpl(
      _$TableDataImpl _value, $Res Function(_$TableDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of TablesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TableDataImpl implements TableData {
  const _$TableDataImpl();

  @override
  String toString() {
    return 'TablesEvent.taledata()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TableDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String tablename) select,
    required TResult Function() taledata,
    required TResult Function(String floor) chooseFloor,
    required TResult Function(String tablename, String orderNo) change,
  }) {
    return taledata();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String tablename)? select,
    TResult? Function()? taledata,
    TResult? Function(String floor)? chooseFloor,
    TResult? Function(String tablename, String orderNo)? change,
  }) {
    return taledata?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String tablename)? select,
    TResult Function()? taledata,
    TResult Function(String floor)? chooseFloor,
    TResult Function(String tablename, String orderNo)? change,
    required TResult orElse(),
  }) {
    if (taledata != null) {
      return taledata();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Select value) select,
    required TResult Function(TableData value) taledata,
    required TResult Function(ChooseFloor value) chooseFloor,
    required TResult Function(Change value) change,
  }) {
    return taledata(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Select value)? select,
    TResult? Function(TableData value)? taledata,
    TResult? Function(ChooseFloor value)? chooseFloor,
    TResult? Function(Change value)? change,
  }) {
    return taledata?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Select value)? select,
    TResult Function(TableData value)? taledata,
    TResult Function(ChooseFloor value)? chooseFloor,
    TResult Function(Change value)? change,
    required TResult orElse(),
  }) {
    if (taledata != null) {
      return taledata(this);
    }
    return orElse();
  }
}

abstract class TableData implements TablesEvent {
  const factory TableData() = _$TableDataImpl;
}

/// @nodoc
abstract class _$$ChooseFloorImplCopyWith<$Res> {
  factory _$$ChooseFloorImplCopyWith(
          _$ChooseFloorImpl value, $Res Function(_$ChooseFloorImpl) then) =
      __$$ChooseFloorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String floor});
}

/// @nodoc
class __$$ChooseFloorImplCopyWithImpl<$Res>
    extends _$TablesEventCopyWithImpl<$Res, _$ChooseFloorImpl>
    implements _$$ChooseFloorImplCopyWith<$Res> {
  __$$ChooseFloorImplCopyWithImpl(
      _$ChooseFloorImpl _value, $Res Function(_$ChooseFloorImpl) _then)
      : super(_value, _then);

  /// Create a copy of TablesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? floor = null,
  }) {
    return _then(_$ChooseFloorImpl(
      floor: null == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChooseFloorImpl implements ChooseFloor {
  const _$ChooseFloorImpl({required this.floor});

  @override
  final String floor;

  @override
  String toString() {
    return 'TablesEvent.chooseFloor(floor: $floor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChooseFloorImpl &&
            (identical(other.floor, floor) || other.floor == floor));
  }

  @override
  int get hashCode => Object.hash(runtimeType, floor);

  /// Create a copy of TablesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChooseFloorImplCopyWith<_$ChooseFloorImpl> get copyWith =>
      __$$ChooseFloorImplCopyWithImpl<_$ChooseFloorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String tablename) select,
    required TResult Function() taledata,
    required TResult Function(String floor) chooseFloor,
    required TResult Function(String tablename, String orderNo) change,
  }) {
    return chooseFloor(floor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String tablename)? select,
    TResult? Function()? taledata,
    TResult? Function(String floor)? chooseFloor,
    TResult? Function(String tablename, String orderNo)? change,
  }) {
    return chooseFloor?.call(floor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String tablename)? select,
    TResult Function()? taledata,
    TResult Function(String floor)? chooseFloor,
    TResult Function(String tablename, String orderNo)? change,
    required TResult orElse(),
  }) {
    if (chooseFloor != null) {
      return chooseFloor(floor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Select value) select,
    required TResult Function(TableData value) taledata,
    required TResult Function(ChooseFloor value) chooseFloor,
    required TResult Function(Change value) change,
  }) {
    return chooseFloor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Select value)? select,
    TResult? Function(TableData value)? taledata,
    TResult? Function(ChooseFloor value)? chooseFloor,
    TResult? Function(Change value)? change,
  }) {
    return chooseFloor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Select value)? select,
    TResult Function(TableData value)? taledata,
    TResult Function(ChooseFloor value)? chooseFloor,
    TResult Function(Change value)? change,
    required TResult orElse(),
  }) {
    if (chooseFloor != null) {
      return chooseFloor(this);
    }
    return orElse();
  }
}

abstract class ChooseFloor implements TablesEvent {
  const factory ChooseFloor({required final String floor}) = _$ChooseFloorImpl;

  String get floor;

  /// Create a copy of TablesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChooseFloorImplCopyWith<_$ChooseFloorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeImplCopyWith<$Res> {
  factory _$$ChangeImplCopyWith(
          _$ChangeImpl value, $Res Function(_$ChangeImpl) then) =
      __$$ChangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String tablename, String orderNo});
}

/// @nodoc
class __$$ChangeImplCopyWithImpl<$Res>
    extends _$TablesEventCopyWithImpl<$Res, _$ChangeImpl>
    implements _$$ChangeImplCopyWith<$Res> {
  __$$ChangeImplCopyWithImpl(
      _$ChangeImpl _value, $Res Function(_$ChangeImpl) _then)
      : super(_value, _then);

  /// Create a copy of TablesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tablename = null,
    Object? orderNo = null,
  }) {
    return _then(_$ChangeImpl(
      tablename: null == tablename
          ? _value.tablename
          : tablename // ignore: cast_nullable_to_non_nullable
              as String,
      orderNo: null == orderNo
          ? _value.orderNo
          : orderNo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeImpl implements Change {
  const _$ChangeImpl({required this.tablename, required this.orderNo});

  @override
  final String tablename;
  @override
  final String orderNo;

  @override
  String toString() {
    return 'TablesEvent.change(tablename: $tablename, orderNo: $orderNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeImpl &&
            (identical(other.tablename, tablename) ||
                other.tablename == tablename) &&
            (identical(other.orderNo, orderNo) || other.orderNo == orderNo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tablename, orderNo);

  /// Create a copy of TablesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeImplCopyWith<_$ChangeImpl> get copyWith =>
      __$$ChangeImplCopyWithImpl<_$ChangeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String tablename) select,
    required TResult Function() taledata,
    required TResult Function(String floor) chooseFloor,
    required TResult Function(String tablename, String orderNo) change,
  }) {
    return change(tablename, orderNo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String tablename)? select,
    TResult? Function()? taledata,
    TResult? Function(String floor)? chooseFloor,
    TResult? Function(String tablename, String orderNo)? change,
  }) {
    return change?.call(tablename, orderNo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String tablename)? select,
    TResult Function()? taledata,
    TResult Function(String floor)? chooseFloor,
    TResult Function(String tablename, String orderNo)? change,
    required TResult orElse(),
  }) {
    if (change != null) {
      return change(tablename, orderNo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Select value) select,
    required TResult Function(TableData value) taledata,
    required TResult Function(ChooseFloor value) chooseFloor,
    required TResult Function(Change value) change,
  }) {
    return change(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Select value)? select,
    TResult? Function(TableData value)? taledata,
    TResult? Function(ChooseFloor value)? chooseFloor,
    TResult? Function(Change value)? change,
  }) {
    return change?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Select value)? select,
    TResult Function(TableData value)? taledata,
    TResult Function(ChooseFloor value)? chooseFloor,
    TResult Function(Change value)? change,
    required TResult orElse(),
  }) {
    if (change != null) {
      return change(this);
    }
    return orElse();
  }
}

abstract class Change implements TablesEvent {
  const factory Change(
      {required final String tablename,
      required final String orderNo}) = _$ChangeImpl;

  String get tablename;
  String get orderNo;

  /// Create a copy of TablesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeImplCopyWith<_$ChangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TablesState {
  String? get selectedtable => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get changed => throw _privateConstructorUsedError;
  List<String> get floors => throw _privateConstructorUsedError;
  String? get selectedFloor => throw _privateConstructorUsedError;
  List<TableInfo> get tablesinfolist => throw _privateConstructorUsedError;
  List<TableModel> get tables => throw _privateConstructorUsedError;

  /// Create a copy of TablesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TablesStateCopyWith<TablesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TablesStateCopyWith<$Res> {
  factory $TablesStateCopyWith(
          TablesState value, $Res Function(TablesState) then) =
      _$TablesStateCopyWithImpl<$Res, TablesState>;
  @useResult
  $Res call(
      {String? selectedtable,
      bool isLoading,
      bool changed,
      List<String> floors,
      String? selectedFloor,
      List<TableInfo> tablesinfolist,
      List<TableModel> tables});
}

/// @nodoc
class _$TablesStateCopyWithImpl<$Res, $Val extends TablesState>
    implements $TablesStateCopyWith<$Res> {
  _$TablesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TablesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedtable = freezed,
    Object? isLoading = null,
    Object? changed = null,
    Object? floors = null,
    Object? selectedFloor = freezed,
    Object? tablesinfolist = null,
    Object? tables = null,
  }) {
    return _then(_value.copyWith(
      selectedtable: freezed == selectedtable
          ? _value.selectedtable
          : selectedtable // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      changed: null == changed
          ? _value.changed
          : changed // ignore: cast_nullable_to_non_nullable
              as bool,
      floors: null == floors
          ? _value.floors
          : floors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedFloor: freezed == selectedFloor
          ? _value.selectedFloor
          : selectedFloor // ignore: cast_nullable_to_non_nullable
              as String?,
      tablesinfolist: null == tablesinfolist
          ? _value.tablesinfolist
          : tablesinfolist // ignore: cast_nullable_to_non_nullable
              as List<TableInfo>,
      tables: null == tables
          ? _value.tables
          : tables // ignore: cast_nullable_to_non_nullable
              as List<TableModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TablesStateImplCopyWith<$Res>
    implements $TablesStateCopyWith<$Res> {
  factory _$$TablesStateImplCopyWith(
          _$TablesStateImpl value, $Res Function(_$TablesStateImpl) then) =
      __$$TablesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? selectedtable,
      bool isLoading,
      bool changed,
      List<String> floors,
      String? selectedFloor,
      List<TableInfo> tablesinfolist,
      List<TableModel> tables});
}

/// @nodoc
class __$$TablesStateImplCopyWithImpl<$Res>
    extends _$TablesStateCopyWithImpl<$Res, _$TablesStateImpl>
    implements _$$TablesStateImplCopyWith<$Res> {
  __$$TablesStateImplCopyWithImpl(
      _$TablesStateImpl _value, $Res Function(_$TablesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TablesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedtable = freezed,
    Object? isLoading = null,
    Object? changed = null,
    Object? floors = null,
    Object? selectedFloor = freezed,
    Object? tablesinfolist = null,
    Object? tables = null,
  }) {
    return _then(_$TablesStateImpl(
      selectedtable: freezed == selectedtable
          ? _value.selectedtable
          : selectedtable // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      changed: null == changed
          ? _value.changed
          : changed // ignore: cast_nullable_to_non_nullable
              as bool,
      floors: null == floors
          ? _value._floors
          : floors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedFloor: freezed == selectedFloor
          ? _value.selectedFloor
          : selectedFloor // ignore: cast_nullable_to_non_nullable
              as String?,
      tablesinfolist: null == tablesinfolist
          ? _value._tablesinfolist
          : tablesinfolist // ignore: cast_nullable_to_non_nullable
              as List<TableInfo>,
      tables: null == tables
          ? _value._tables
          : tables // ignore: cast_nullable_to_non_nullable
              as List<TableModel>,
    ));
  }
}

/// @nodoc

class _$TablesStateImpl implements _TablesState {
  _$TablesStateImpl(
      {this.selectedtable,
      required this.isLoading,
      required this.changed,
      required final List<String> floors,
      this.selectedFloor,
      required final List<TableInfo> tablesinfolist,
      required final List<TableModel> tables})
      : _floors = floors,
        _tablesinfolist = tablesinfolist,
        _tables = tables;

  @override
  final String? selectedtable;
  @override
  final bool isLoading;
  @override
  final bool changed;
  final List<String> _floors;
  @override
  List<String> get floors {
    if (_floors is EqualUnmodifiableListView) return _floors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_floors);
  }

  @override
  final String? selectedFloor;
  final List<TableInfo> _tablesinfolist;
  @override
  List<TableInfo> get tablesinfolist {
    if (_tablesinfolist is EqualUnmodifiableListView) return _tablesinfolist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tablesinfolist);
  }

  final List<TableModel> _tables;
  @override
  List<TableModel> get tables {
    if (_tables is EqualUnmodifiableListView) return _tables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tables);
  }

  @override
  String toString() {
    return 'TablesState(selectedtable: $selectedtable, isLoading: $isLoading, changed: $changed, floors: $floors, selectedFloor: $selectedFloor, tablesinfolist: $tablesinfolist, tables: $tables)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TablesStateImpl &&
            (identical(other.selectedtable, selectedtable) ||
                other.selectedtable == selectedtable) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.changed, changed) || other.changed == changed) &&
            const DeepCollectionEquality().equals(other._floors, _floors) &&
            (identical(other.selectedFloor, selectedFloor) ||
                other.selectedFloor == selectedFloor) &&
            const DeepCollectionEquality()
                .equals(other._tablesinfolist, _tablesinfolist) &&
            const DeepCollectionEquality().equals(other._tables, _tables));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedtable,
      isLoading,
      changed,
      const DeepCollectionEquality().hash(_floors),
      selectedFloor,
      const DeepCollectionEquality().hash(_tablesinfolist),
      const DeepCollectionEquality().hash(_tables));

  /// Create a copy of TablesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TablesStateImplCopyWith<_$TablesStateImpl> get copyWith =>
      __$$TablesStateImplCopyWithImpl<_$TablesStateImpl>(this, _$identity);
}

abstract class _TablesState implements TablesState {
  factory _TablesState(
      {final String? selectedtable,
      required final bool isLoading,
      required final bool changed,
      required final List<String> floors,
      final String? selectedFloor,
      required final List<TableInfo> tablesinfolist,
      required final List<TableModel> tables}) = _$TablesStateImpl;

  @override
  String? get selectedtable;
  @override
  bool get isLoading;
  @override
  bool get changed;
  @override
  List<String> get floors;
  @override
  String? get selectedFloor;
  @override
  List<TableInfo> get tablesinfolist;
  @override
  List<TableModel> get tables;

  /// Create a copy of TablesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TablesStateImplCopyWith<_$TablesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
