import '../entities/product.dart';
import '../repositories/i_product_repository.dart';

class AddProductUseCase {
  final IProductRepository repository;

  AddProductUseCase(this.repository);

  Future<Product> call(String name, String description, double price) {
    return repository.addProduct(name, description, price);
  }
}
