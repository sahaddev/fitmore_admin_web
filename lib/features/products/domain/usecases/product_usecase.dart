import '../entities/product.dart';
import '../repositories/product_repository.dart';
import '../../data/repositories/product_repository_impl.dart';

class ProductUsecase {
  final ProductRepository productRepository = ProductRepositoryImpl();

  Future<List<ProductEntity>> getAllProducts() async {
    return await productRepository.getAllProducts();
  }

  Future<void> createProduct(ProductEntity product) async {
    return await productRepository.createProduct(product);
  }

  Future<ProductEntity> getProductById(int id) async {
    return await productRepository.getProductById(id);
  }

  Future<void> deleteProduct(int id) async {
    return await productRepository.deleteProduct(id);
  }

  Future<ProductEntity> updateProduct(int id, ProductEntity product) async {
    return await productRepository.updateProduct(id, product);
  }
}
