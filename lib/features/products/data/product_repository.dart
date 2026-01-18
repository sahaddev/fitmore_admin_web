import '../model/product_model.dart';
import 'product_api.dart';

class ProductRepository {
  final ProductApi _productApi;

  ProductRepository(this._productApi);

  Future<List<ProductModel>> getProducts() async {
    try {
      final data = await _productApi.getProducts();
      return data.map((item) => ProductModel.fromJson(item)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<ProductModel> addProduct(
    String name,
    String description,
    double price,
  ) async {
    try {
      final data = await _productApi.addProduct({
        'name': name,
        'description': description,
        'price': price,
      });
      return ProductModel.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}
