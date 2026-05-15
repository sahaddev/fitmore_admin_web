// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_deatile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductDeatileEvent {

 int get id;
/// Create a copy of ProductDeatileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDeatileEventCopyWith<ProductDeatileEvent> get copyWith => _$ProductDeatileEventCopyWithImpl<ProductDeatileEvent>(this as ProductDeatileEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDeatileEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'ProductDeatileEvent(id: $id)';
}


}

/// @nodoc
abstract mixin class $ProductDeatileEventCopyWith<$Res>  {
  factory $ProductDeatileEventCopyWith(ProductDeatileEvent value, $Res Function(ProductDeatileEvent) _then) = _$ProductDeatileEventCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$ProductDeatileEventCopyWithImpl<$Res>
    implements $ProductDeatileEventCopyWith<$Res> {
  _$ProductDeatileEventCopyWithImpl(this._self, this._then);

  final ProductDeatileEvent _self;
  final $Res Function(ProductDeatileEvent) _then;

/// Create a copy of ProductDeatileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductDeatileEvent].
extension ProductDeatileEventPatterns on ProductDeatileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchProductDetail value)?  fetchProductDetail,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchProductDetail() when fetchProductDetail != null:
return fetchProductDetail(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchProductDetail value)  fetchProductDetail,}){
final _that = this;
switch (_that) {
case _FetchProductDetail():
return fetchProductDetail(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchProductDetail value)?  fetchProductDetail,}){
final _that = this;
switch (_that) {
case _FetchProductDetail() when fetchProductDetail != null:
return fetchProductDetail(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int id)?  fetchProductDetail,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchProductDetail() when fetchProductDetail != null:
return fetchProductDetail(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int id)  fetchProductDetail,}) {final _that = this;
switch (_that) {
case _FetchProductDetail():
return fetchProductDetail(_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int id)?  fetchProductDetail,}) {final _that = this;
switch (_that) {
case _FetchProductDetail() when fetchProductDetail != null:
return fetchProductDetail(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _FetchProductDetail implements ProductDeatileEvent {
  const _FetchProductDetail({required this.id});
  

@override final  int id;

/// Create a copy of ProductDeatileEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchProductDetailCopyWith<_FetchProductDetail> get copyWith => __$FetchProductDetailCopyWithImpl<_FetchProductDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchProductDetail&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'ProductDeatileEvent.fetchProductDetail(id: $id)';
}


}

/// @nodoc
abstract mixin class _$FetchProductDetailCopyWith<$Res> implements $ProductDeatileEventCopyWith<$Res> {
  factory _$FetchProductDetailCopyWith(_FetchProductDetail value, $Res Function(_FetchProductDetail) _then) = __$FetchProductDetailCopyWithImpl;
@override @useResult
$Res call({
 int id
});




}
/// @nodoc
class __$FetchProductDetailCopyWithImpl<$Res>
    implements _$FetchProductDetailCopyWith<$Res> {
  __$FetchProductDetailCopyWithImpl(this._self, this._then);

  final _FetchProductDetail _self;
  final $Res Function(_FetchProductDetail) _then;

/// Create a copy of ProductDeatileEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_FetchProductDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ProductDeatileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDeatileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductDeatileState()';
}


}

/// @nodoc
class $ProductDeatileStateCopyWith<$Res>  {
$ProductDeatileStateCopyWith(ProductDeatileState _, $Res Function(ProductDeatileState) __);
}


/// Adds pattern-matching-related methods to [ProductDeatileState].
extension ProductDeatileStatePatterns on ProductDeatileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProductDeatileStateInitial value)?  initial,TResult Function( ProductDeatileStateLoading value)?  loading,TResult Function( ProductDeatileStateLoaded value)?  loaded,TResult Function( ProductDeatileStateFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProductDeatileStateInitial() when initial != null:
return initial(_that);case ProductDeatileStateLoading() when loading != null:
return loading(_that);case ProductDeatileStateLoaded() when loaded != null:
return loaded(_that);case ProductDeatileStateFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProductDeatileStateInitial value)  initial,required TResult Function( ProductDeatileStateLoading value)  loading,required TResult Function( ProductDeatileStateLoaded value)  loaded,required TResult Function( ProductDeatileStateFailure value)  failure,}){
final _that = this;
switch (_that) {
case ProductDeatileStateInitial():
return initial(_that);case ProductDeatileStateLoading():
return loading(_that);case ProductDeatileStateLoaded():
return loaded(_that);case ProductDeatileStateFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProductDeatileStateInitial value)?  initial,TResult? Function( ProductDeatileStateLoading value)?  loading,TResult? Function( ProductDeatileStateLoaded value)?  loaded,TResult? Function( ProductDeatileStateFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ProductDeatileStateInitial() when initial != null:
return initial(_that);case ProductDeatileStateLoading() when loading != null:
return loading(_that);case ProductDeatileStateLoaded() when loaded != null:
return loaded(_that);case ProductDeatileStateFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ProductEntity product)?  loaded,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProductDeatileStateInitial() when initial != null:
return initial();case ProductDeatileStateLoading() when loading != null:
return loading();case ProductDeatileStateLoaded() when loaded != null:
return loaded(_that.product);case ProductDeatileStateFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ProductEntity product)  loaded,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case ProductDeatileStateInitial():
return initial();case ProductDeatileStateLoading():
return loading();case ProductDeatileStateLoaded():
return loaded(_that.product);case ProductDeatileStateFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ProductEntity product)?  loaded,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case ProductDeatileStateInitial() when initial != null:
return initial();case ProductDeatileStateLoading() when loading != null:
return loading();case ProductDeatileStateLoaded() when loaded != null:
return loaded(_that.product);case ProductDeatileStateFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ProductDeatileStateInitial implements ProductDeatileState {
  const ProductDeatileStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDeatileStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductDeatileState.initial()';
}


}




/// @nodoc


class ProductDeatileStateLoading implements ProductDeatileState {
  const ProductDeatileStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDeatileStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductDeatileState.loading()';
}


}




/// @nodoc


class ProductDeatileStateLoaded implements ProductDeatileState {
  const ProductDeatileStateLoaded(this.product);
  

 final  ProductEntity product;

/// Create a copy of ProductDeatileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDeatileStateLoadedCopyWith<ProductDeatileStateLoaded> get copyWith => _$ProductDeatileStateLoadedCopyWithImpl<ProductDeatileStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDeatileStateLoaded&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,product);

@override
String toString() {
  return 'ProductDeatileState.loaded(product: $product)';
}


}

/// @nodoc
abstract mixin class $ProductDeatileStateLoadedCopyWith<$Res> implements $ProductDeatileStateCopyWith<$Res> {
  factory $ProductDeatileStateLoadedCopyWith(ProductDeatileStateLoaded value, $Res Function(ProductDeatileStateLoaded) _then) = _$ProductDeatileStateLoadedCopyWithImpl;
@useResult
$Res call({
 ProductEntity product
});




}
/// @nodoc
class _$ProductDeatileStateLoadedCopyWithImpl<$Res>
    implements $ProductDeatileStateLoadedCopyWith<$Res> {
  _$ProductDeatileStateLoadedCopyWithImpl(this._self, this._then);

  final ProductDeatileStateLoaded _self;
  final $Res Function(ProductDeatileStateLoaded) _then;

/// Create a copy of ProductDeatileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? product = null,}) {
  return _then(ProductDeatileStateLoaded(
null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductEntity,
  ));
}


}

/// @nodoc


class ProductDeatileStateFailure implements ProductDeatileState {
  const ProductDeatileStateFailure(this.message);
  

 final  String message;

/// Create a copy of ProductDeatileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDeatileStateFailureCopyWith<ProductDeatileStateFailure> get copyWith => _$ProductDeatileStateFailureCopyWithImpl<ProductDeatileStateFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDeatileStateFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProductDeatileState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProductDeatileStateFailureCopyWith<$Res> implements $ProductDeatileStateCopyWith<$Res> {
  factory $ProductDeatileStateFailureCopyWith(ProductDeatileStateFailure value, $Res Function(ProductDeatileStateFailure) _then) = _$ProductDeatileStateFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ProductDeatileStateFailureCopyWithImpl<$Res>
    implements $ProductDeatileStateFailureCopyWith<$Res> {
  _$ProductDeatileStateFailureCopyWithImpl(this._self, this._then);

  final ProductDeatileStateFailure _self;
  final $Res Function(ProductDeatileStateFailure) _then;

/// Create a copy of ProductDeatileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ProductDeatileStateFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
