import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:go_router/go_router.dart';

class DashboardSidebar extends StatelessWidget {
  final String currentPath;
  const DashboardSidebar({super.key, this.currentPath = '/dashboard'});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 3.h),
          // Logo
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFF258fb0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(LucideIcons.store, color: Colors.white, size: 20),
                ),
                SizedBox(width: 1.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ShopAdmin',
                      style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'Management Portal',
                      style: GoogleFonts.inter(
                        fontSize: 8.sp,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          // Menu Items
          _MenuItem(
            icon: LucideIcons.layoutDashboard,
            label: 'Dashboard',
            path: '/dashboard',
            isActive: currentPath == '/dashboard',
          ),
          _MenuItem(
            icon: LucideIcons.box,
            label: 'Products',
            path: '/products',
            isActive: currentPath.startsWith('/products'),
          ),
          _MenuItem(
            icon: LucideIcons.shoppingCart,
            label: 'Orders',
            path: '/orders',
            isActive: currentPath.startsWith('/orders'),
          ),
          _MenuItem(
            icon: LucideIcons.users,
            label: 'Customers',
            path: '/customers',
            isActive: currentPath.startsWith('/customers'),
          ),
          _MenuItem(
            icon: LucideIcons.barChart2,
            label: 'Reports',
            path: '/reports',
            isActive: currentPath.startsWith('/reports'),
          ),
          Spacer(),
          // Bottom Items
          Divider(),
          _MenuItem(
            icon: LucideIcons.settings,
            label: 'Settings',
            path: '/settings',
            isActive: currentPath.startsWith('/settings'),
          ),
          SizedBox(height: 2.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2.w),
            padding: EdgeInsets.all(1.5.w),
            decoration: BoxDecoration(
              color: Color(0xFFeaf6f9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PLAN',
                  style: GoogleFonts.inter(
                    fontSize: 8.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF258fb0),
                  ),
                ),
                SizedBox(height: 0.5.h),
                Text(
                  'Enterprise Edition',
                  style: GoogleFonts.inter(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final String path;

  const _MenuItem({
    required this.icon,
    required this.label,
    required this.path,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.5.h),
      child: Material(
        color: isActive ? Color(0xFF258fb0) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: () {
            context.go(path);
          },
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.2.h),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 14.sp,
                  color: isActive ? Colors.white : Colors.grey[600],
                ),
                SizedBox(width: 1.w),
                Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: isActive ? Colors.white : Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
