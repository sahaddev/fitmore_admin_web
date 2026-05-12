import 'package:flutter/material.dart';
import '../../features/products/data/product_api.dart';
import '../../features/products/data/product_repository.dart';
import '../../features/products/view_model/product_view_model.dart';
import '../../features/user/data/user_api.dart';
import '../../features/user/data/user_repository.dart';
import '../../features/user/view_model/user_view_model.dart';

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
  late final ProductApi productApi;
  late final UserApi userApi;
  late final ProductRepository productRepository;
  late final UserRepository userRepository;
  late final ProductViewModel productViewModel;
  late final UserViewModel userViewModel;

  @override
  void initState() {
    super.initState();
    productApi = ProductApi();
    userApi = UserApi();
    productRepository = ProductRepository(productApi);
    userRepository = UserRepository(userApi);
    productViewModel = ProductViewModel(productRepository);
    userViewModel = UserViewModel(userRepository);

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
