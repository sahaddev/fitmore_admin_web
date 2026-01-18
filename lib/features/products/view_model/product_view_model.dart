import 'package:flutter/foundation.dart';
import '../data/product_repository.dart';
import '../model/product_model.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductRepository _productRepository;

  ProductViewModel(this._productRepository);

  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> fetchProducts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _products = await _productRepository.getProducts();
    } catch (e) {
      _error = e.toString().replaceAll('Exception: ', '');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> addProduct(String name, String description, double price) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Optimistic update or fetch after add
      final newProduct = await _productRepository.addProduct(
        name,
        description,
        price,
      );
      _products.add(newProduct);
      return true;
    } catch (e) {
      _error = e.toString().replaceAll('Exception: ', '');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
