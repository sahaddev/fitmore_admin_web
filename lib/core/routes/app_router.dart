import 'package:fitmore_web/features/auth/view/login_page.dart';
import 'package:fitmore_web/features/coupons/view/coupon_list.dart';
import 'package:fitmore_web/features/dashboard/view/main_dashboard.dart';
import 'package:fitmore_web/features/order/view/order_list.dart';
import 'package:fitmore_web/features/products/view/add_product_page.dart';
import 'package:fitmore_web/features/products/view/product_list_page.dart';
import 'package:fitmore_web/features/user/view/user_list.dart';
import 'package:flutter/material.dart';

import 'app_routers.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouters.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case AppRouters.products:
        return MaterialPageRoute(builder: (_) => const ProductListPage());
      case AppRouters.addProduct:
        return MaterialPageRoute(builder: (_) => const AddProductPage());
      case AppRouters.dashboard:
        return MaterialPageRoute(builder: (_) => const MainDashboard());
      case AppRouters.orders:
        return MaterialPageRoute(builder: (_) => const OrderListPage());
      case AppRouters.customers:
        return MaterialPageRoute(builder: (_) => const UserListPage());
      case AppRouters.marketing:
        return MaterialPageRoute(builder: (_) => const CouponListPage());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(body: Center(child: Text('404'))),
        );
    }
  }
}
