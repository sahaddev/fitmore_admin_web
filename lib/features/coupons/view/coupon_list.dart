import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sizer/sizer.dart';

import '../../dashboard/widgets/dashboard_sidebar.dart';
import '../../dashboard/widgets/dashboard_header.dart';

class CouponListPage extends StatefulWidget {
  const CouponListPage({super.key});

  @override
  State<CouponListPage> createState() => _CouponListPageState();
}

class _CouponListPageState extends State<CouponListPage> {
  String _discountType = 'Percentage';
  final _codeController = TextEditingController(text: 'WINTER2024');
  final _valueController = TextEditingController(text: '15');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FC),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sidebar
          const DashboardSidebar(currentPath: '/marketing'),

          // Main Content
          Expanded(
            child: Column(
              children: [
                const DashboardHeader(title: 'Coupons & Marketing'),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.w,
                      vertical: 2.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Page Title Area
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Coupons & Marketing',
                              style: GoogleFonts.inter(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 0.5.h),
                            Text(
                              'Design and manage promotional codes to drive customer engagement.',
                              style: GoogleFonts.inter(
                                fontSize: 10.sp,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 3.h),

                        // Create New Coupon Card
                        Container(
                          padding: const EdgeInsets.all(24),
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
                                  Icon(
                                    LucideIcons.plusCircle,
                                    size: 14.sp,
                                    color: Colors.grey[400],
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'CREATE NEW COUPON',
                                    style: GoogleFonts.inter(
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[400],
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.h),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: _InputGroup(
                                      label: 'Coupon Code',
                                      child: TextField(
                                        controller: _codeController,
                                        style: GoogleFonts.robotoMono(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        decoration: InputDecoration(
                                          suffixIcon: Icon(
                                            Icons.refresh,
                                            size: 16,
                                            color: const Color(0xFF258fb0),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            borderSide: BorderSide(
                                              color: Colors.grey[300]!,
                                            ),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                horizontal: 16,
                                                vertical: 14,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 1.5.w),
                                  Expanded(
                                    flex: 2,
                                    child: _InputGroup(
                                      label: 'Discount Type',
                                      child: Container(
                                        height: 48, // Match textfield height
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey[300]!,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () => setState(
                                                  () => _discountType =
                                                      'Percentage',
                                                ),
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        _discountType ==
                                                            'Percentage'
                                                        ? const Color(
                                                            0xFFEAF6F9,
                                                          )
                                                        : Colors.transparent,
                                                    borderRadius:
                                                        const BorderRadius.horizontal(
                                                          left: Radius.circular(
                                                            7,
                                                          ),
                                                        ),
                                                  ),
                                                  child: Text(
                                                    'Percentage',
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color:
                                                          _discountType ==
                                                              'Percentage'
                                                          ? const Color(
                                                              0xFF258fb0,
                                                            )
                                                          : Colors.grey[600],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 1,
                                              color: Colors.grey[300],
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () => setState(
                                                  () => _discountType =
                                                      'Fixed Amount',
                                                ),
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        _discountType ==
                                                            'Fixed Amount'
                                                        ? const Color(
                                                            0xFFEAF6F9,
                                                          )
                                                        : Colors.transparent,
                                                    borderRadius:
                                                        const BorderRadius.horizontal(
                                                          right:
                                                              Radius.circular(
                                                                7,
                                                              ),
                                                        ),
                                                  ),
                                                  child: Text(
                                                    'Fixed Amount',
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color:
                                                          _discountType ==
                                                              'Fixed Amount'
                                                          ? const Color(
                                                              0xFF258fb0,
                                                            )
                                                          : Colors.grey[600],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 1.5.w),
                                  Expanded(
                                    flex: 1,
                                    child: _InputGroup(
                                      label: 'Discount Value',
                                      child: TextField(
                                        controller: _valueController,
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                        ),
                                        decoration: InputDecoration(
                                          suffixText:
                                              _discountType == 'Percentage'
                                              ? '%'
                                              : '\$',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            borderSide: BorderSide(
                                              color: Colors.grey[300]!,
                                            ),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                horizontal: 16,
                                                vertical: 14,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 2.w),
                                  Expanded(
                                    flex: 2,
                                    child: SizedBox(
                                      height: 48,
                                      child: ElevatedButton.icon(
                                        onPressed: () {},
                                        icon: const Icon(
                                          LucideIcons.zap,
                                          size: 18,
                                        ),
                                        label: const Text('Generate Campaign'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(
                                            0xFF258fb0,
                                          ),
                                          foregroundColor: Colors.white,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 3.h),

                        // Stats Row
                        Row(
                          children: [
                            Expanded(
                              child: _StatCard(
                                label: 'TOTAL REDEMPTIONS',
                                value: '12,842',
                                trend: '+14%',
                                isPositive: true,
                              ),
                            ),
                            SizedBox(width: 1.5.w),
                            Expanded(
                              child: _StatCard(
                                label: 'ACTIVE CAMPAIGNS',
                                value: '8',
                                subtext: 'Across 3 categories',
                              ),
                            ),
                            SizedBox(width: 1.5.w),
                            Expanded(
                              child: _StatCard(
                                label: 'REVENUE IMPACT',
                                value: '\$45.2k',
                                subtext: 'Last 30 days',
                                subtextColor: const Color(0xFF258fb0),
                              ),
                            ),
                            SizedBox(width: 1.5.w),
                            Expanded(
                              child: _StatCard(
                                label: 'AVG. ORDER LIFT',
                                value: '22.4%',
                                trend: '+5%',
                                isPositive: true,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 3.h),

                        // Active Campaigns Header
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: const Color(0xFF258fb0),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Icon(
                                LucideIcons.ticket,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 1.w),
                            Text(
                              'Active Campaigns',
                              style: GoogleFonts.inter(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const Spacer(),
                            OutlinedButton.icon(
                              onPressed: () {},
                              icon: const Icon(LucideIcons.filter, size: 14),
                              label: const Text('Filter'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.black87,
                                side: BorderSide(color: Colors.grey[300]!),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                              ),
                            ),
                            SizedBox(width: 1.w),
                            OutlinedButton.icon(
                              onPressed: () {},
                              icon: const Icon(LucideIcons.list, size: 14),
                              label: const Text('Latest'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.black87,
                                side: BorderSide(color: Colors.grey[300]!),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 2.h),

                        // Campaigns Grid
                        LayoutBuilder(
                          builder: (context, constraints) {
                            return Wrap(
                              spacing: 1.5.w,
                              runSpacing: 1.5.w,
                              children: [
                                _CampaignCard(
                                  width:
                                      (constraints.maxWidth - 3.w) /
                                      3, // 3 column approx
                                  code: 'SUMMER25',
                                  status: 'ACTIVE',
                                  title: '25% Discount',
                                  desc: 'Applicable on all beachwear items',
                                  progress: 0.742,
                                  progressLabel: '742 / 1000',
                                  dateLabel: 'Ends Sep 15, 2024',
                                  dateIcon: LucideIcons.calendarDays,
                                ),
                                _CampaignCard(
                                  width: (constraints.maxWidth - 3.w) / 3,
                                  code: 'WELCOME10',
                                  status: 'EXPIRED',
                                  title: '10% Off First Order',
                                  desc: 'New customer acquisition campaign',
                                  progress: 1.0,
                                  progressLabel: '5,000 / 5,000',
                                  dateLabel: 'Ended Jan 30, 2024',
                                  dateIcon: LucideIcons.history,
                                  isExpired: true,
                                ),
                                _CampaignCard(
                                  width: (constraints.maxWidth - 3.w) / 3,
                                  code: 'VIPACCESS',
                                  status: 'SCHEDULED',
                                  title: '\$50.00 Off',
                                  desc: 'Loyalty reward for tier 3 members',
                                  limitLabel: 'Unlimited Usage',
                                  dateLabel: 'Starts Oct 01, 2024',
                                  dateIcon: LucideIcons.calendarClock,
                                  isScheduled: true,
                                ),
                                _CampaignCard(
                                  width: (constraints.maxWidth - 3.w) / 3,
                                  code: 'FLASH50',
                                  status: 'ENDING SOON',
                                  title: '50% Clearance',
                                  desc: 'Inventory liquidation event',
                                  progress: 0.96,
                                  progressLabel: '2,401 / 2,500',
                                  dateLabel: 'Expires in 4 hours',
                                  dateIcon: LucideIcons.timer,
                                  isEndingSoon: true,
                                ),
                                _CampaignCard(
                                  width: (constraints.maxWidth - 3.w) / 3,
                                  code: 'FREESHIP',
                                  status: 'ACTIVE',
                                  title: 'Free Shipping',
                                  desc: 'Orders above \$150',
                                  progress: 0.45,
                                  progressLabel: '+124 users',
                                  progressLabelLeft: 'Weekly Usage',
                                  dateLabel: 'Never Expires',
                                  dateIcon: LucideIcons.calendarCheck,
                                ),
                                // Add Card
                                Container(
                                  width: (constraints.maxWidth - 3.w) / 3,
                                  height: 240, // Approx height matching others
                                  decoration: BoxDecoration(
                                    color: Colors.grey[50],
                                    borderRadius: BorderRadius.circular(12),
                                    border: DottedBorder(
                                      color: Colors.grey[300]!,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        LucideIcons.plus,
                                        size: 24.sp,
                                        color: Colors.grey[400],
                                      ),
                                      SizedBox(height: 1.h),
                                      Text(
                                        'QUICK CAMPAIGN',
                                        style: GoogleFonts.inter(
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[400],
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
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

class _InputGroup extends StatelessWidget {
  final String label;
  final Widget child;

  const _InputGroup({required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 9.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ),
        child,
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final String? trend;
  final String? subtext;
  final Color? subtextColor;
  final bool isPositive;

  const _StatCard({
    required this.label,
    required this.value,
    this.trend,
    this.subtext,
    this.subtextColor,
    this.isPositive = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 8.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey[500],
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              if (trend != null)
                Text(
                  trend!,
                  style: GoogleFonts.inter(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color: isPositive ? Colors.green : Colors.red,
                  ),
                ),
              if (subtext != null)
                Text(
                  subtext!,
                  style: GoogleFonts.inter(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w500,
                    color: subtextColor ?? Colors.grey[500],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CampaignCard extends StatelessWidget {
  final double width;
  final String code;
  final String status;
  final String title;
  final String desc;
  final double? progress;
  final String? progressLabel;
  final String? progressLabelLeft;
  final String? limitLabel;
  final String dateLabel;
  final IconData dateIcon;
  final bool isExpired;
  final bool isScheduled;
  final bool isEndingSoon;

  const _CampaignCard({
    required this.width,
    required this.code,
    required this.status,
    required this.title,
    required this.desc,
    this.progress,
    this.progressLabel,
    this.progressLabelLeft,
    this.limitLabel,
    required this.dateLabel,
    required this.dateIcon,
    this.isExpired = false,
    this.isScheduled = false,
    this.isEndingSoon = false,
  });

  @override
  Widget build(BuildContext context) {
    Color statusBg;
    Color statusText;

    if (isExpired) {
      statusBg = Colors.grey[200]!;
      statusText = Colors.grey[600]!;
    } else if (isScheduled) {
      statusBg = Colors.blue[50]!;
      statusText = Colors.blue[700]!;
    } else if (isEndingSoon) {
      statusBg = Colors.orange[50]!;
      statusText = Colors.orange[800]!;
    } else {
      statusBg = const Color(0xFFE6F7ED);
      statusText = const Color(0xFF2E7D32);
    }

    return Container(
      width: width,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: isEndingSoon
            ? Border.all(color: Colors.orange[200]!, width: 2)
            : Border.all(color: Colors.grey[200]!),
        boxShadow: [
          if (isEndingSoon)
            BoxShadow(
              color: Colors.orange.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: isExpired ? Colors.grey[100] : const Color(0xFFF0FAFC),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: isExpired
                        ? Colors.grey[300]!
                        : const Color(0xFFCBEAF2),
                  ),
                ),
                child: Text(
                  code,
                  style: GoogleFonts.robotoMono(
                    fontWeight: FontWeight.bold,
                    fontSize: 10.sp,
                    color: isExpired
                        ? Colors.grey[500]
                        : const Color(0xFF258fb0),
                    letterSpacing: 1,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusBg,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  status,
                  style: GoogleFonts.inter(
                    fontSize: 7.sp,
                    fontWeight: FontWeight.bold,
                    color: statusText,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 2.h),

          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: isExpired ? Colors.grey[400] : Colors.black87,
              decoration: isExpired ? TextDecoration.lineThrough : null,
            ),
          ),
          SizedBox(height: 4),
          Text(
            desc,
            style: GoogleFonts.inter(fontSize: 9.sp, color: Colors.grey[500]),
          ),

          SizedBox(height: 2.5.h),

          // Progress or Limit
          if (limitLabel != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Limit',
                    style: TextStyle(
                      fontSize: 8.sp,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    limitLabel!,
                    style: TextStyle(
                      fontSize: 8.sp,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          else if (progress != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  progressLabelLeft ?? 'Usage Progress',
                  style: TextStyle(
                    fontSize: 8.sp,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  progressLabel!,
                  style: TextStyle(
                    fontSize: 8.sp,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(
                  isEndingSoon
                      ? Colors.orange
                      : (isExpired ? Colors.grey : const Color(0xFF258fb0)),
                ),
                minHeight: 6,
              ),
            ),
          ],

          SizedBox(height: 2.5.h),
          // Footer
          Row(
            children: [
              Icon(
                isEndingSoon ? LucideIcons.alertCircle : dateIcon,
                size: 14,
                color: isEndingSoon
                    ? Colors.red
                    : (isScheduled ? Colors.blue : Colors.grey[500]),
              ),
              SizedBox(width: 8),
              Text(
                dateLabel,
                style: GoogleFonts.inter(
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w500,
                  color: isEndingSoon
                      ? Colors.red
                      : (isScheduled ? Colors.blue : Colors.grey[600]),
                ),
              ),
              const Spacer(),
              if (isExpired)
                Icon(LucideIcons.rotateCcw, size: 16, color: Colors.grey[400])
              else ...[
                Icon(LucideIcons.pencil, size: 16, color: Colors.grey[400]),
                SizedBox(width: 12),
                Icon(LucideIcons.trash2, size: 16, color: Colors.grey[400]),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

// Needed for dotted border
class DottedBorder extends BoxBorder {
  final Color color;
  final double strokeWidth;
  final double gap;

  const DottedBorder({required this.color, this.strokeWidth = 2, this.gap = 6});

  @override
  BorderSide get bottom => BorderSide.none;
  @override
  BorderSide get top => BorderSide.none;
  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;
  @override
  bool get isUniform => true;
  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    TextDirection? textDirection,
    BoxShape shape = BoxShape.rectangle,
    BorderRadius? borderRadius,
  }) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path();
    if (borderRadius != null) {
      path.addRRect(
        RRect.fromRectAndCorners(
          rect,
          topLeft: borderRadius.topLeft,
          topRight: borderRadius.topRight,
          bottomLeft: borderRadius.bottomLeft,
          bottomRight: borderRadius.bottomRight,
        ),
      );
    } else {
      path.addRect(rect);
    }

    Path dashPath = Path();
    double dashWidth = strokeWidth * 2;
    double dashSpace = gap;
    double distance = 0;

    for (ui.PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }
    canvas.drawPath(dashPath, paint);
  }

  @override
  ShapeBorder scale(double t) => this;
}
