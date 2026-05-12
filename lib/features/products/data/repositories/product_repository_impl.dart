import '../../domain/entities/product.dart';
import '../../domain/repositories/i_product_repository.dart';
import '../datasources/product_remote_data_source.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements IProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Product>> getProducts() async {
    final productsJson = await remoteDataSource.getProducts();
    return productsJson.map((json) => ProductModel.fromJson(json)).toList().cast<Product>();
  }

  @override
  Future<Product> addProduct(
    String name,
    String description,
    double price,
  ) async {
    final productData = {
      'name': name,
      'description': description,
      'price': price,
    };
    final productJson = await remoteDataSource.addProduct(productData);
    return ProductModel.fromJson(productJson) as Product;
  }
}
