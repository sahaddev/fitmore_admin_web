import 'package:fitmore_web/features/dashboard/view/main_dashboard.dart';
import 'package:go_router/go_router.dart';
import '../features/auth/view/login_page.dart';
import '../features/products/view/product_list_page.dart';
import '../features/products/view/add_product_page.dart';
import '../features/order/view/order_list.dart';
import '../features/user/view/user_list.dart';
import '../features/coupons/view/coupon_list.dart';

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
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const MainDashboard(),
      ),
      GoRoute(
        path: '/orders',
        builder: (context, state) => const OrderListPage(),
      ),
      GoRoute(
        path: '/customers',
        builder: (context, state) => const UserListPage(),
      ),
      GoRoute(
        path: '/marketing',
        builder: (context, state) => const CouponListPage(),
      ),
    ],
  );
}
