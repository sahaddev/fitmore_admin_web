// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UpdateProductEvent {

 ProductEntity get product;
/// Create a copy of UpdateProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProductEventCopyWith<UpdateProductEvent> get copyWith => _$UpdateProductEventCopyWithImpl<UpdateProductEvent>(this as UpdateProductEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProductEvent&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,product);

@override
String toString() {
  return 'UpdateProductEvent(product: $product)';
}


}

/// @nodoc
abstract mixin class $UpdateProductEventCopyWith<$Res>  {
  factory $UpdateProductEventCopyWith(UpdateProductEvent value, $Res Function(UpdateProductEvent) _then) = _$UpdateProductEventCopyWithImpl;
@useResult
$Res call({
 ProductEntity product
});




}
/// @nodoc
class _$UpdateProductEventCopyWithImpl<$Res>
    implements $UpdateProductEventCopyWith<$Res> {
  _$UpdateProductEventCopyWithImpl(this._self, this._then);

  final UpdateProductEvent _self;
  final $Res Function(UpdateProductEvent) _then;

/// Create a copy of UpdateProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? product = null,}) {
  return _then(_self.copyWith(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductEntity,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateProductEvent].
extension UpdateProductEventPatterns on UpdateProductEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _UpdateProduct value)?  updateProduct,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateProduct() when updateProduct != null:
return updateProduct(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _UpdateProduct value)  updateProduct,}){
final _that = this;
switch (_that) {
case _UpdateProduct():
return updateProduct(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _UpdateProduct value)?  updateProduct,}){
final _that = this;
switch (_that) {
case _UpdateProduct() when updateProduct != null:
return updateProduct(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ProductEntity product)?  updateProduct,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateProduct() when updateProduct != null:
return updateProduct(_that.product);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ProductEntity product)  updateProduct,}) {final _that = this;
switch (_that) {
case _UpdateProduct():
return updateProduct(_that.product);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ProductEntity product)?  updateProduct,}) {final _that = this;
switch (_that) {
case _UpdateProduct() when updateProduct != null:
return updateProduct(_that.product);case _:
  return null;

}
}

}

/// @nodoc


class _UpdateProduct implements UpdateProductEvent {
  const _UpdateProduct({required this.product});
  

@override final  ProductEntity product;

/// Create a copy of UpdateProductEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateProductCopyWith<_UpdateProduct> get copyWith => __$UpdateProductCopyWithImpl<_UpdateProduct>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProduct&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,product);

@override
String toString() {
  return 'UpdateProductEvent.updateProduct(product: $product)';
}


}

/// @nodoc
abstract mixin class _$UpdateProductCopyWith<$Res> implements $UpdateProductEventCopyWith<$Res> {
  factory _$UpdateProductCopyWith(_UpdateProduct value, $Res Function(_UpdateProduct) _then) = __$UpdateProductCopyWithImpl;
@override @useResult
$Res call({
 ProductEntity product
});




}
/// @nodoc
class __$UpdateProductCopyWithImpl<$Res>
    implements _$UpdateProductCopyWith<$Res> {
  __$UpdateProductCopyWithImpl(this._self, this._then);

  final _UpdateProduct _self;
  final $Res Function(_UpdateProduct) _then;

/// Create a copy of UpdateProductEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? product = null,}) {
  return _then(_UpdateProduct(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductEntity,
  ));
}


}

/// @nodoc
mixin _$UpdateProductState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProductState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateProductState()';
}


}

/// @nodoc
class $UpdateProductStateCopyWith<$Res>  {
$UpdateProductStateCopyWith(UpdateProductState _, $Res Function(UpdateProductState) __);
}


/// Adds pattern-matching-related methods to [UpdateProductState].
extension UpdateProductStatePatterns on UpdateProductState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UpdateProductStateInitial value)?  initial,TResult Function( UpdateProductStateLoading value)?  loading,TResult Function( UpdateProductStateSuccess value)?  success,TResult Function( UpdateProductStateFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UpdateProductStateInitial() when initial != null:
return initial(_that);case UpdateProductStateLoading() when loading != null:
return loading(_that);case UpdateProductStateSuccess() when success != null:
return success(_that);case UpdateProductStateFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UpdateProductStateInitial value)  initial,required TResult Function( UpdateProductStateLoading value)  loading,required TResult Function( UpdateProductStateSuccess value)  success,required TResult Function( UpdateProductStateFailure value)  failure,}){
final _that = this;
switch (_that) {
case UpdateProductStateInitial():
return initial(_that);case UpdateProductStateLoading():
return loading(_that);case UpdateProductStateSuccess():
return success(_that);case UpdateProductStateFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UpdateProductStateInitial value)?  initial,TResult? Function( UpdateProductStateLoading value)?  loading,TResult? Function( UpdateProductStateSuccess value)?  success,TResult? Function( UpdateProductStateFailure value)?  failure,}){
final _that = this;
switch (_that) {
case UpdateProductStateInitial() when initial != null:
return initial(_that);case UpdateProductStateLoading() when loading != null:
return loading(_that);case UpdateProductStateSuccess() when success != null:
return success(_that);case UpdateProductStateFailure() when failure != null:
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
case UpdateProductStateInitial() when initial != null:
return initial();case UpdateProductStateLoading() when loading != null:
return loading();case UpdateProductStateSuccess() when success != null:
return success();case UpdateProductStateFailure() when failure != null:
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
case UpdateProductStateInitial():
return initial();case UpdateProductStateLoading():
return loading();case UpdateProductStateSuccess():
return success();case UpdateProductStateFailure():
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
case UpdateProductStateInitial() when initial != null:
return initial();case UpdateProductStateLoading() when loading != null:
return loading();case UpdateProductStateSuccess() when success != null:
return success();case UpdateProductStateFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class UpdateProductStateInitial implements UpdateProductState {
  const UpdateProductStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProductStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateProductState.initial()';
}


}




/// @nodoc


class UpdateProductStateLoading implements UpdateProductState {
  const UpdateProductStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProductStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateProductState.loading()';
}


}




/// @nodoc


class UpdateProductStateSuccess implements UpdateProductState {
  const UpdateProductStateSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProductStateSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateProductState.success()';
}


}




/// @nodoc


class UpdateProductStateFailure implements UpdateProductState {
  const UpdateProductStateFailure(this.message);
  

 final  String message;

/// Create a copy of UpdateProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProductStateFailureCopyWith<UpdateProductStateFailure> get copyWith => _$UpdateProductStateFailureCopyWithImpl<UpdateProductStateFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProductStateFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'UpdateProductState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $UpdateProductStateFailureCopyWith<$Res> implements $UpdateProductStateCopyWith<$Res> {
  factory $UpdateProductStateFailureCopyWith(UpdateProductStateFailure value, $Res Function(UpdateProductStateFailure) _then) = _$UpdateProductStateFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UpdateProductStateFailureCopyWithImpl<$Res>
    implements $UpdateProductStateFailureCopyWith<$Res> {
  _$UpdateProductStateFailureCopyWithImpl(this._self, this._then);

  final UpdateProductStateFailure _self;
  final $Res Function(UpdateProductStateFailure) _then;

/// Create a copy of UpdateProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UpdateProductStateFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
