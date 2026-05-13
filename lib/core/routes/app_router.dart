import 'package:fitmore_web/core/routes/navigation_service.dart';
import 'package:fitmore_web/features/auth/presentation/view/login_page.dart';
import 'package:fitmore_web/features/coupons/presentation/view/coupon_list.dart';
import 'package:fitmore_web/features/dashboard/presentation/view/main_dashboard.dart';
import 'package:fitmore_web/features/order/presentation/view/order_list.dart';
import 'package:fitmore_web/features/products/presentation/pages/add_product_page.dart';
import 'package:fitmore_web/features/products/presentation/pages/product_list_page.dart';
import 'package:fitmore_web/features/user/presentation/page/user_list.dart';
import 'package:flutter/material.dart';

import 'app_routers.dart';

class NoTransitionPageRoute<T> extends MaterialPageRoute<T> {
  NoTransitionPageRoute({required super.builder, super.settings});

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child; // No animation
  }
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    if (settings.name != null) {
      NavigationService.updateRoute(settings.name!);
    }
    switch (settings.name) {
      case AppRouters.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case AppRouters.products:
        return NoTransitionPageRoute(
          builder: (_) => const ProductListPage(),
          settings: settings,
        );
      case AppRouters.addProduct:
        return NoTransitionPageRoute(
          builder: (_) => const AddProductPage(),
          settings: settings,
        );
      case AppRouters.dashboard:
        return NoTransitionPageRoute(
          builder: (_) => const MainDashboard(),
          settings: settings,
        );
      case AppRouters.orders:
        return NoTransitionPageRoute(
          builder: (_) => const OrderListPage(),
          settings: settings,
        );
      case AppRouters.customers:
        return NoTransitionPageRoute(
          builder: (_) => const UserListPage(),
          settings: settings,
        );
      case AppRouters.marketing:
        return NoTransitionPageRoute(
          builder: (_) => const CouponListPage(),
          settings: settings,
        );
      default:
        return NoTransitionPageRoute(
          builder: (_) => const Scaffold(body: Center(child: Text('404'))),
        );
    }
  }
}
