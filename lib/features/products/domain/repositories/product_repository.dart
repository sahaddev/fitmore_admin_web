import '../entities/product.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getAllProducts();
  Future<void> createProduct(ProductEntity product);
  Future<ProductEntity> getProductById(int id);
  Future<void> deleteProduct(int id);
  Future<ProductEntity> updateProduct(int id, ProductEntity product);
}
