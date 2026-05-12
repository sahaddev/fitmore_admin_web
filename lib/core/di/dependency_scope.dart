import 'package:flutter/material.dart';
// Products feature
import '../../features/products/data/datasources/product_remote_data_source.dart';
import '../../features/products/data/repositories/product_repository_impl.dart';
import '../../features/products/domain/usecases/get_products_usecase.dart';
import '../../features/products/domain/usecases/add_product_usecase.dart';
import '../../features/products/presentation/view_model/product_view_model.dart';
// User feature
import '../../features/user/data/datasources/user_remote_data_source.dart';
import '../../features/user/data/repositories/user_repository_impl.dart';
import '../../features/user/domain/usecases/get_users_usecase.dart';
import '../../features/user/presentation/view_model/user_view_model.dart';

class DependencyScope extends StatefulWidget {
  final Widget child;

  const DependencyScope({super.key, required this.child});

  static DependencyScopeState of(BuildContext context) {
    final DependencyScopeState? result =
        context.findAncestorStateOfType<DependencyScopeState>();
    if (result == null) {
      throw FlutterError('DependencyScope.of() called with a context that does not contain a DependencyScope.');
    }
    return result;
  }

  @override
  State<DependencyScope> createState() => DependencyScopeState();
}

class DependencyScopeState extends State<DependencyScope> {
  // ViewModels (Publicly accessible)
  late final ProductViewModel productViewModel;
  late final UserViewModel userViewModel;

  @override
  void initState() {
    super.initState();
    
    // 1. Data Sources
    final productRemoteDataSource = ProductRemoteDataSource();
    final userRemoteDataSource = UserRemoteDataSource();

    // 2. Repositories
    final productRepository = ProductRepositoryImpl(productRemoteDataSource);
    final userRepository = UserRepositoryImpl(userRemoteDataSource);

    // 3. Use Cases
    final getProductsUseCase = GetProductsUseCase(productRepository);
    final addProductUseCase = AddProductUseCase(productRepository);
    final getUsersUseCase = GetUsersUseCase(userRepository);

    // 4. ViewModels
    productViewModel = ProductViewModel(getProductsUseCase, addProductUseCase);
    userViewModel = UserViewModel(getUsersUseCase);

    // Initial data fetching
    productViewModel.fetchProducts();
    userViewModel.fetchUsers();
  }

  @override
  void dispose() {
    productViewModel.dispose();
    userViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedDependencyScope(
      state: this,
      child: widget.child,
    );
  }
}

class _InheritedDependencyScope extends InheritedWidget {
  final DependencyScopeState state;

  const _InheritedDependencyScope({
    required this.state,
    required super.child,
  });

  @override
  bool updateShouldNotify(_InheritedDependencyScope oldWidget) => false;
}
