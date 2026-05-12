import 'package:flutter/foundation.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_products_usecase.dart';
import '../../domain/usecases/add_product_usecase.dart';

class ProductViewModel extends ChangeNotifier {
  final GetProductsUseCase _getProductsUseCase;
  final AddProductUseCase _addProductUseCase;

  ProductViewModel(this._getProductsUseCase, this._addProductUseCase);

  List<Product> _products = [];
  List<Product> get products => _products;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> fetchProducts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _products = await _getProductsUseCase();
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
      final newProduct = await _addProductUseCase(name, description, price);
      _products.add(newProduct);
      notifyListeners();
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
