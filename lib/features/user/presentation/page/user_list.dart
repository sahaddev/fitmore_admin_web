import 'package:fitmore_web/features/dashboard/presentation/widgets/dashboard_header.dart';
import 'package:fitmore_web/features/user/domain/entities/user.dart';
import 'package:fitmore_web/features/user/presentation/page/user_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

import 'package:fitmore_web/features/user/presentation/blocs/userList/user_list_bloc.dart';


class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  String activeTab = 'All Users';

  @override
  void initState() {
    super.initState();
    context.read<UserListBloc>().add(const UserListEvent.fetchUsers());
  }

  List<UserEntity> getFilteredUsers(List<UserEntity> allUsers) {
    if (activeTab == 'Active') {
      return allUsers.where((u) => u.active).toList();
    } else if (activeTab == 'Flagged') {
      return allUsers.where((u) => !u.active).toList();
    }
    return allUsers;
  }

  void _showUserDialog([UserEntity? user]) async {
    await showDialog(
      context: context,
      builder: (context) => UserDialog(user: user),
    );
    if (mounted) {
      context.read<UserListBloc>().add(const UserListEvent.fetchUsers());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FC),
      body: Column(
        children: [
          const DashboardHeader(title: 'User Management'),
          Expanded(
            child: BlocBuilder<UserListBloc, UserListState>(
              builder: (context, state) {
                List<UserEntity> currentUsers = [];
                bool isLoading = state is UserListStateLoading || state is UserListStateInitial;
                String? errorMsg;
                
                if (state is UserListStateLoaded) {
                  currentUsers = state.users;
                } else if (state is UserListStateFailure) {
                  errorMsg = state.message;
                }

                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPageHeader(currentUsers.length),
                      SizedBox(height: 3.h),
                      _buildTabs(),
                      SizedBox(height: 2.h),
                      if (isLoading)
                        const Center(child: CircularProgressIndicator())
                      else if (errorMsg != null)
                        Center(
                          child: Text(
                            errorMsg,
                            style: const TextStyle(color: Colors.red),
                          ),
                        )
                      else
                        _buildUsersTable(currentUsers),
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

  Widget _buildPageHeader(int usersCount) {
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
              'Manage and monitor $usersCount registered customers in your database.',
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
              onPressed: () => _showUserDialog(),
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

  Widget _buildTabs() {
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
                isActive: activeTab == 'All Users',
                onTap: () => setState(() => activeTab = 'All Users'),
              ),
              _TabButton(
                label: 'Active',
                isActive: activeTab == 'Active',
                onTap: () => setState(() => activeTab = 'Active'),
              ),
              _TabButton(
                label: 'Flagged',
                isActive: activeTab == 'Flagged',
                onTap: () => setState(() => activeTab = 'Flagged'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUsersTable(List<UserEntity> allUsers) {
    final filtered = getFilteredUsers(allUsers);
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
          if (filtered.isEmpty)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: const Center(child: Text('No users found.')),
            )
          else
            ...filtered.map(
              (user) =>
                  _UserRow(user: user, onEdit: () => _showUserDialog(user)),
            ),

          SizedBox(height: 2.h),

          // Pagination (Hardcoded for now as per original UI)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Showing 1 to ${filtered.length} of ${filtered.length} results',
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
  final UserEntity user;
  final VoidCallback onEdit;

  const _UserRow({required this.user, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    Color statusBg = user.active
        ? const Color(0xFFE6F7ED)
        : const Color(0xFFF3F4F6);
    Color statusText = user.active
        ? const Color(0xFF2E7D32)
        : const Color(0xFF6B7280);
    Color statusDot = user.active
        ? const Color(0xFF2E7D32)
        : const Color(0xFF9CA3AF);

    final joinDate = user.createdAt ?? DateTime.now();
    final joinDateStr = DateFormat('MMM dd, yyyy').format(joinDate);
    final joinTimeStr = DateFormat('hh:mm a').format(joinDate);

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
                  backgroundImage: user.profileImage != null
                      ? NetworkImage(user.profileImage!)
                      : null,
                  child: user.profileImage == null
                      ? const Icon(LucideIcons.user, size: 18)
                      : null,
                ),
                SizedBox(width: 1.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.username,
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
                  user.phoneNumber ?? '--',
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
                  '${user.ordersCount}',
                  style: GoogleFonts.inter(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                        user.active ? 'Active' : 'Flagged',
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
                  LucideIcons.edit,
                  size: 12.sp,
                  color: const Color(0xFF258fb0),
                ),
                onPressed: onEdit,
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
