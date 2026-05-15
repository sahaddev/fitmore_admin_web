// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserListEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserListEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserListEvent()';
}


}

/// @nodoc
class $UserListEventCopyWith<$Res>  {
$UserListEventCopyWith(UserListEvent _, $Res Function(UserListEvent) __);
}


/// Adds pattern-matching-related methods to [UserListEvent].
extension UserListEventPatterns on UserListEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchUsers value)?  fetchUsers,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchUsers() when fetchUsers != null:
return fetchUsers(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchUsers value)  fetchUsers,}){
final _that = this;
switch (_that) {
case _FetchUsers():
return fetchUsers(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchUsers value)?  fetchUsers,}){
final _that = this;
switch (_that) {
case _FetchUsers() when fetchUsers != null:
return fetchUsers(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchUsers,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchUsers() when fetchUsers != null:
return fetchUsers();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchUsers,}) {final _that = this;
switch (_that) {
case _FetchUsers():
return fetchUsers();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchUsers,}) {final _that = this;
switch (_that) {
case _FetchUsers() when fetchUsers != null:
return fetchUsers();case _:
  return null;

}
}

}

/// @nodoc


class _FetchUsers implements UserListEvent {
  const _FetchUsers();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchUsers);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserListEvent.fetchUsers()';
}


}




/// @nodoc
mixin _$UserListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserListState()';
}


}

/// @nodoc
class $UserListStateCopyWith<$Res>  {
$UserListStateCopyWith(UserListState _, $Res Function(UserListState) __);
}


/// Adds pattern-matching-related methods to [UserListState].
extension UserListStatePatterns on UserListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UserListStateInitial value)?  initial,TResult Function( UserListStateLoading value)?  loading,TResult Function( UserListStateLoaded value)?  loaded,TResult Function( UserListStateFailure value)?  failure,TResult Function( UserListStateSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UserListStateInitial() when initial != null:
return initial(_that);case UserListStateLoading() when loading != null:
return loading(_that);case UserListStateLoaded() when loaded != null:
return loaded(_that);case UserListStateFailure() when failure != null:
return failure(_that);case UserListStateSuccess() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UserListStateInitial value)  initial,required TResult Function( UserListStateLoading value)  loading,required TResult Function( UserListStateLoaded value)  loaded,required TResult Function( UserListStateFailure value)  failure,required TResult Function( UserListStateSuccess value)  success,}){
final _that = this;
switch (_that) {
case UserListStateInitial():
return initial(_that);case UserListStateLoading():
return loading(_that);case UserListStateLoaded():
return loaded(_that);case UserListStateFailure():
return failure(_that);case UserListStateSuccess():
return success(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UserListStateInitial value)?  initial,TResult? Function( UserListStateLoading value)?  loading,TResult? Function( UserListStateLoaded value)?  loaded,TResult? Function( UserListStateFailure value)?  failure,TResult? Function( UserListStateSuccess value)?  success,}){
final _that = this;
switch (_that) {
case UserListStateInitial() when initial != null:
return initial(_that);case UserListStateLoading() when loading != null:
return loading(_that);case UserListStateLoaded() when loaded != null:
return loaded(_that);case UserListStateFailure() when failure != null:
return failure(_that);case UserListStateSuccess() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<UserEntity> users)?  loaded,TResult Function( String message)?  failure,TResult Function()?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UserListStateInitial() when initial != null:
return initial();case UserListStateLoading() when loading != null:
return loading();case UserListStateLoaded() when loaded != null:
return loaded(_that.users);case UserListStateFailure() when failure != null:
return failure(_that.message);case UserListStateSuccess() when success != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<UserEntity> users)  loaded,required TResult Function( String message)  failure,required TResult Function()  success,}) {final _that = this;
switch (_that) {
case UserListStateInitial():
return initial();case UserListStateLoading():
return loading();case UserListStateLoaded():
return loaded(_that.users);case UserListStateFailure():
return failure(_that.message);case UserListStateSuccess():
return success();case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<UserEntity> users)?  loaded,TResult? Function( String message)?  failure,TResult? Function()?  success,}) {final _that = this;
switch (_that) {
case UserListStateInitial() when initial != null:
return initial();case UserListStateLoading() when loading != null:
return loading();case UserListStateLoaded() when loaded != null:
return loaded(_that.users);case UserListStateFailure() when failure != null:
return failure(_that.message);case UserListStateSuccess() when success != null:
return success();case _:
  return null;

}
}

}

/// @nodoc


class UserListStateInitial implements UserListState {
  const UserListStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserListStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserListState.initial()';
}


}




/// @nodoc


class UserListStateLoading implements UserListState {
  const UserListStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserListStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserListState.loading()';
}


}




/// @nodoc


class UserListStateLoaded implements UserListState {
  const UserListStateLoaded(final  List<UserEntity> users): _users = users;
  

 final  List<UserEntity> _users;
 List<UserEntity> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}


/// Create a copy of UserListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserListStateLoadedCopyWith<UserListStateLoaded> get copyWith => _$UserListStateLoadedCopyWithImpl<UserListStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserListStateLoaded&&const DeepCollectionEquality().equals(other._users, _users));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users));

@override
String toString() {
  return 'UserListState.loaded(users: $users)';
}


}

/// @nodoc
abstract mixin class $UserListStateLoadedCopyWith<$Res> implements $UserListStateCopyWith<$Res> {
  factory $UserListStateLoadedCopyWith(UserListStateLoaded value, $Res Function(UserListStateLoaded) _then) = _$UserListStateLoadedCopyWithImpl;
@useResult
$Res call({
 List<UserEntity> users
});




}
/// @nodoc
class _$UserListStateLoadedCopyWithImpl<$Res>
    implements $UserListStateLoadedCopyWith<$Res> {
  _$UserListStateLoadedCopyWithImpl(this._self, this._then);

  final UserListStateLoaded _self;
  final $Res Function(UserListStateLoaded) _then;

/// Create a copy of UserListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? users = null,}) {
  return _then(UserListStateLoaded(
null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<UserEntity>,
  ));
}


}

/// @nodoc


class UserListStateFailure implements UserListState {
  const UserListStateFailure(this.message);
  

 final  String message;

/// Create a copy of UserListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserListStateFailureCopyWith<UserListStateFailure> get copyWith => _$UserListStateFailureCopyWithImpl<UserListStateFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserListStateFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'UserListState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $UserListStateFailureCopyWith<$Res> implements $UserListStateCopyWith<$Res> {
  factory $UserListStateFailureCopyWith(UserListStateFailure value, $Res Function(UserListStateFailure) _then) = _$UserListStateFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UserListStateFailureCopyWithImpl<$Res>
    implements $UserListStateFailureCopyWith<$Res> {
  _$UserListStateFailureCopyWithImpl(this._self, this._then);

  final UserListStateFailure _self;
  final $Res Function(UserListStateFailure) _then;

/// Create a copy of UserListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UserListStateFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UserListStateSuccess implements UserListState {
  const UserListStateSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserListStateSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserListState.success()';
}


}




// dart format on
