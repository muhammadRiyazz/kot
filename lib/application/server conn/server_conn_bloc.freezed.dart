// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_conn_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ServerConnEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String passcodepin) passcode,
    required TResult Function(String ip, String port, String databaseName,
            String username, String password)
        conn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String passcodepin)? passcode,
    TResult? Function(String ip, String port, String databaseName,
            String username, String password)?
        conn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String passcodepin)? passcode,
    TResult Function(String ip, String port, String databaseName,
            String username, String password)?
        conn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Passcode value) passcode,
    required TResult Function(Conn value) conn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Passcode value)? passcode,
    TResult? Function(Conn value)? conn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Passcode value)? passcode,
    TResult Function(Conn value)? conn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerConnEventCopyWith<$Res> {
  factory $ServerConnEventCopyWith(
          ServerConnEvent value, $Res Function(ServerConnEvent) then) =
      _$ServerConnEventCopyWithImpl<$Res, ServerConnEvent>;
}

/// @nodoc
class _$ServerConnEventCopyWithImpl<$Res, $Val extends ServerConnEvent>
    implements $ServerConnEventCopyWith<$Res> {
  _$ServerConnEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServerConnEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PasscodeImplCopyWith<$Res> {
  factory _$$PasscodeImplCopyWith(
          _$PasscodeImpl value, $Res Function(_$PasscodeImpl) then) =
      __$$PasscodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String passcodepin});
}

/// @nodoc
class __$$PasscodeImplCopyWithImpl<$Res>
    extends _$ServerConnEventCopyWithImpl<$Res, _$PasscodeImpl>
    implements _$$PasscodeImplCopyWith<$Res> {
  __$$PasscodeImplCopyWithImpl(
      _$PasscodeImpl _value, $Res Function(_$PasscodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServerConnEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passcodepin = null,
  }) {
    return _then(_$PasscodeImpl(
      passcodepin: null == passcodepin
          ? _value.passcodepin
          : passcodepin // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PasscodeImpl implements Passcode {
  const _$PasscodeImpl({required this.passcodepin});

  @override
  final String passcodepin;

  @override
  String toString() {
    return 'ServerConnEvent.passcode(passcodepin: $passcodepin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasscodeImpl &&
            (identical(other.passcodepin, passcodepin) ||
                other.passcodepin == passcodepin));
  }

  @override
  int get hashCode => Object.hash(runtimeType, passcodepin);

  /// Create a copy of ServerConnEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasscodeImplCopyWith<_$PasscodeImpl> get copyWith =>
      __$$PasscodeImplCopyWithImpl<_$PasscodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String passcodepin) passcode,
    required TResult Function(String ip, String port, String databaseName,
            String username, String password)
        conn,
  }) {
    return passcode(passcodepin);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String passcodepin)? passcode,
    TResult? Function(String ip, String port, String databaseName,
            String username, String password)?
        conn,
  }) {
    return passcode?.call(passcodepin);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String passcodepin)? passcode,
    TResult Function(String ip, String port, String databaseName,
            String username, String password)?
        conn,
    required TResult orElse(),
  }) {
    if (passcode != null) {
      return passcode(passcodepin);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Passcode value) passcode,
    required TResult Function(Conn value) conn,
  }) {
    return passcode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Passcode value)? passcode,
    TResult? Function(Conn value)? conn,
  }) {
    return passcode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Passcode value)? passcode,
    TResult Function(Conn value)? conn,
    required TResult orElse(),
  }) {
    if (passcode != null) {
      return passcode(this);
    }
    return orElse();
  }
}

abstract class Passcode implements ServerConnEvent {
  const factory Passcode({required final String passcodepin}) = _$PasscodeImpl;

  String get passcodepin;

  /// Create a copy of ServerConnEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasscodeImplCopyWith<_$PasscodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConnImplCopyWith<$Res> {
  factory _$$ConnImplCopyWith(
          _$ConnImpl value, $Res Function(_$ConnImpl) then) =
      __$$ConnImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String ip,
      String port,
      String databaseName,
      String username,
      String password});
}

/// @nodoc
class __$$ConnImplCopyWithImpl<$Res>
    extends _$ServerConnEventCopyWithImpl<$Res, _$ConnImpl>
    implements _$$ConnImplCopyWith<$Res> {
  __$$ConnImplCopyWithImpl(_$ConnImpl _value, $Res Function(_$ConnImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServerConnEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ip = null,
    Object? port = null,
    Object? databaseName = null,
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_$ConnImpl(
      ip: null == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as String,
      databaseName: null == databaseName
          ? _value.databaseName
          : databaseName // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ConnImpl implements Conn {
  const _$ConnImpl(
      {required this.ip,
      required this.port,
      required this.databaseName,
      required this.username,
      required this.password});

  @override
  final String ip;
  @override
  final String port;
  @override
  final String databaseName;
  @override
  final String username;
  @override
  final String password;

  @override
  String toString() {
    return 'ServerConnEvent.conn(ip: $ip, port: $port, databaseName: $databaseName, username: $username, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnImpl &&
            (identical(other.ip, ip) || other.ip == ip) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.databaseName, databaseName) ||
                other.databaseName == databaseName) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, ip, port, databaseName, username, password);

  /// Create a copy of ServerConnEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnImplCopyWith<_$ConnImpl> get copyWith =>
      __$$ConnImplCopyWithImpl<_$ConnImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String passcodepin) passcode,
    required TResult Function(String ip, String port, String databaseName,
            String username, String password)
        conn,
  }) {
    return conn(ip, port, databaseName, username, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String passcodepin)? passcode,
    TResult? Function(String ip, String port, String databaseName,
            String username, String password)?
        conn,
  }) {
    return conn?.call(ip, port, databaseName, username, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String passcodepin)? passcode,
    TResult Function(String ip, String port, String databaseName,
            String username, String password)?
        conn,
    required TResult orElse(),
  }) {
    if (conn != null) {
      return conn(ip, port, databaseName, username, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Passcode value) passcode,
    required TResult Function(Conn value) conn,
  }) {
    return conn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Passcode value)? passcode,
    TResult? Function(Conn value)? conn,
  }) {
    return conn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Passcode value)? passcode,
    TResult Function(Conn value)? conn,
    required TResult orElse(),
  }) {
    if (conn != null) {
      return conn(this);
    }
    return orElse();
  }
}

abstract class Conn implements ServerConnEvent {
  const factory Conn(
      {required final String ip,
      required final String port,
      required final String databaseName,
      required final String username,
      required final String password}) = _$ConnImpl;

  String get ip;
  String get port;
  String get databaseName;
  String get username;
  String get password;

  /// Create a copy of ServerConnEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConnImplCopyWith<_$ConnImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ServerConnState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get passcode => throw _privateConstructorUsedError;
  bool get conn => throw _privateConstructorUsedError;
  String? get passcodeErrorMsg => throw _privateConstructorUsedError;
  String? get connErrorMsg => throw _privateConstructorUsedError;

  /// Create a copy of ServerConnState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServerConnStateCopyWith<ServerConnState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerConnStateCopyWith<$Res> {
  factory $ServerConnStateCopyWith(
          ServerConnState value, $Res Function(ServerConnState) then) =
      _$ServerConnStateCopyWithImpl<$Res, ServerConnState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool passcode,
      bool conn,
      String? passcodeErrorMsg,
      String? connErrorMsg});
}

/// @nodoc
class _$ServerConnStateCopyWithImpl<$Res, $Val extends ServerConnState>
    implements $ServerConnStateCopyWith<$Res> {
  _$ServerConnStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServerConnState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? passcode = null,
    Object? conn = null,
    Object? passcodeErrorMsg = freezed,
    Object? connErrorMsg = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      passcode: null == passcode
          ? _value.passcode
          : passcode // ignore: cast_nullable_to_non_nullable
              as bool,
      conn: null == conn
          ? _value.conn
          : conn // ignore: cast_nullable_to_non_nullable
              as bool,
      passcodeErrorMsg: freezed == passcodeErrorMsg
          ? _value.passcodeErrorMsg
          : passcodeErrorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      connErrorMsg: freezed == connErrorMsg
          ? _value.connErrorMsg
          : connErrorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerConnStateImplCopyWith<$Res>
    implements $ServerConnStateCopyWith<$Res> {
  factory _$$ServerConnStateImplCopyWith(_$ServerConnStateImpl value,
          $Res Function(_$ServerConnStateImpl) then) =
      __$$ServerConnStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool passcode,
      bool conn,
      String? passcodeErrorMsg,
      String? connErrorMsg});
}

/// @nodoc
class __$$ServerConnStateImplCopyWithImpl<$Res>
    extends _$ServerConnStateCopyWithImpl<$Res, _$ServerConnStateImpl>
    implements _$$ServerConnStateImplCopyWith<$Res> {
  __$$ServerConnStateImplCopyWithImpl(
      _$ServerConnStateImpl _value, $Res Function(_$ServerConnStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServerConnState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? passcode = null,
    Object? conn = null,
    Object? passcodeErrorMsg = freezed,
    Object? connErrorMsg = freezed,
  }) {
    return _then(_$ServerConnStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      passcode: null == passcode
          ? _value.passcode
          : passcode // ignore: cast_nullable_to_non_nullable
              as bool,
      conn: null == conn
          ? _value.conn
          : conn // ignore: cast_nullable_to_non_nullable
              as bool,
      passcodeErrorMsg: freezed == passcodeErrorMsg
          ? _value.passcodeErrorMsg
          : passcodeErrorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      connErrorMsg: freezed == connErrorMsg
          ? _value.connErrorMsg
          : connErrorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ServerConnStateImpl implements _ServerConnState {
  _$ServerConnStateImpl(
      {required this.isLoading,
      required this.passcode,
      required this.conn,
      this.passcodeErrorMsg,
      this.connErrorMsg});

  @override
  final bool isLoading;
  @override
  final bool passcode;
  @override
  final bool conn;
  @override
  final String? passcodeErrorMsg;
  @override
  final String? connErrorMsg;

  @override
  String toString() {
    return 'ServerConnState(isLoading: $isLoading, passcode: $passcode, conn: $conn, passcodeErrorMsg: $passcodeErrorMsg, connErrorMsg: $connErrorMsg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerConnStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.passcode, passcode) ||
                other.passcode == passcode) &&
            (identical(other.conn, conn) || other.conn == conn) &&
            (identical(other.passcodeErrorMsg, passcodeErrorMsg) ||
                other.passcodeErrorMsg == passcodeErrorMsg) &&
            (identical(other.connErrorMsg, connErrorMsg) ||
                other.connErrorMsg == connErrorMsg));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, passcode, conn, passcodeErrorMsg, connErrorMsg);

  /// Create a copy of ServerConnState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerConnStateImplCopyWith<_$ServerConnStateImpl> get copyWith =>
      __$$ServerConnStateImplCopyWithImpl<_$ServerConnStateImpl>(
          this, _$identity);
}

abstract class _ServerConnState implements ServerConnState {
  factory _ServerConnState(
      {required final bool isLoading,
      required final bool passcode,
      required final bool conn,
      final String? passcodeErrorMsg,
      final String? connErrorMsg}) = _$ServerConnStateImpl;

  @override
  bool get isLoading;
  @override
  bool get passcode;
  @override
  bool get conn;
  @override
  String? get passcodeErrorMsg;
  @override
  String? get connErrorMsg;

  /// Create a copy of ServerConnState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerConnStateImplCopyWith<_$ServerConnStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
