import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:lucide_icons/lucide_icons.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      child: Row(
        children: [
          Text(
            'Dashboard Overview',
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          SizedBox(width: 4.w),
          Expanded(
            child: Container(
              constraints: BoxConstraints(maxWidth: 40.w),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search orders, users...',
                  hintStyle: GoogleFonts.inter(
                    color: Colors.grey[500],
                    fontSize: 11.sp,
                  ),
                  prefixIcon: Icon(
                    LucideIcons.search,
                    color: Colors.grey[400],
                    size: 18.sp,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 1.5.h,
                    horizontal: 1.w,
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(LucideIcons.bell, color: Colors.grey[700], size: 18.sp),
          ),
          SizedBox(width: 1.w),
          IconButton(
            onPressed: () {},
            icon: Icon(
              LucideIcons.helpCircle,
              color: Colors.grey[700],
              size: 18.sp,
            ),
          ),
          SizedBox(width: 2.w),
          Container(height: 40, width: 1, color: Colors.grey[300]),
          SizedBox(width: 2.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Alex Morgan',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 11.sp,
                  color: Colors.black87,
                ),
              ),
              Text(
                'Administrator',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 9.sp,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          SizedBox(width: 1.w),
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
              'https://i.pravatar.cc/150?u=a042581f4e29026704d',
            ),
          ),
        ],
      ),
    );
  }
}
