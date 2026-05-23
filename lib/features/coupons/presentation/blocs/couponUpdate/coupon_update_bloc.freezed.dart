// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coupon_update_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CouponUpdateEvent {

 CouponEntity get coupon;
/// Create a copy of CouponUpdateEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CouponUpdateEventCopyWith<CouponUpdateEvent> get copyWith => _$CouponUpdateEventCopyWithImpl<CouponUpdateEvent>(this as CouponUpdateEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CouponUpdateEvent&&(identical(other.coupon, coupon) || other.coupon == coupon));
}


@override
int get hashCode => Object.hash(runtimeType,coupon);

@override
String toString() {
  return 'CouponUpdateEvent(coupon: $coupon)';
}


}

/// @nodoc
abstract mixin class $CouponUpdateEventCopyWith<$Res>  {
  factory $CouponUpdateEventCopyWith(CouponUpdateEvent value, $Res Function(CouponUpdateEvent) _then) = _$CouponUpdateEventCopyWithImpl;
@useResult
$Res call({
 CouponEntity coupon
});




}
/// @nodoc
class _$CouponUpdateEventCopyWithImpl<$Res>
    implements $CouponUpdateEventCopyWith<$Res> {
  _$CouponUpdateEventCopyWithImpl(this._self, this._then);

  final CouponUpdateEvent _self;
  final $Res Function(CouponUpdateEvent) _then;

/// Create a copy of CouponUpdateEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? coupon = null,}) {
  return _then(_self.copyWith(
coupon: null == coupon ? _self.coupon : coupon // ignore: cast_nullable_to_non_nullable
as CouponEntity,
  ));
}

}


/// Adds pattern-matching-related methods to [CouponUpdateEvent].
extension CouponUpdateEventPatterns on CouponUpdateEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _UpdateCoupon value)?  updateCoupon,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateCoupon() when updateCoupon != null:
return updateCoupon(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _UpdateCoupon value)  updateCoupon,}){
final _that = this;
switch (_that) {
case _UpdateCoupon():
return updateCoupon(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _UpdateCoupon value)?  updateCoupon,}){
final _that = this;
switch (_that) {
case _UpdateCoupon() when updateCoupon != null:
return updateCoupon(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( CouponEntity coupon)?  updateCoupon,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateCoupon() when updateCoupon != null:
return updateCoupon(_that.coupon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( CouponEntity coupon)  updateCoupon,}) {final _that = this;
switch (_that) {
case _UpdateCoupon():
return updateCoupon(_that.coupon);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( CouponEntity coupon)?  updateCoupon,}) {final _that = this;
switch (_that) {
case _UpdateCoupon() when updateCoupon != null:
return updateCoupon(_that.coupon);case _:
  return null;

}
}

}

/// @nodoc


class _UpdateCoupon implements CouponUpdateEvent {
  const _UpdateCoupon({required this.coupon});
  

@override final  CouponEntity coupon;

/// Create a copy of CouponUpdateEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCouponCopyWith<_UpdateCoupon> get copyWith => __$UpdateCouponCopyWithImpl<_UpdateCoupon>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateCoupon&&(identical(other.coupon, coupon) || other.coupon == coupon));
}


@override
int get hashCode => Object.hash(runtimeType,coupon);

@override
String toString() {
  return 'CouponUpdateEvent.updateCoupon(coupon: $coupon)';
}


}

/// @nodoc
abstract mixin class _$UpdateCouponCopyWith<$Res> implements $CouponUpdateEventCopyWith<$Res> {
  factory _$UpdateCouponCopyWith(_UpdateCoupon value, $Res Function(_UpdateCoupon) _then) = __$UpdateCouponCopyWithImpl;
@override @useResult
$Res call({
 CouponEntity coupon
});




}
/// @nodoc
class __$UpdateCouponCopyWithImpl<$Res>
    implements _$UpdateCouponCopyWith<$Res> {
  __$UpdateCouponCopyWithImpl(this._self, this._then);

  final _UpdateCoupon _self;
  final $Res Function(_UpdateCoupon) _then;

/// Create a copy of CouponUpdateEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? coupon = null,}) {
  return _then(_UpdateCoupon(
coupon: null == coupon ? _self.coupon : coupon // ignore: cast_nullable_to_non_nullable
as CouponEntity,
  ));
}


}

/// @nodoc
mixin _$CouponUpdateState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CouponUpdateState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CouponUpdateState()';
}


}

/// @nodoc
class $CouponUpdateStateCopyWith<$Res>  {
$CouponUpdateStateCopyWith(CouponUpdateState _, $Res Function(CouponUpdateState) __);
}


/// Adds pattern-matching-related methods to [CouponUpdateState].
extension CouponUpdateStatePatterns on CouponUpdateState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CouponUpdateStateInitial value)?  initial,TResult Function( CouponUpdateStateLoading value)?  loading,TResult Function( CouponUpdateStateSuccess value)?  success,TResult Function( CouponUpdateStateFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CouponUpdateStateInitial() when initial != null:
return initial(_that);case CouponUpdateStateLoading() when loading != null:
return loading(_that);case CouponUpdateStateSuccess() when success != null:
return success(_that);case CouponUpdateStateFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CouponUpdateStateInitial value)  initial,required TResult Function( CouponUpdateStateLoading value)  loading,required TResult Function( CouponUpdateStateSuccess value)  success,required TResult Function( CouponUpdateStateFailure value)  failure,}){
final _that = this;
switch (_that) {
case CouponUpdateStateInitial():
return initial(_that);case CouponUpdateStateLoading():
return loading(_that);case CouponUpdateStateSuccess():
return success(_that);case CouponUpdateStateFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CouponUpdateStateInitial value)?  initial,TResult? Function( CouponUpdateStateLoading value)?  loading,TResult? Function( CouponUpdateStateSuccess value)?  success,TResult? Function( CouponUpdateStateFailure value)?  failure,}){
final _that = this;
switch (_that) {
case CouponUpdateStateInitial() when initial != null:
return initial(_that);case CouponUpdateStateLoading() when loading != null:
return loading(_that);case CouponUpdateStateSuccess() when success != null:
return success(_that);case CouponUpdateStateFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CouponUpdateStateInitial() when initial != null:
return initial();case CouponUpdateStateLoading() when loading != null:
return loading();case CouponUpdateStateSuccess() when success != null:
return success();case CouponUpdateStateFailure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case CouponUpdateStateInitial():
return initial();case CouponUpdateStateLoading():
return loading();case CouponUpdateStateSuccess():
return success();case CouponUpdateStateFailure():
return failure(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case CouponUpdateStateInitial() when initial != null:
return initial();case CouponUpdateStateLoading() when loading != null:
return loading();case CouponUpdateStateSuccess() when success != null:
return success();case CouponUpdateStateFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class CouponUpdateStateInitial implements CouponUpdateState {
  const CouponUpdateStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CouponUpdateStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CouponUpdateState.initial()';
}


}




/// @nodoc


class CouponUpdateStateLoading implements CouponUpdateState {
  const CouponUpdateStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CouponUpdateStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CouponUpdateState.loading()';
}


}




/// @nodoc


class CouponUpdateStateSuccess implements CouponUpdateState {
  const CouponUpdateStateSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CouponUpdateStateSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CouponUpdateState.success()';
}


}




/// @nodoc


class CouponUpdateStateFailure implements CouponUpdateState {
  const CouponUpdateStateFailure(this.message);
  

 final  String message;

/// Create a copy of CouponUpdateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CouponUpdateStateFailureCopyWith<CouponUpdateStateFailure> get copyWith => _$CouponUpdateStateFailureCopyWithImpl<CouponUpdateStateFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CouponUpdateStateFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CouponUpdateState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $CouponUpdateStateFailureCopyWith<$Res> implements $CouponUpdateStateCopyWith<$Res> {
  factory $CouponUpdateStateFailureCopyWith(CouponUpdateStateFailure value, $Res Function(CouponUpdateStateFailure) _then) = _$CouponUpdateStateFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CouponUpdateStateFailureCopyWithImpl<$Res>
    implements $CouponUpdateStateFailureCopyWith<$Res> {
  _$CouponUpdateStateFailureCopyWithImpl(this._self, this._then);

  final CouponUpdateStateFailure _self;
  final $Res Function(CouponUpdateStateFailure) _then;

/// Create a copy of CouponUpdateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CouponUpdateStateFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
