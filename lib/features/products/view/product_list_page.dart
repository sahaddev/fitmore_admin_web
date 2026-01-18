import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../view_model/product_view_model.dart';
import '../../auth/view_model/auth_view_model.dart';
import '../../../../core/constants/app_colors.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  void initState() {
    super.initState();
    // Fetch products on init
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductViewModel>().fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Watch relevant ViewModels
    final productViewModel = context.watch<ProductViewModel>();
    final authViewModel = context.watch<AuthViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              authViewModel.logout();
              context.go('/login');
            },
          ),
        ],
      ),
      body: productViewModel.isLoading && productViewModel.products.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : productViewModel.error != null
          ? Center(child: Text('Error: ${productViewModel.error}'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: productViewModel.products.length,
              itemBuilder: (context, index) {
                final product = productViewModel.products[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.secondary,
                      child: Text(product.name[0].toUpperCase()),
                    ),
                    title: Text(product.name),
                    subtitle: Text(product.description),
                    trailing: Text('\$${product.price.toStringAsFixed(2)}'),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/add-product'),
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
