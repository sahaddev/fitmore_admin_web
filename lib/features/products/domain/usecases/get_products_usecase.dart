import '../entities/product.dart';
import '../repositories/i_product_repository.dart';

class GetProductsUseCase {
  final IProductRepository repository;

  GetProductsUseCase(this.repository);

  Future<List<Product>> call() {
    return repository.getProducts();
  }
}
