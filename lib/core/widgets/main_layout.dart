import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/dashboard/widgets/dashboard_sidebar.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // Get the current path to highlight the correct sidebar item
    final String currentPath = GoRouterState.of(context).uri.path;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FC),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sidebar stays static on the left
          DashboardSidebar(currentPath: currentPath),

          // Only this part updates when switching routes
          Expanded(
            child: KeyedSubtree(
              key: ValueKey(currentPath),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
