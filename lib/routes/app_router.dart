import 'package:go_router/go_router.dart';
import '../features/auth/view/login_page.dart';
import '../features/products/view/product_list_page.dart';
import '../features/products/view/add_product_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(
        path: '/products',
        builder: (context, state) => const ProductListPage(),
      ),
      GoRoute(
        path: '/add-product',
        builder: (context, state) => const AddProductPage(),
      ),
    ],
  );
}
