import 'package:dio/dio.dart';
import 'package:fitmore_web/core/network/dio_client.dart';
import 'package:fitmore_web/core/network/dio_error_handler.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<void> createProduct(ProductModel product);
  Future<ProductModel> getProductById(int id);
  Future<void> deleteProduct(int id);
  Future<ProductModel> updateProduct(int id, ProductModel product);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final DioClient _dioClient = DioClient.instance;

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final response = await _dioClient.get('/api/products');
      if (response.statusCode == 200) {
        return (response.data['datas'] as List<dynamic>)
            .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw DioException(
          requestOptions: RequestOptions(path: '/api/products'),
          message: "Failed to load products",
        );
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handleDioError(e);
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  @override
  Future<void> createProduct(ProductModel product) async {
    try {
      final response = await _dioClient.post(
        '/api/product',
        data: product.toJson(),
      );
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw DioException(
          requestOptions: RequestOptions(path: '/api/product'),
          message: "Failed to create product",
        );
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handleDioError(e);
    } catch (e) {
      throw Exception('Failed to create product: $e');
    }
  }

  @override
  Future<ProductModel> getProductById(int id) async {
    try {
      final response = await _dioClient.get(
        '/api/product',
        queryParameters: {'id': id},
      );
      if (response.statusCode == 200) {
        return ProductModel.fromJson(response.data['product']);
      } else {
        throw DioException(
          requestOptions: RequestOptions(path: '/api/product'),
          message: "Failed to fetch product",
        );
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handleDioError(e);
    } catch (e) {
      throw Exception('Failed to fetch product: $e');
    }
  }

  @override
  Future<void> deleteProduct(int id) async {
    try {
      final response = await _dioClient.delete(
        '/api/product',
        queryParameters: {'id': id},
      );
      if (response.statusCode != 200) {
        throw DioException(
          requestOptions: RequestOptions(path: '/api/product'),
          message: "Failed to delete product",
        );
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handleDioError(e);
    } catch (e) {
      throw Exception('Failed to delete product: $e');
    }
  }

  @override
  Future<ProductModel> updateProduct(int id, ProductModel product) async {
    try {
      final response = await _dioClient.put(
        '/api/product',
        queryParameters: {'id': id},
        data: product.toJson(),
      );
      if (response.statusCode == 200) {
        return ProductModel.fromJson(response.data['product']);
      } else {
        throw DioException(
          requestOptions: RequestOptions(path: '/api/product'),
          message: "Failed to update product",
        );
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handleDioError(e);
    } catch (e) {
      throw Exception('Failed to update product: $e');
    }
  }
}
