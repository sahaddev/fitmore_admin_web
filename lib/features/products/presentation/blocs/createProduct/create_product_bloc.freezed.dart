// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateProductEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateProductEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateProductEvent()';
}


}

/// @nodoc
class $CreateProductEventCopyWith<$Res>  {
$CreateProductEventCopyWith(CreateProductEvent _, $Res Function(CreateProductEvent) __);
}


/// Adds pattern-matching-related methods to [CreateProductEvent].
extension CreateProductEventPatterns on CreateProductEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _PickImage value)?  pickImage,TResult Function( _CreateProduct value)?  createProduct,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PickImage() when pickImage != null:
return pickImage(_that);case _CreateProduct() when createProduct != null:
return createProduct(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _PickImage value)  pickImage,required TResult Function( _CreateProduct value)  createProduct,}){
final _that = this;
switch (_that) {
case _PickImage():
return pickImage(_that);case _CreateProduct():
return createProduct(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _PickImage value)?  pickImage,TResult? Function( _CreateProduct value)?  createProduct,}){
final _that = this;
switch (_that) {
case _PickImage() when pickImage != null:
return pickImage(_that);case _CreateProduct() when createProduct != null:
return createProduct(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  pickImage,TResult Function( ProductEntity product)?  createProduct,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PickImage() when pickImage != null:
return pickImage();case _CreateProduct() when createProduct != null:
return createProduct(_that.product);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  pickImage,required TResult Function( ProductEntity product)  createProduct,}) {final _that = this;
switch (_that) {
case _PickImage():
return pickImage();case _CreateProduct():
return createProduct(_that.product);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  pickImage,TResult? Function( ProductEntity product)?  createProduct,}) {final _that = this;
switch (_that) {
case _PickImage() when pickImage != null:
return pickImage();case _CreateProduct() when createProduct != null:
return createProduct(_that.product);case _:
  return null;

}
}

}

/// @nodoc


class _PickImage implements CreateProductEvent {
  const _PickImage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PickImage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateProductEvent.pickImage()';
}


}




/// @nodoc


class _CreateProduct implements CreateProductEvent {
  const _CreateProduct({required this.product});
  

 final  ProductEntity product;

/// Create a copy of CreateProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateProductCopyWith<_CreateProduct> get copyWith => __$CreateProductCopyWithImpl<_CreateProduct>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateProduct&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,product);

@override
String toString() {
  return 'CreateProductEvent.createProduct(product: $product)';
}


}

/// @nodoc
abstract mixin class _$CreateProductCopyWith<$Res> implements $CreateProductEventCopyWith<$Res> {
  factory _$CreateProductCopyWith(_CreateProduct value, $Res Function(_CreateProduct) _then) = __$CreateProductCopyWithImpl;
@useResult
$Res call({
 ProductEntity product
});




}
/// @nodoc
class __$CreateProductCopyWithImpl<$Res>
    implements _$CreateProductCopyWith<$Res> {
  __$CreateProductCopyWithImpl(this._self, this._then);

  final _CreateProduct _self;
  final $Res Function(_CreateProduct) _then;

/// Create a copy of CreateProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? product = null,}) {
  return _then(_CreateProduct(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductEntity,
  ));
}


}

/// @nodoc
mixin _$CreateProductState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateProductState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateProductState()';
}


}

/// @nodoc
class $CreateProductStateCopyWith<$Res>  {
$CreateProductStateCopyWith(CreateProductState _, $Res Function(CreateProductState) __);
}


/// Adds pattern-matching-related methods to [CreateProductState].
extension CreateProductStatePatterns on CreateProductState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreateProductStateInitial value)?  initial,TResult Function( CreateProductStateLoading value)?  loading,TResult Function( CreateProductStateSuccess value)?  success,TResult Function( CreateProductStateFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreateProductStateInitial() when initial != null:
return initial(_that);case CreateProductStateLoading() when loading != null:
return loading(_that);case CreateProductStateSuccess() when success != null:
return success(_that);case CreateProductStateFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreateProductStateInitial value)  initial,required TResult Function( CreateProductStateLoading value)  loading,required TResult Function( CreateProductStateSuccess value)  success,required TResult Function( CreateProductStateFailure value)  failure,}){
final _that = this;
switch (_that) {
case CreateProductStateInitial():
return initial(_that);case CreateProductStateLoading():
return loading(_that);case CreateProductStateSuccess():
return success(_that);case CreateProductStateFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreateProductStateInitial value)?  initial,TResult? Function( CreateProductStateLoading value)?  loading,TResult? Function( CreateProductStateSuccess value)?  success,TResult? Function( CreateProductStateFailure value)?  failure,}){
final _that = this;
switch (_that) {
case CreateProductStateInitial() when initial != null:
return initial(_that);case CreateProductStateLoading() when loading != null:
return loading(_that);case CreateProductStateSuccess() when success != null:
return success(_that);case CreateProductStateFailure() when failure != null:
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
case CreateProductStateInitial() when initial != null:
return initial();case CreateProductStateLoading() when loading != null:
return loading();case CreateProductStateSuccess() when success != null:
return success();case CreateProductStateFailure() when failure != null:
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
case CreateProductStateInitial():
return initial();case CreateProductStateLoading():
return loading();case CreateProductStateSuccess():
return success();case CreateProductStateFailure():
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
case CreateProductStateInitial() when initial != null:
return initial();case CreateProductStateLoading() when loading != null:
return loading();case CreateProductStateSuccess() when success != null:
return success();case CreateProductStateFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class CreateProductStateInitial implements CreateProductState {
  const CreateProductStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateProductStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateProductState.initial()';
}


}




/// @nodoc


class CreateProductStateLoading implements CreateProductState {
  const CreateProductStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateProductStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateProductState.loading()';
}


}




/// @nodoc


class CreateProductStateSuccess implements CreateProductState {
  const CreateProductStateSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateProductStateSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateProductState.success()';
}


}




/// @nodoc


class CreateProductStateFailure implements CreateProductState {
  const CreateProductStateFailure(this.message);
  

 final  String message;

/// Create a copy of CreateProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateProductStateFailureCopyWith<CreateProductStateFailure> get copyWith => _$CreateProductStateFailureCopyWithImpl<CreateProductStateFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateProductStateFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CreateProductState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $CreateProductStateFailureCopyWith<$Res> implements $CreateProductStateCopyWith<$Res> {
  factory $CreateProductStateFailureCopyWith(CreateProductStateFailure value, $Res Function(CreateProductStateFailure) _then) = _$CreateProductStateFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CreateProductStateFailureCopyWithImpl<$Res>
    implements $CreateProductStateFailureCopyWith<$Res> {
  _$CreateProductStateFailureCopyWithImpl(this._self, this._then);

  final CreateProductStateFailure _self;
  final $Res Function(CreateProductStateFailure) _then;

/// Create a copy of CreateProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CreateProductStateFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
