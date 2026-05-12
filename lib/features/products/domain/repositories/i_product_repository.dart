import '../entities/product.dart';

abstract class IProductRepository {
  Future<List<Product>> getProducts();
  Future<Product> addProduct(String name, String description, double price);
}
