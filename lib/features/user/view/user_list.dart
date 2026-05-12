import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../dashboard/widgets/dashboard_header.dart';
import '../view_model/user_view_model.dart';
import '../model/user_model.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FC),
      body: Column(
        children: [
          const DashboardHeader(title: 'User Management'),
          Expanded(
            child: Consumer<UserViewModel>(
              builder: (context, viewModel, child) {
                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPageHeader(viewModel),
                      SizedBox(height: 3.h),
                      _buildTabs(viewModel),
                      SizedBox(height: 2.h),
                      if (viewModel.isLoading)
                        const Center(child: CircularProgressIndicator())
                      else if (viewModel.error != null)
                        Center(child: Text('Error: ${viewModel.error}'))
                      else
                        _buildUsersTable(viewModel),
                      SizedBox(height: 5.h),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageHeader(UserViewModel viewModel) {
    return Row(
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
              'Manage and monitor ${viewModel.users.length} registered customers in your database.',
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
    );
  }

  Widget _buildTabs(UserViewModel viewModel) {
    return Row(
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
                isActive: viewModel.activeTab == 'All Users',
                onTap: () => viewModel.setActiveTab('All Users'),
              ),
              _TabButton(
                label: 'Active',
                isActive: viewModel.activeTab == 'Active',
                onTap: () => viewModel.setActiveTab('Active'),
              ),
              _TabButton(
                label: 'Flagged',
                isActive: viewModel.activeTab == 'Flagged',
                onTap: () => viewModel.setActiveTab('Flagged'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUsersTable(UserViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
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
            child: const Row(
              children: [
                Expanded(flex: 3, child: _TableHeader('CUSTOMER')),
                Expanded(flex: 3, child: _TableHeader('CONTACT INFO')),
                Expanded(flex: 1, child: _TableHeader('ORDERS')),
                Expanded(flex: 2, child: _TableHeader('JOIN DATE')),
                Expanded(flex: 1, child: _TableHeader('STATUS')),
                Expanded(
                  flex: 1,
                  child: _TableHeader('ACTIONS', align: TextAlign.end),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: Colors.grey[100]),

          // Rows
          if (viewModel.filteredUsers.isEmpty)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: const Center(child: Text('No users found.')),
            )
          else
            ...viewModel.filteredUsers.map((user) => _UserRow(user: user)),

          SizedBox(height: 2.h),

          // Pagination (Hardcoded for now as per original UI)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Showing 1 to ${viewModel.filteredUsers.length} of ${viewModel.filteredUsers.length} results',
                  style: GoogleFonts.inter(
                    fontSize: 9.sp,
                    color: Colors.grey[500],
                  ),
                ),
                Row(
                  children: [
                    const _PaginationBtn(icon: LucideIcons.chevronLeft),
                    const SizedBox(width: 4),
                    const _PaginationBtn(text: '1', isActive: true),
                    const _PaginationBtn(text: '2'),
                    const _PaginationBtn(text: '3'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        '...',
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                    ),
                    const _PaginationBtn(text: '25'),
                    const SizedBox(width: 4),
                    const _PaginationBtn(icon: LucideIcons.chevronRight),
                  ],
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
  final UserModel user;

  const _UserRow({required this.user});

  @override
  Widget build(BuildContext context) {
    Color statusBg = user.status == 'Active'
        ? const Color(0xFFE6F7ED)
        : const Color(0xFFF3F4F6);
    Color statusText = user.status == 'Active'
        ? const Color(0xFF2E7D32)
        : const Color(0xFF6B7280);
    Color statusDot = user.status == 'Active'
        ? const Color(0xFF2E7D32)
        : const Color(0xFF9CA3AF);

    final joinDateStr = DateFormat('MMM dd, yyyy').format(user.joinDate);
    final joinTimeStr = DateFormat('hh:mm a').format(user.joinDate);

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
                  backgroundImage: NetworkImage(user.avatarUrl),
                ),
                SizedBox(width: 1.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: GoogleFonts.inter(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'ID: ${user.id}',
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
                  user.email,
                  style: GoogleFonts.inter(
                    fontSize: 10.sp,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  user.phone,
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
                  '${user.orders}',
                  style: GoogleFonts.inter(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (user.recentOrders != null && user.recentOrders! > 0) ...[
                  const SizedBox(width: 6),
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
                      '+${user.recentOrders}',
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
                  joinDateStr,
                  style: GoogleFonts.inter(
                    fontSize: 10.sp,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  joinTimeStr,
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
                      const SizedBox(width: 6),
                      Text(
                        user.status,
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
