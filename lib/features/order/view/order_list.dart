import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sizer/sizer.dart';

import '../../dashboard/widgets/dashboard_sidebar.dart';
import '../../dashboard/widgets/dashboard_header.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({super.key});

  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  String _selectedStatus = 'All Status';
  String _selectedTimeRange = 'Last 30 Days';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FC),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sidebar
          const DashboardSidebar(currentPath: '/orders'),

          // Main Content
          Expanded(
            child: Column(
              children: [
                // Global Header
                const DashboardHeader(title: 'Orders Management'),

                // Scrollable Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.w,
                      vertical: 2.h,
                    ),
                    child: Column(
                      children: [
                        // Stats Row
                        Row(
                          children: [
                            Expanded(
                              child: _StatCard(
                                title: 'Total Orders',
                                value: '1,284',
                                trend: '+12.5%',
                                isPositive: true,
                                icon: LucideIcons.shoppingCart,
                                iconColor: Colors.blue,
                              ),
                            ),
                            SizedBox(width: 1.5.w),
                            Expanded(
                              child: _StatCard(
                                title: 'Pending Shipments',
                                value: '43',
                                trend: '-2.1%',
                                isPositive: false,
                                icon: LucideIcons.truck,
                                iconColor: Colors.orange,
                              ),
                            ),
                            SizedBox(width: 1.5.w),
                            Expanded(
                              child: _StatCard(
                                title: 'Monthly Revenue',
                                value: '\$42,500.00',
                                trend: '+5.4%',
                                isPositive: true,
                                icon: LucideIcons.banknote,
                                iconColor: Colors.green,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 3.h),

                        // Filters & Table Container
                        Container(
                          padding: EdgeInsets.all(1.5.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.02),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              // Filters Toolbar
                              Row(
                                children: [
                                  _DropdownFilter(
                                    value: _selectedStatus,
                                    items: const [
                                      'All Status',
                                      'Pending',
                                      'Delivered',
                                      'Cancelled',
                                    ],
                                    onChanged: (v) =>
                                        setState(() => _selectedStatus = v!),
                                  ),
                                  SizedBox(width: 1.w),
                                  _DropdownFilter(
                                    value: _selectedTimeRange,
                                    items: const [
                                      'Last 30 Days',
                                      'Last 7 Days',
                                      'Today',
                                    ],
                                    icon: LucideIcons.calendar,
                                    onChanged: (v) =>
                                        setState(() => _selectedTimeRange = v!),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      LucideIcons.filter,
                                      size: 14.sp,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      LucideIcons.download,
                                      size: 14.sp,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  SizedBox(width: 1.w),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF258fb0),
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 16,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: const Text('Export CSV'),
                                  ),
                                ],
                              ),

                              SizedBox(height: 2.h),

                              // Table Header
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 1.w,
                                  vertical: 1.5.h,
                                ),
                                color: Colors.grey[50], // Header bg
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: _TableHeader('ORDER ID'),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: _TableHeader('DATE'),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: _TableHeader('CUSTOMER'),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: _TableHeader('TOTAL'),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: _TableHeader('STATUS'),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: _TableHeader(
                                        'ACTIONS',
                                        align: TextAlign.end,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Table Rows (Mock Data)
                              _OrderRow(
                                id: '#ORD-7721',
                                date: 'Oct 24, 2023',
                                name: 'Jane Cooper',
                                email: 'jane.cooper@example.com',
                                total: '\$240.50',
                                status: 'Delivered',
                              ),
                              _OrderRow(
                                id: '#ORD-7722',
                                date: 'Oct 25, 2023',
                                name: 'Cody Fisher',
                                email: 'cody.f@gmail.com',
                                total: '\$1,205.00',
                                status: 'Pending',
                              ),
                              _OrderRow(
                                id: '#ORD-7723',
                                date: 'Oct 25, 2023',
                                name: 'Esther Howard',
                                email: 'esther.h@outlook.com',
                                total: '\$84.20',
                                status: 'Shipped',
                              ),
                              _OrderRow(
                                id: '#ORD-7724',
                                date: 'Oct 26, 2023',
                                name: 'Jenny Wilson',
                                email: 'jenny.w@mac.com',
                                total: '\$540.00',
                                status: 'Delivered',
                              ),
                              _OrderRow(
                                id: '#ORD-7725',
                                date: 'Oct 26, 2023',
                                name: 'Kristin Watson',
                                email: 'kristin@company.com',
                                total: '\$12.50',
                                status: 'Cancelled',
                              ),

                              SizedBox(height: 2.h),

                              // Footer / Pagination
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Showing 1 to 5 of 1,284 entries',
                                    style: GoogleFonts.inter(
                                      color: Colors.grey[500],
                                      fontSize: 9.sp,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      OutlinedButton(
                                        onPressed: () {},
                                        style: OutlinedButton.styleFrom(
                                          foregroundColor: Colors.grey[700],
                                          side: BorderSide(
                                            color: Colors.grey[300]!,
                                          ),
                                        ),
                                        child: const Text('Previous'),
                                      ),
                                      SizedBox(width: 1.w),
                                      _PageButton('1', isActive: true),
                                      _PageButton('2'),
                                      _PageButton('3'),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                        ),
                                        child: Text(
                                          '...',
                                          style: TextStyle(
                                            color: Colors.grey[400],
                                          ),
                                        ),
                                      ),
                                      OutlinedButton(
                                        onPressed: () {},
                                        style: OutlinedButton.styleFrom(
                                          foregroundColor: Colors.grey[700],
                                          side: BorderSide(
                                            color: Colors.grey[300]!,
                                          ),
                                        ),
                                        child: const Text('Next'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // New Order FAB (Optional, but shown in bottom left of sidebar in design,
      // but typical Flutter pattern is FloatingActionButton)
      // The design has a "New Order" button in the sidebar bottom,
      // but let's stick to standard FAB or leave it as sidebar implementation details
      // (which we are not editing right now).
      // I'll add a FAB for convenience matching the style.
    );
  }
}

// --- Helper Widgets ---

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String trend;
  final bool isPositive;
  final IconData icon;
  final Color iconColor;

  const _StatCard({
    required this.title,
    required this.value,
    required this.trend,
    required this.isPositive,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.5.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 10.sp,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Icon(icon, color: iconColor, size: 16.sp),
            ],
          ),
          SizedBox(height: 1.h),
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 0.5.h),
          Row(
            children: [
              Icon(
                isPositive ? LucideIcons.trendingUp : LucideIcons.trendingDown,
                size: 10.sp,
                color: isPositive ? Colors.green : Colors.red,
              ),
              SizedBox(width: 4),
              Text(
                trend,
                style: GoogleFonts.inter(
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w600,
                  color: isPositive ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DropdownFilter extends StatelessWidget {
  final String value;
  final List<String> items;
  final IconData? icon;
  final Function(String?) onChanged;

  const _DropdownFilter({
    required this.value,
    required this.items,
    required this.onChanged,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          icon: Icon(
            LucideIcons.chevronDown,
            size: 16,
            color: Colors.grey[600],
          ),
          onChanged: onChanged,
          items: items.map((e) {
            return DropdownMenuItem(
              value: e,
              child: Row(
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 14, color: Colors.grey[600]),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    e,
                    style: GoogleFonts.inter(
                      fontSize: 10.sp,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _TableHeader extends StatelessWidget {
  final String text;
  final TextAlign align;

  const _TableHeader(this.text, {this.align = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: GoogleFonts.inter(
        fontSize: 8.sp,
        fontWeight: FontWeight.bold,
        color: Colors.grey[400],
        letterSpacing: 0.5,
      ),
    );
  }
}

class _OrderRow extends StatelessWidget {
  final String id;
  final String date;
  final String name;
  final String email;
  final String total;
  final String status;

  const _OrderRow({
    required this.id,
    required this.date,
    required this.name,
    required this.email,
    required this.total,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color statusBg;
    Color statusText;

    switch (status) {
      case 'Delivered':
        statusBg = const Color(0xFFE6F7ED);
        statusText = const Color(0xFF2E7D32);
        break;
      case 'Pending':
        statusBg = const Color(0xFFFFF4E5);
        statusText = const Color(0xFFED6C02);
        break;
      case 'Shipped':
        statusBg = const Color(0xFFE3F2FD);
        statusText = const Color(0xFF1976D2);
        break;
      case 'Cancelled':
        statusBg = const Color(0xFFFFEBEE);
        statusText = const Color(0xFFD32F2F);
        break;
      default:
        statusBg = Colors.grey[100]!;
        statusText = Colors.grey[700]!;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.h),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[100]!)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              id,
              style: GoogleFonts.inter(
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              date,
              style: GoogleFonts.inter(
                fontSize: 10.sp,
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.inter(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  email,
                  style: GoogleFonts.inter(
                    fontSize: 9.sp,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              total,
              style: GoogleFonts.inter(
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusBg,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    status,
                    style: GoogleFonts.inter(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w600,
                      color: statusText,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    LucideIcons.eye,
                    size: 14.sp,
                    color: Colors.grey[500],
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const SizedBox(width: 16),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    LucideIcons.pencil,
                    size: 14.sp,
                    color: Colors.grey[500],
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PageButton extends StatelessWidget {
  final String text;
  final bool isActive;

  const _PageButton(this.text, {this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF258fb0) : Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: isActive ? const Color(0xFF258fb0) : Colors.grey[300]!,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
