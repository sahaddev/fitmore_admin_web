// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_create_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserCreateEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserCreateEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserCreateEvent()';
}


}

/// @nodoc
class $UserCreateEventCopyWith<$Res>  {
$UserCreateEventCopyWith(UserCreateEvent _, $Res Function(UserCreateEvent) __);
}


/// Adds pattern-matching-related methods to [UserCreateEvent].
extension UserCreateEventPatterns on UserCreateEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _PickProductImage value)?  pickProductImage,TResult Function( _UpdateUser value)?  updateUser,TResult Function( _CreateUser value)?  createUser,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PickProductImage() when pickProductImage != null:
return pickProductImage(_that);case _UpdateUser() when updateUser != null:
return updateUser(_that);case _CreateUser() when createUser != null:
return createUser(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _PickProductImage value)  pickProductImage,required TResult Function( _UpdateUser value)  updateUser,required TResult Function( _CreateUser value)  createUser,}){
final _that = this;
switch (_that) {
case _PickProductImage():
return pickProductImage(_that);case _UpdateUser():
return updateUser(_that);case _CreateUser():
return createUser(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _PickProductImage value)?  pickProductImage,TResult? Function( _UpdateUser value)?  updateUser,TResult? Function( _CreateUser value)?  createUser,}){
final _that = this;
switch (_that) {
case _PickProductImage() when pickProductImage != null:
return pickProductImage(_that);case _UpdateUser() when updateUser != null:
return updateUser(_that);case _CreateUser() when createUser != null:
return createUser(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  pickProductImage,TResult Function( UserEntity user)?  updateUser,TResult Function( UserEntity user)?  createUser,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PickProductImage() when pickProductImage != null:
return pickProductImage();case _UpdateUser() when updateUser != null:
return updateUser(_that.user);case _CreateUser() when createUser != null:
return createUser(_that.user);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  pickProductImage,required TResult Function( UserEntity user)  updateUser,required TResult Function( UserEntity user)  createUser,}) {final _that = this;
switch (_that) {
case _PickProductImage():
return pickProductImage();case _UpdateUser():
return updateUser(_that.user);case _CreateUser():
return createUser(_that.user);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  pickProductImage,TResult? Function( UserEntity user)?  updateUser,TResult? Function( UserEntity user)?  createUser,}) {final _that = this;
switch (_that) {
case _PickProductImage() when pickProductImage != null:
return pickProductImage();case _UpdateUser() when updateUser != null:
return updateUser(_that.user);case _CreateUser() when createUser != null:
return createUser(_that.user);case _:
  return null;

}
}

}

/// @nodoc


class _PickProductImage implements UserCreateEvent {
  const _PickProductImage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PickProductImage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserCreateEvent.pickProductImage()';
}


}




/// @nodoc


class _UpdateUser implements UserCreateEvent {
  const _UpdateUser({required this.user});
  

 final  UserEntity user;

/// Create a copy of UserCreateEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateUserCopyWith<_UpdateUser> get copyWith => __$UpdateUserCopyWithImpl<_UpdateUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateUser&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserCreateEvent.updateUser(user: $user)';
}


}

/// @nodoc
abstract mixin class _$UpdateUserCopyWith<$Res> implements $UserCreateEventCopyWith<$Res> {
  factory _$UpdateUserCopyWith(_UpdateUser value, $Res Function(_UpdateUser) _then) = __$UpdateUserCopyWithImpl;
@useResult
$Res call({
 UserEntity user
});




}
/// @nodoc
class __$UpdateUserCopyWithImpl<$Res>
    implements _$UpdateUserCopyWith<$Res> {
  __$UpdateUserCopyWithImpl(this._self, this._then);

  final _UpdateUser _self;
  final $Res Function(_UpdateUser) _then;

/// Create a copy of UserCreateEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_UpdateUser(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity,
  ));
}


}

/// @nodoc


class _CreateUser implements UserCreateEvent {
  const _CreateUser({required this.user});
  

 final  UserEntity user;

/// Create a copy of UserCreateEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateUserCopyWith<_CreateUser> get copyWith => __$CreateUserCopyWithImpl<_CreateUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateUser&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserCreateEvent.createUser(user: $user)';
}


}

/// @nodoc
abstract mixin class _$CreateUserCopyWith<$Res> implements $UserCreateEventCopyWith<$Res> {
  factory _$CreateUserCopyWith(_CreateUser value, $Res Function(_CreateUser) _then) = __$CreateUserCopyWithImpl;
@useResult
$Res call({
 UserEntity user
});




}
/// @nodoc
class __$CreateUserCopyWithImpl<$Res>
    implements _$CreateUserCopyWith<$Res> {
  __$CreateUserCopyWithImpl(this._self, this._then);

  final _CreateUser _self;
  final $Res Function(_CreateUser) _then;

/// Create a copy of UserCreateEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_CreateUser(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity,
  ));
}


}

/// @nodoc
mixin _$UserCreateState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserCreateState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserCreateState()';
}


}

/// @nodoc
class $UserCreateStateCopyWith<$Res>  {
$UserCreateStateCopyWith(UserCreateState _, $Res Function(UserCreateState) __);
}


/// Adds pattern-matching-related methods to [UserCreateState].
extension UserCreateStatePatterns on UserCreateState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UserCreateStateInitial value)?  initial,TResult Function( UserCreateStateLoading value)?  loading,TResult Function( UserCreateStateLoaded value)?  loaded,TResult Function( UserCreateStateError value)?  error,TResult Function( UserCreateStateSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UserCreateStateInitial() when initial != null:
return initial(_that);case UserCreateStateLoading() when loading != null:
return loading(_that);case UserCreateStateLoaded() when loaded != null:
return loaded(_that);case UserCreateStateError() when error != null:
return error(_that);case UserCreateStateSuccess() when success != null:
return success(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UserCreateStateInitial value)  initial,required TResult Function( UserCreateStateLoading value)  loading,required TResult Function( UserCreateStateLoaded value)  loaded,required TResult Function( UserCreateStateError value)  error,required TResult Function( UserCreateStateSuccess value)  success,}){
final _that = this;
switch (_that) {
case UserCreateStateInitial():
return initial(_that);case UserCreateStateLoading():
return loading(_that);case UserCreateStateLoaded():
return loaded(_that);case UserCreateStateError():
return error(_that);case UserCreateStateSuccess():
return success(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UserCreateStateInitial value)?  initial,TResult? Function( UserCreateStateLoading value)?  loading,TResult? Function( UserCreateStateLoaded value)?  loaded,TResult? Function( UserCreateStateError value)?  error,TResult? Function( UserCreateStateSuccess value)?  success,}){
final _that = this;
switch (_that) {
case UserCreateStateInitial() when initial != null:
return initial(_that);case UserCreateStateLoading() when loading != null:
return loading(_that);case UserCreateStateLoaded() when loaded != null:
return loaded(_that);case UserCreateStateError() when error != null:
return error(_that);case UserCreateStateSuccess() when success != null:
return success(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( UserEntity? user)?  loaded,TResult Function( String message)?  error,TResult Function()?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UserCreateStateInitial() when initial != null:
return initial();case UserCreateStateLoading() when loading != null:
return loading();case UserCreateStateLoaded() when loaded != null:
return loaded(_that.user);case UserCreateStateError() when error != null:
return error(_that.message);case UserCreateStateSuccess() when success != null:
return success();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( UserEntity? user)  loaded,required TResult Function( String message)  error,required TResult Function()  success,}) {final _that = this;
switch (_that) {
case UserCreateStateInitial():
return initial();case UserCreateStateLoading():
return loading();case UserCreateStateLoaded():
return loaded(_that.user);case UserCreateStateError():
return error(_that.message);case UserCreateStateSuccess():
return success();}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( UserEntity? user)?  loaded,TResult? Function( String message)?  error,TResult? Function()?  success,}) {final _that = this;
switch (_that) {
case UserCreateStateInitial() when initial != null:
return initial();case UserCreateStateLoading() when loading != null:
return loading();case UserCreateStateLoaded() when loaded != null:
return loaded(_that.user);case UserCreateStateError() when error != null:
return error(_that.message);case UserCreateStateSuccess() when success != null:
return success();case _:
  return null;

}
}

}

/// @nodoc


class UserCreateStateInitial implements UserCreateState {
  const UserCreateStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserCreateStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserCreateState.initial()';
}


}




/// @nodoc


class UserCreateStateLoading implements UserCreateState {
  const UserCreateStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserCreateStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserCreateState.loading()';
}


}




/// @nodoc


class UserCreateStateLoaded implements UserCreateState {
  const UserCreateStateLoaded({this.user});
  

 final  UserEntity? user;

/// Create a copy of UserCreateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCreateStateLoadedCopyWith<UserCreateStateLoaded> get copyWith => _$UserCreateStateLoadedCopyWithImpl<UserCreateStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserCreateStateLoaded&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserCreateState.loaded(user: $user)';
}


}

/// @nodoc
abstract mixin class $UserCreateStateLoadedCopyWith<$Res> implements $UserCreateStateCopyWith<$Res> {
  factory $UserCreateStateLoadedCopyWith(UserCreateStateLoaded value, $Res Function(UserCreateStateLoaded) _then) = _$UserCreateStateLoadedCopyWithImpl;
@useResult
$Res call({
 UserEntity? user
});




}
/// @nodoc
class _$UserCreateStateLoadedCopyWithImpl<$Res>
    implements $UserCreateStateLoadedCopyWith<$Res> {
  _$UserCreateStateLoadedCopyWithImpl(this._self, this._then);

  final UserCreateStateLoaded _self;
  final $Res Function(UserCreateStateLoaded) _then;

/// Create a copy of UserCreateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = freezed,}) {
  return _then(UserCreateStateLoaded(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity?,
  ));
}


}

/// @nodoc


class UserCreateStateError implements UserCreateState {
  const UserCreateStateError(this.message);
  

 final  String message;

/// Create a copy of UserCreateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCreateStateErrorCopyWith<UserCreateStateError> get copyWith => _$UserCreateStateErrorCopyWithImpl<UserCreateStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserCreateStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'UserCreateState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $UserCreateStateErrorCopyWith<$Res> implements $UserCreateStateCopyWith<$Res> {
  factory $UserCreateStateErrorCopyWith(UserCreateStateError value, $Res Function(UserCreateStateError) _then) = _$UserCreateStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UserCreateStateErrorCopyWithImpl<$Res>
    implements $UserCreateStateErrorCopyWith<$Res> {
  _$UserCreateStateErrorCopyWithImpl(this._self, this._then);

  final UserCreateStateError _self;
  final $Res Function(UserCreateStateError) _then;

/// Create a copy of UserCreateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UserCreateStateError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UserCreateStateSuccess implements UserCreateState {
  const UserCreateStateSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserCreateStateSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserCreateState.success()';
}


}




// dart format on
