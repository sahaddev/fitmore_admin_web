class ProductRemoteDataSource {
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

  ProductRemoteDataSource();

  Future<List<Map<String, dynamic>>> getProducts() async {
    return _mockProducts;
  }

  Future<Map<String, dynamic>> addProduct(
    Map<String, dynamic> productData,
  ) async {
    final newProduct = {
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      ...productData,
    };
    _mockProducts.add(newProduct);
    return newProduct;
  }
}
