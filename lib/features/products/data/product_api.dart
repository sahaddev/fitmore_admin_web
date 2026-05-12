class ProductApi {
  // Mock in-memory storage for demo
  final List<Map<String, dynamic>> _mockProducts = [
    {
      'id': '1',
      'name': 'Protein Powder',
      'description': 'Whey protein isolate',
      'price': 49.99,
    },
    {
      'id': '2',
      'name': 'Dumbbells Set',
      'description': '5kg - 25kg adjustable',
      'price': 199.99,
    },
    {
      'id': '3',
      'name': 'Yoga Mat',
      'description': 'Non-slip exercise mat',
      'price': 25.00,
    },
  ];

  ProductApi();

  Future<List<dynamic>> getProducts() async {
    // MOCK IMPLEMENTATION
    return _mockProducts;
    // Real: return await _apiService.get(ApiConstants.productsEndpoint);
  }

  Future<Map<String, dynamic>> addProduct(
    Map<String, dynamic> productData,
  ) async {
    // MOCK IMPLEMENTATION
    final newProduct = {
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      ...productData,
    };
    _mockProducts.add(newProduct);
    return newProduct;
    // Real: return await _apiService.post(ApiConstants.productsEndpoint, productData);
  }
}
