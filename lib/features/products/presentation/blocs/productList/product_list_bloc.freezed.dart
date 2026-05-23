// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductListEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductListEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductListEvent()';
}


}

/// @nodoc
class $ProductListEventCopyWith<$Res>  {
$ProductListEventCopyWith(ProductListEvent _, $Res Function(ProductListEvent) __);
}


/// Adds pattern-matching-related methods to [ProductListEvent].
extension ProductListEventPatterns on ProductListEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchProducts value)?  fetchProducts,TResult Function( _DeleteProduct value)?  deleteProduct,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchProducts() when fetchProducts != null:
return fetchProducts(_that);case _DeleteProduct() when deleteProduct != null:
return deleteProduct(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchProducts value)  fetchProducts,required TResult Function( _DeleteProduct value)  deleteProduct,}){
final _that = this;
switch (_that) {
case _FetchProducts():
return fetchProducts(_that);case _DeleteProduct():
return deleteProduct(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchProducts value)?  fetchProducts,TResult? Function( _DeleteProduct value)?  deleteProduct,}){
final _that = this;
switch (_that) {
case _FetchProducts() when fetchProducts != null:
return fetchProducts(_that);case _DeleteProduct() when deleteProduct != null:
return deleteProduct(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchProducts,TResult Function( int id)?  deleteProduct,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchProducts() when fetchProducts != null:
return fetchProducts();case _DeleteProduct() when deleteProduct != null:
return deleteProduct(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchProducts,required TResult Function( int id)  deleteProduct,}) {final _that = this;
switch (_that) {
case _FetchProducts():
return fetchProducts();case _DeleteProduct():
return deleteProduct(_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchProducts,TResult? Function( int id)?  deleteProduct,}) {final _that = this;
switch (_that) {
case _FetchProducts() when fetchProducts != null:
return fetchProducts();case _DeleteProduct() when deleteProduct != null:
return deleteProduct(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _FetchProducts implements ProductListEvent {
  const _FetchProducts();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchProducts);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductListEvent.fetchProducts()';
}


}




/// @nodoc


class _DeleteProduct implements ProductListEvent {
  const _DeleteProduct(this.id);
  

 final  int id;

/// Create a copy of ProductListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteProductCopyWith<_DeleteProduct> get copyWith => __$DeleteProductCopyWithImpl<_DeleteProduct>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteProduct&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'ProductListEvent.deleteProduct(id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeleteProductCopyWith<$Res> implements $ProductListEventCopyWith<$Res> {
  factory _$DeleteProductCopyWith(_DeleteProduct value, $Res Function(_DeleteProduct) _then) = __$DeleteProductCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$DeleteProductCopyWithImpl<$Res>
    implements _$DeleteProductCopyWith<$Res> {
  __$DeleteProductCopyWithImpl(this._self, this._then);

  final _DeleteProduct _self;
  final $Res Function(_DeleteProduct) _then;

/// Create a copy of ProductListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_DeleteProduct(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ProductListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductListState()';
}


}

/// @nodoc
class $ProductListStateCopyWith<$Res>  {
$ProductListStateCopyWith(ProductListState _, $Res Function(ProductListState) __);
}


/// Adds pattern-matching-related methods to [ProductListState].
extension ProductListStatePatterns on ProductListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProductListStateInitial value)?  initial,TResult Function( ProductListStateLoading value)?  loading,TResult Function( ProductListStateLoaded value)?  loaded,TResult Function( ProductListStateFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProductListStateInitial() when initial != null:
return initial(_that);case ProductListStateLoading() when loading != null:
return loading(_that);case ProductListStateLoaded() when loaded != null:
return loaded(_that);case ProductListStateFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProductListStateInitial value)  initial,required TResult Function( ProductListStateLoading value)  loading,required TResult Function( ProductListStateLoaded value)  loaded,required TResult Function( ProductListStateFailure value)  failure,}){
final _that = this;
switch (_that) {
case ProductListStateInitial():
return initial(_that);case ProductListStateLoading():
return loading(_that);case ProductListStateLoaded():
return loaded(_that);case ProductListStateFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProductListStateInitial value)?  initial,TResult? Function( ProductListStateLoading value)?  loading,TResult? Function( ProductListStateLoaded value)?  loaded,TResult? Function( ProductListStateFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ProductListStateInitial() when initial != null:
return initial(_that);case ProductListStateLoading() when loading != null:
return loading(_that);case ProductListStateLoaded() when loaded != null:
return loaded(_that);case ProductListStateFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ProductEntity> products)?  loaded,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProductListStateInitial() when initial != null:
return initial();case ProductListStateLoading() when loading != null:
return loading();case ProductListStateLoaded() when loaded != null:
return loaded(_that.products);case ProductListStateFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ProductEntity> products)  loaded,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case ProductListStateInitial():
return initial();case ProductListStateLoading():
return loading();case ProductListStateLoaded():
return loaded(_that.products);case ProductListStateFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ProductEntity> products)?  loaded,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case ProductListStateInitial() when initial != null:
return initial();case ProductListStateLoading() when loading != null:
return loading();case ProductListStateLoaded() when loaded != null:
return loaded(_that.products);case ProductListStateFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ProductListStateInitial implements ProductListState {
  const ProductListStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductListStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductListState.initial()';
}


}




/// @nodoc


class ProductListStateLoading implements ProductListState {
  const ProductListStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductListStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductListState.loading()';
}


}




/// @nodoc


class ProductListStateLoaded implements ProductListState {
  const ProductListStateLoaded(final  List<ProductEntity> products): _products = products;
  

 final  List<ProductEntity> _products;
 List<ProductEntity> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}


/// Create a copy of ProductListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductListStateLoadedCopyWith<ProductListStateLoaded> get copyWith => _$ProductListStateLoadedCopyWithImpl<ProductListStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductListStateLoaded&&const DeepCollectionEquality().equals(other._products, _products));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products));

@override
String toString() {
  return 'ProductListState.loaded(products: $products)';
}


}

/// @nodoc
abstract mixin class $ProductListStateLoadedCopyWith<$Res> implements $ProductListStateCopyWith<$Res> {
  factory $ProductListStateLoadedCopyWith(ProductListStateLoaded value, $Res Function(ProductListStateLoaded) _then) = _$ProductListStateLoadedCopyWithImpl;
@useResult
$Res call({
 List<ProductEntity> products
});




}
/// @nodoc
class _$ProductListStateLoadedCopyWithImpl<$Res>
    implements $ProductListStateLoadedCopyWith<$Res> {
  _$ProductListStateLoadedCopyWithImpl(this._self, this._then);

  final ProductListStateLoaded _self;
  final $Res Function(ProductListStateLoaded) _then;

/// Create a copy of ProductListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? products = null,}) {
  return _then(ProductListStateLoaded(
null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductEntity>,
  ));
}


}

/// @nodoc


class ProductListStateFailure implements ProductListState {
  const ProductListStateFailure(this.message);
  

 final  String message;

/// Create a copy of ProductListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductListStateFailureCopyWith<ProductListStateFailure> get copyWith => _$ProductListStateFailureCopyWithImpl<ProductListStateFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductListStateFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProductListState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProductListStateFailureCopyWith<$Res> implements $ProductListStateCopyWith<$Res> {
  factory $ProductListStateFailureCopyWith(ProductListStateFailure value, $Res Function(ProductListStateFailure) _then) = _$ProductListStateFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ProductListStateFailureCopyWithImpl<$Res>
    implements $ProductListStateFailureCopyWith<$Res> {
  _$ProductListStateFailureCopyWithImpl(this._self, this._then);

  final ProductListStateFailure _self;
  final $Res Function(ProductListStateFailure) _then;

/// Create a copy of ProductListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ProductListStateFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
