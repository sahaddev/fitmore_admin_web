// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coupon_add_and_l_ist_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CouponAddAndLIstEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CouponAddAndLIstEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CouponAddAndLIstEvent()';
}


}

/// @nodoc
class $CouponAddAndLIstEventCopyWith<$Res>  {
$CouponAddAndLIstEventCopyWith(CouponAddAndLIstEvent _, $Res Function(CouponAddAndLIstEvent) __);
}


/// Adds pattern-matching-related methods to [CouponAddAndLIstEvent].
extension CouponAddAndLIstEventPatterns on CouponAddAndLIstEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchCoupons value)?  fetchCoupons,TResult Function( _AddCoupon value)?  addCoupon,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchCoupons() when fetchCoupons != null:
return fetchCoupons(_that);case _AddCoupon() when addCoupon != null:
return addCoupon(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchCoupons value)  fetchCoupons,required TResult Function( _AddCoupon value)  addCoupon,}){
final _that = this;
switch (_that) {
case _FetchCoupons():
return fetchCoupons(_that);case _AddCoupon():
return addCoupon(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchCoupons value)?  fetchCoupons,TResult? Function( _AddCoupon value)?  addCoupon,}){
final _that = this;
switch (_that) {
case _FetchCoupons() when fetchCoupons != null:
return fetchCoupons(_that);case _AddCoupon() when addCoupon != null:
return addCoupon(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchCoupons,TResult Function( CouponEntity coupon)?  addCoupon,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchCoupons() when fetchCoupons != null:
return fetchCoupons();case _AddCoupon() when addCoupon != null:
return addCoupon(_that.coupon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchCoupons,required TResult Function( CouponEntity coupon)  addCoupon,}) {final _that = this;
switch (_that) {
case _FetchCoupons():
return fetchCoupons();case _AddCoupon():
return addCoupon(_that.coupon);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchCoupons,TResult? Function( CouponEntity coupon)?  addCoupon,}) {final _that = this;
switch (_that) {
case _FetchCoupons() when fetchCoupons != null:
return fetchCoupons();case _AddCoupon() when addCoupon != null:
return addCoupon(_that.coupon);case _:
  return null;

}
}

}

/// @nodoc


class _FetchCoupons implements CouponAddAndLIstEvent {
  const _FetchCoupons();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchCoupons);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CouponAddAndLIstEvent.fetchCoupons()';
}


}




/// @nodoc


class _AddCoupon implements CouponAddAndLIstEvent {
  const _AddCoupon({required this.coupon});
  

 final  CouponEntity coupon;

/// Create a copy of CouponAddAndLIstEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddCouponCopyWith<_AddCoupon> get copyWith => __$AddCouponCopyWithImpl<_AddCoupon>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddCoupon&&(identical(other.coupon, coupon) || other.coupon == coupon));
}


@override
int get hashCode => Object.hash(runtimeType,coupon);

@override
String toString() {
  return 'CouponAddAndLIstEvent.addCoupon(coupon: $coupon)';
}


}

/// @nodoc
abstract mixin class _$AddCouponCopyWith<$Res> implements $CouponAddAndLIstEventCopyWith<$Res> {
  factory _$AddCouponCopyWith(_AddCoupon value, $Res Function(_AddCoupon) _then) = __$AddCouponCopyWithImpl;
@useResult
$Res call({
 CouponEntity coupon
});




}
/// @nodoc
class __$AddCouponCopyWithImpl<$Res>
    implements _$AddCouponCopyWith<$Res> {
  __$AddCouponCopyWithImpl(this._self, this._then);

  final _AddCoupon _self;
  final $Res Function(_AddCoupon) _then;

/// Create a copy of CouponAddAndLIstEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? coupon = null,}) {
  return _then(_AddCoupon(
coupon: null == coupon ? _self.coupon : coupon // ignore: cast_nullable_to_non_nullable
as CouponEntity,
  ));
}


}

/// @nodoc
mixin _$CouponAddAndLIstState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CouponAddAndLIstState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CouponAddAndLIstState()';
}


}

/// @nodoc
class $CouponAddAndLIstStateCopyWith<$Res>  {
$CouponAddAndLIstStateCopyWith(CouponAddAndLIstState _, $Res Function(CouponAddAndLIstState) __);
}


/// Adds pattern-matching-related methods to [CouponAddAndLIstState].
extension CouponAddAndLIstStatePatterns on CouponAddAndLIstState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CouponAddAndLIstStateInitial value)?  initial,TResult Function( CouponAddAndLIstStateLoading value)?  loading,TResult Function( CouponAddAndLIstStateLoaded value)?  loaded,TResult Function( CouponAddAndLIstStateSuccess value)?  success,TResult Function( CouponAddAndLIstStateFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CouponAddAndLIstStateInitial() when initial != null:
return initial(_that);case CouponAddAndLIstStateLoading() when loading != null:
return loading(_that);case CouponAddAndLIstStateLoaded() when loaded != null:
return loaded(_that);case CouponAddAndLIstStateSuccess() when success != null:
return success(_that);case CouponAddAndLIstStateFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CouponAddAndLIstStateInitial value)  initial,required TResult Function( CouponAddAndLIstStateLoading value)  loading,required TResult Function( CouponAddAndLIstStateLoaded value)  loaded,required TResult Function( CouponAddAndLIstStateSuccess value)  success,required TResult Function( CouponAddAndLIstStateFailure value)  failure,}){
final _that = this;
switch (_that) {
case CouponAddAndLIstStateInitial():
return initial(_that);case CouponAddAndLIstStateLoading():
return loading(_that);case CouponAddAndLIstStateLoaded():
return loaded(_that);case CouponAddAndLIstStateSuccess():
return success(_that);case CouponAddAndLIstStateFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CouponAddAndLIstStateInitial value)?  initial,TResult? Function( CouponAddAndLIstStateLoading value)?  loading,TResult? Function( CouponAddAndLIstStateLoaded value)?  loaded,TResult? Function( CouponAddAndLIstStateSuccess value)?  success,TResult? Function( CouponAddAndLIstStateFailure value)?  failure,}){
final _that = this;
switch (_that) {
case CouponAddAndLIstStateInitial() when initial != null:
return initial(_that);case CouponAddAndLIstStateLoading() when loading != null:
return loading(_that);case CouponAddAndLIstStateLoaded() when loaded != null:
return loaded(_that);case CouponAddAndLIstStateSuccess() when success != null:
return success(_that);case CouponAddAndLIstStateFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<CouponEntity> coupons)?  loaded,TResult Function()?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CouponAddAndLIstStateInitial() when initial != null:
return initial();case CouponAddAndLIstStateLoading() when loading != null:
return loading();case CouponAddAndLIstStateLoaded() when loaded != null:
return loaded(_that.coupons);case CouponAddAndLIstStateSuccess() when success != null:
return success();case CouponAddAndLIstStateFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<CouponEntity> coupons)  loaded,required TResult Function()  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case CouponAddAndLIstStateInitial():
return initial();case CouponAddAndLIstStateLoading():
return loading();case CouponAddAndLIstStateLoaded():
return loaded(_that.coupons);case CouponAddAndLIstStateSuccess():
return success();case CouponAddAndLIstStateFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<CouponEntity> coupons)?  loaded,TResult? Function()?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case CouponAddAndLIstStateInitial() when initial != null:
return initial();case CouponAddAndLIstStateLoading() when loading != null:
return loading();case CouponAddAndLIstStateLoaded() when loaded != null:
return loaded(_that.coupons);case CouponAddAndLIstStateSuccess() when success != null:
return success();case CouponAddAndLIstStateFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class CouponAddAndLIstStateInitial implements CouponAddAndLIstState {
  const CouponAddAndLIstStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CouponAddAndLIstStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CouponAddAndLIstState.initial()';
}


}




/// @nodoc


class CouponAddAndLIstStateLoading implements CouponAddAndLIstState {
  const CouponAddAndLIstStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CouponAddAndLIstStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CouponAddAndLIstState.loading()';
}


}




/// @nodoc


class CouponAddAndLIstStateLoaded implements CouponAddAndLIstState {
  const CouponAddAndLIstStateLoaded(final  List<CouponEntity> coupons): _coupons = coupons;
  

 final  List<CouponEntity> _coupons;
 List<CouponEntity> get coupons {
  if (_coupons is EqualUnmodifiableListView) return _coupons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_coupons);
}


/// Create a copy of CouponAddAndLIstState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CouponAddAndLIstStateLoadedCopyWith<CouponAddAndLIstStateLoaded> get copyWith => _$CouponAddAndLIstStateLoadedCopyWithImpl<CouponAddAndLIstStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CouponAddAndLIstStateLoaded&&const DeepCollectionEquality().equals(other._coupons, _coupons));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_coupons));

@override
String toString() {
  return 'CouponAddAndLIstState.loaded(coupons: $coupons)';
}


}

/// @nodoc
abstract mixin class $CouponAddAndLIstStateLoadedCopyWith<$Res> implements $CouponAddAndLIstStateCopyWith<$Res> {
  factory $CouponAddAndLIstStateLoadedCopyWith(CouponAddAndLIstStateLoaded value, $Res Function(CouponAddAndLIstStateLoaded) _then) = _$CouponAddAndLIstStateLoadedCopyWithImpl;
@useResult
$Res call({
 List<CouponEntity> coupons
});




}
/// @nodoc
class _$CouponAddAndLIstStateLoadedCopyWithImpl<$Res>
    implements $CouponAddAndLIstStateLoadedCopyWith<$Res> {
  _$CouponAddAndLIstStateLoadedCopyWithImpl(this._self, this._then);

  final CouponAddAndLIstStateLoaded _self;
  final $Res Function(CouponAddAndLIstStateLoaded) _then;

/// Create a copy of CouponAddAndLIstState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? coupons = null,}) {
  return _then(CouponAddAndLIstStateLoaded(
null == coupons ? _self._coupons : coupons // ignore: cast_nullable_to_non_nullable
as List<CouponEntity>,
  ));
}


}

/// @nodoc


class CouponAddAndLIstStateSuccess implements CouponAddAndLIstState {
  const CouponAddAndLIstStateSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CouponAddAndLIstStateSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CouponAddAndLIstState.success()';
}


}




/// @nodoc


class CouponAddAndLIstStateFailure implements CouponAddAndLIstState {
  const CouponAddAndLIstStateFailure(this.message);
  

 final  String message;

/// Create a copy of CouponAddAndLIstState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CouponAddAndLIstStateFailureCopyWith<CouponAddAndLIstStateFailure> get copyWith => _$CouponAddAndLIstStateFailureCopyWithImpl<CouponAddAndLIstStateFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CouponAddAndLIstStateFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CouponAddAndLIstState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $CouponAddAndLIstStateFailureCopyWith<$Res> implements $CouponAddAndLIstStateCopyWith<$Res> {
  factory $CouponAddAndLIstStateFailureCopyWith(CouponAddAndLIstStateFailure value, $Res Function(CouponAddAndLIstStateFailure) _then) = _$CouponAddAndLIstStateFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CouponAddAndLIstStateFailureCopyWithImpl<$Res>
    implements $CouponAddAndLIstStateFailureCopyWith<$Res> {
  _$CouponAddAndLIstStateFailureCopyWithImpl(this._self, this._then);

  final CouponAddAndLIstStateFailure _self;
  final $Res Function(CouponAddAndLIstStateFailure) _then;

/// Create a copy of CouponAddAndLIstState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CouponAddAndLIstStateFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
