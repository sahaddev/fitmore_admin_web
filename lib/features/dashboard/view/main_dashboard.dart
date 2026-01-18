import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sizer/sizer.dart';

import '../widgets/dashboard_header.dart';
import '../widgets/dashboard_sidebar.dart';
import '../widgets/dashboard_stats_card.dart';
import '../widgets/recent_orders_table.dart';
import '../widgets/revenue_growth_chart.dart';

class MainDashboard extends StatelessWidget {
  const MainDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sidebar
          const DashboardSidebar(),

          // Main Content
          Expanded(
            child: Column(
              children: [
                const DashboardHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.w,
                      vertical: 2.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Stats Cards Row
                        Row(
                          children: [
                            Expanded(
                              child: DashboardStatsCard(
                                title: 'Total Users',
                                value: '12,840',
                                icon: LucideIcons.users,
                                iconColor: Colors.blue,
                                changePercentage: '+12%',
                                isPositive: true,
                              ),
                            ),
                            SizedBox(width: 1.5.w),
                            Expanded(
                              child: DashboardStatsCard(
                                title: 'Active Products',
                                value: '1,205',
                                icon: LucideIcons.package,
                                iconColor: Colors.teal,
                                changePercentage: '- 0%',
                                isPositive: false,
                              ),
                            ),
                            SizedBox(width: 1.5.w),
                            Expanded(
                              child: DashboardStatsCard(
                                title: 'Daily Orders',
                                value: '450',
                                icon: LucideIcons.truck,
                                iconColor: Colors.orange,
                                changePercentage: '+5%',
                                isPositive: true,
                              ),
                            ),
                            SizedBox(width: 1.5.w),
                            Expanded(
                              child: DashboardStatsCard(
                                title: 'Monthly Revenue',
                                value: '\$84,200.00',
                                icon: LucideIcons.dollarSign,
                                iconColor: Color(0xFF258fb0),
                                changePercentage: '+8%',
                                isPositive: true,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 3.h),

                        // Revenue Chart
                        const RevenueGrowthChart(),

                        SizedBox(height: 3.h),

                        // Recent Orders
                        RecentOrdersTable(),

                        SizedBox(height: 5.h), // Bottom padding
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
