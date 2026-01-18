import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sizer/sizer.dart';

import '../../dashboard/widgets/dashboard_sidebar.dart';
import '../../dashboard/widgets/dashboard_header.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  String _activeTab = 'All Users';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FC),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sidebar
          const DashboardSidebar(currentPath: '/customers'),

          // Main Content
          Expanded(
            child: Column(
              children: [
                // Global Header
                const DashboardHeader(title: 'User Management'),

                // Scrollable Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.w,
                      vertical: 2.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Page Header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'User Management',
                                  style: GoogleFonts.inter(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: 0.5.h),
                                Text(
                                  'Manage and monitor 1,240 registered customers in your database.',
                                  style: GoogleFonts.inter(
                                    fontSize: 10.sp,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                OutlinedButton.icon(
                                  onPressed: () {},
                                  icon: Icon(LucideIcons.download, size: 14.sp),
                                  label: const Text('Export CSV'),
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.black87,
                                    side: BorderSide(color: Colors.grey[300]!),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 1.5.w,
                                      vertical: 1.5.h,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 1.w),
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: Icon(LucideIcons.userPlus, size: 14.sp),
                                  label: const Text('Add Customer'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF258fb0),
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 1.5.w,
                                      vertical: 1.5.h,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        SizedBox(height: 3.h),

                        // Tabs
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey[200]!),
                              ),
                              child: Row(
                                children: [
                                  _TabButton(
                                    label: 'All Users',
                                    isActive: _activeTab == 'All Users',
                                    onTap: () => setState(
                                      () => _activeTab = 'All Users',
                                    ),
                                  ),
                                  _TabButton(
                                    label: 'Active',
                                    isActive: _activeTab == 'Active',
                                    onTap: () =>
                                        setState(() => _activeTab = 'Active'),
                                  ),
                                  _TabButton(
                                    label: 'Flagged',
                                    isActive: _activeTab == 'Flagged',
                                    onTap: () =>
                                        setState(() => _activeTab = 'Flagged'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 2.h),

                        // Users Table
                        Container(
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
                              // Header
                              Padding(
                                padding: EdgeInsets.all(1.5.w),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: _TableHeader('CUSTOMER'),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: _TableHeader('CONTACT INFO'),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: _TableHeader('ORDERS'),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: _TableHeader('JOIN DATE'),
                                    ),
                                    Expanded(
                                      flex: 1,
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
                              Divider(height: 1, color: Colors.grey[100]),

                              // Rows
                              _UserRow(
                                name: 'Alex Rivera',
                                id: '#49201',
                                email: 'alex.rivera@email.com',
                                phone: '+1 (555) 0123',
                                orders: '42',
                                orderBadge: '+5',
                                joinDate: 'Oct 12, 2023',
                                joinTime: '10:45 AM',
                                status: 'Active',
                                avatarUrl: 'https://i.pravatar.cc/150?u=1',
                              ),
                              _UserRow(
                                name: 'Sarah Chen',
                                id: '#49202',
                                email: 'sarah.c@corp.net',
                                phone: '+1 (555) 0987',
                                orders: '15',
                                joinDate: 'Nov 05, 2023',
                                joinTime: '02:12 PM',
                                status: 'Active',
                                avatarUrl: 'https://i.pravatar.cc/150?u=2',
                              ),
                              _UserRow(
                                name: 'Marcus Wright',
                                id: '#49203',
                                email: 'm.wright@email.com',
                                phone: '+1 (555) 4433',
                                orders: '0',
                                joinDate: 'Dec 01, 2023',
                                joinTime: '09:30 AM',
                                status: 'Inactive',
                                avatarUrl: 'https://i.pravatar.cc/150?u=3',
                              ),
                              _UserRow(
                                name: 'Jordan Smith',
                                id: '#49204',
                                email: 'jordan.s@provider.com',
                                phone: '+1 (555) 7788',
                                orders: '8',
                                joinDate: 'Dec 15, 2023',
                                joinTime: '11:58 PM',
                                status: 'Active',
                                avatarUrl: 'https://i.pravatar.cc/150?u=4',
                              ),
                              _UserRow(
                                name: 'Elena Rodriguez',
                                id: '#49205',
                                email: 'elena.r@email.com',
                                phone: '+1 (555) 2299',
                                orders: '27',
                                joinDate: 'Jan 10, 2024',
                                joinTime: '04:00 PM',
                                status: 'Active',
                                avatarUrl: 'https://i.pravatar.cc/150?u=5',
                              ),

                              SizedBox(height: 2.h),

                              // Pagination
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 1.5.w,
                                  vertical: 1.h,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Showing 1 to 5 of 1,240 results',
                                      style: GoogleFonts.inter(
                                        fontSize: 9.sp,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        _PaginationBtn(
                                          icon: LucideIcons.chevronLeft,
                                        ),
                                        SizedBox(width: 4),
                                        _PaginationBtn(
                                          text: '1',
                                          isActive: true,
                                        ),
                                        _PaginationBtn(text: '2'),
                                        _PaginationBtn(text: '3'),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                          ),
                                          child: Text(
                                            '...',
                                            style: TextStyle(
                                              color: Colors.grey[400],
                                            ),
                                          ),
                                        ),
                                        _PaginationBtn(text: '25'),
                                        SizedBox(width: 4),
                                        _PaginationBtn(
                                          icon: LucideIcons.chevronRight,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 2.h),
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
    );
  }
}

// --- Helpers ---

class _TabButton extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _TabButton({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 0.8.h),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF258fb0) : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 9.sp,
            fontWeight: FontWeight.w500,
            color: isActive ? Colors.white : Colors.grey[600],
          ),
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
        fontWeight: FontWeight.w600,
        color: Colors.grey[400],
        letterSpacing: 0.5,
      ),
    );
  }
}

class _UserRow extends StatelessWidget {
  final String name;
  final String id;
  final String email;
  final String phone;
  final String orders;
  final String? orderBadge;
  final String joinDate;
  final String joinTime;
  final String status;
  final String avatarUrl;

  const _UserRow({
    required this.name,
    required this.id,
    required this.email,
    required this.phone,
    required this.orders,
    this.orderBadge,
    required this.joinDate,
    required this.joinTime,
    required this.status,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    Color statusBg = status == 'Active'
        ? const Color(0xFFE6F7ED)
        : const Color(0xFFF3F4F6);
    Color statusText = status == 'Active'
        ? const Color(0xFF2E7D32)
        : const Color(0xFF6B7280);
    Color statusDot = status == 'Active'
        ? const Color(0xFF2E7D32)
        : const Color(0xFF9CA3AF);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.2.h),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[100]!)),
      ),
      child: Row(
        children: [
          // Customer
          Expanded(
            flex: 3,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundImage: NetworkImage(avatarUrl),
                ),
                SizedBox(width: 1.w),
                Column(
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
                      'ID: $id',
                      style: GoogleFonts.inter(
                        fontSize: 9.sp,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Contact Info
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  email,
                  style: GoogleFonts.inter(
                    fontSize: 10.sp,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  phone,
                  style: GoogleFonts.inter(
                    fontSize: 9.sp,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          // Orders
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Text(
                  orders,
                  style: GoogleFonts.inter(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (orderBadge != null) ...[
                  SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6F7ED),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      orderBadge!,
                      style: GoogleFonts.inter(
                        fontSize: 8.sp,
                        color: const Color(0xFF2E7D32),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          // Join Date
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  joinDate,
                  style: GoogleFonts.inter(
                    fontSize: 10.sp,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  joinTime,
                  style: GoogleFonts.inter(
                    fontSize: 9.sp,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          // Status
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusBg,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: statusDot,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 6),
                      Text(
                        status,
                        style: GoogleFonts.inter(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w600,
                          color: statusText,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Actions
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(
                  LucideIcons.moreHorizontal,
                  size: 14.sp,
                  color: Colors.grey[400],
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PaginationBtn extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final bool isActive;

  const _PaginationBtn({this.text, this.icon, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF258fb0) : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isActive ? const Color(0xFF258fb0) : Colors.grey[300]!,
        ),
      ),
      child: Center(
        child: text != null
            ? Text(
                text!,
                style: GoogleFonts.inter(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: isActive ? Colors.white : Colors.grey[700],
                ),
              )
            : Icon(icon, size: 12.sp, color: Colors.grey[700]),
      ),
    );
  }
}
