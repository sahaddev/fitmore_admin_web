import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_remote_data_source.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource = ProductRemoteDataSourceImpl();

  @override
  Future<List<ProductEntity>> getAllProducts() async {
    return await remoteDataSource.getAllProducts();
  }

  @override
  Future<void> createProduct(ProductEntity product) async {
    final productModel = ProductModel.fromEntity(product);
    return await remoteDataSource.createProduct(productModel);
  }

  @override
  Future<ProductEntity> getProductById(int id) async {
    return await remoteDataSource.getProductById(id);
  }

  @override
  Future<void> deleteProduct(int id) async {
    return await remoteDataSource.deleteProduct(id);
  }

  @override
  Future<ProductEntity> updateProduct(int id, ProductEntity product) async {
    final productModel = ProductModel.fromEntity(product);
    return await remoteDataSource.updateProduct(id, productModel);
  }
}
