import 'package:flutter/material.dart';
import 'package:fitmore_web/core/routes/app_routers.dart';
import 'package:fitmore_web/core/routes/navigation_service.dart';
import '../../features/dashboard/presentation/widgets/dashboard_sidebar.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FC),
      body: ValueListenableBuilder<String>(
        valueListenable: NavigationService.currentRoute,
        builder: (context, currentRoute, _) {
          final bool isLoginPage =
              currentRoute == AppRouters.login || currentRoute.isEmpty;

          if (isLoginPage) {
            return child;
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sidebar stays static on the left and doesn't rebuild
              DashboardSidebar(currentPath: currentRoute),

              // Only this part updates when switching routes
              Expanded(
                child: child,
              ),
            ],
          );
        },
      ),
    );
  }
}
