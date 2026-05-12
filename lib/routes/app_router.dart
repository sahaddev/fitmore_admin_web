import 'package:fitmore_web/core/widgets/main_layout.dart';
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
      ShellRoute(
        builder: (context, state, child) => MainLayout(child: child),
        routes: [
          GoRoute(
            path: '/products',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ProductListPage()),
          ),
          GoRoute(
            path: '/add-product',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: AddProductPage()),
          ),
          GoRoute(
            path: '/dashboard',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: MainDashboard()),
          ),
          GoRoute(
            path: '/orders',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: OrderListPage()),
          ),
          GoRoute(
            path: '/customers',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: UserListPage()),
          ),
          GoRoute(
            path: '/marketing',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: CouponListPage()),
          ),
        ],
      ),
    ],
  );
}
