import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:fitmore_web/features/coupons/domain/entities/coupon.dart';
import 'package:fitmore_web/features/coupons/presentation/pages/update_coupon_dialog.dart';
import 'package:fitmore_web/features/coupons/presentation/blocs/couponList/coupon_add_and_l_ist_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

import '../../../dashboard/presentation/widgets/dashboard_header.dart';

class CouponListPage extends StatefulWidget {
  const CouponListPage({super.key});

  @override
  State<CouponListPage> createState() => _CouponListPageState();
}

class _CouponListPageState extends State<CouponListPage> {
  String _discountType = 'Percentage';
  final _codeController = TextEditingController(text: 'WINTER2024');
  final _valueController = TextEditingController(text: '15');

  List<CouponEntity> _coupons = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    context.read<CouponAddAndLIstBloc>().add(const CouponAddAndLIstEvent.fetchCoupons());
  }

  @override
  void dispose() {
    _codeController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  void _showUpdateDialog(CouponEntity coupon) {
    showDialog(
      context: context,
      builder: (context) => UpdateCouponDialog(
        coupon: coupon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CouponAddAndLIstBloc, CouponAddAndLIstState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () {
            setState(() => _isLoading = true);
          },
          loaded: (coupons) {
            setState(() {
              _isLoading = false;
              _coupons = coupons;
            });
          },
          success: () {
            setState(() => _isLoading = false);
            _codeController.clear();
            _valueController.clear();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Campaign generated successfully!'),
                backgroundColor: Colors.green,
              ),
            );
            context.read<CouponAddAndLIstBloc>().add(const CouponAddAndLIstEvent.fetchCoupons());
          },
          failure: (message) {
            setState(() => _isLoading = false);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error: $message'),
                backgroundColor: Colors.red,
              ),
            );
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FC),
        body: Column(
          children: [
            const DashboardHeader(title: 'Coupons & Marketing'),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
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
                            color: Colors.black.withValues(alpha: 0.02),
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
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          color: Colors.grey[300]!,
                                        ),
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(
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
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () => setState(
                                              () => _discountType = 'Percentage',
                                            ),
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color:
                                                    _discountType == 'Percentage'
                                                    ? const Color(0xFFEAF6F9)
                                                    : Colors.transparent,
                                                borderRadius:
                                                    const BorderRadius.horizontal(
                                                      left: Radius.circular(7),
                                                    ),
                                              ),
                                              child: Text(
                                                'Percentage',
                                                style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  color:
                                                      _discountType ==
                                                          'Percentage'
                                                      ? const Color(0xFF258fb0)
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
                                              () =>
                                                  _discountType = 'Fixed Amount',
                                            ),
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color:
                                                    _discountType ==
                                                        'Fixed Amount'
                                                    ? const Color(0xFFEAF6F9)
                                                    : Colors.transparent,
                                                borderRadius:
                                                    const BorderRadius.horizontal(
                                                      right: Radius.circular(7),
                                                    ),
                                              ),
                                              child: Text(
                                                'Fixed Amount',
                                                style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  color:
                                                      _discountType ==
                                                          'Fixed Amount'
                                                      ? const Color(0xFF258fb0)
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
                                      suffixText: _discountType == 'Percentage'
                                          ? '%'
                                          : '\$',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          color: Colors.grey[300]!,
                                        ),
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(
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
                                    onPressed: _isLoading
                                        ? null
                                        : () {
                                            final code = _codeController.text.trim();
                                            final valueStr = _valueController.text.trim();
                                            if (code.isEmpty || valueStr.isEmpty) {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                const SnackBar(
                                                  content: Text('Please fill in both Coupon Code and Discount Value.'),
                                                  backgroundColor: Colors.orange,
                                                ),
                                              );
                                              return;
                                            }
                                            final value = int.tryParse(valueStr);
                                            if (value == null || value <= 0) {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                const SnackBar(
                                                  content: Text('Discount Value must be a valid positive number.'),
                                                  backgroundColor: Colors.orange,
                                                ),
                                              );
                                              return;
                                            }

                                            final isPercent = _discountType == 'Percentage';
                                            final title = isPercent ? '$value% Discount' : '\$$value Off';
                                            final newCoupon = CouponEntity(
                                              title: title,
                                              code: code.toUpperCase(),
                                              percentage: isPercent ? value : null,
                                              fixedAmount: isPercent ? null : value,
                                              description: isPercent ? '$value% off promo campaign' : '\$$value off promo campaign',
                                              expiry: DateTime.now().add(const Duration(days: 30)),
                                              limit: 1000,
                                              status: 'active',
                                            );

                                            context.read<CouponAddAndLIstBloc>().add(
                                              CouponAddAndLIstEvent.addCoupon(coupon: newCoupon),
                                            );
                                          },
                                    icon: _isLoading
                                        ? const SizedBox(
                                            width: 18,
                                            height: 18,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                            ),
                                          )
                                        : const Icon(LucideIcons.zap, size: 18),
                                    label: Text(_isLoading ? 'Generating...' : 'Generate Campaign'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF258fb0),
                                      foregroundColor: Colors.white,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
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
                            value: _coupons.length.toString(),
                            subtext: 'Across all categories',
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
                            if (_isLoading && _coupons.isEmpty)
                              Container(
                                width: constraints.maxWidth,
                                height: 200,
                                alignment: Alignment.center,
                                child: const CircularProgressIndicator(),
                              )
                            else if (_coupons.isEmpty)
                              Container(
                                width: constraints.maxWidth,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.grey[200]!),
                                ),
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      LucideIcons.ticket,
                                      size: 32.sp,
                                      color: Colors.grey[300],
                                    ),
                                    SizedBox(height: 1.h),
                                    Text(
                                      'No Active Campaigns Found',
                                      style: GoogleFonts.inter(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    SizedBox(height: 0.5.h),
                                    Text(
                                      'Create a new coupon above to get started.',
                                      style: GoogleFonts.inter(
                                        fontSize: 9.sp,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            else
                              ..._coupons.map((coupon) {
                                final isExpired = coupon.expiry != null && coupon.expiry!.isBefore(DateTime.now());
                                final isScheduled = coupon.status.toLowerCase() == 'scheduled';
                                final isEndingSoon = coupon.expiry != null &&
                                    coupon.expiry!.difference(DateTime.now()).inHours < 24 &&
                                    !isExpired;

                                // progress math
                                double? progress;
                                String? progressLabel;
                                if (coupon.limit > 0) {
                                  progress = coupon.couponCount / coupon.limit;
                                  progress = progress.clamp(0.0, 1.0);
                                  progressLabel = '${coupon.couponCount} / ${coupon.limit}';
                                }

                                // date label & icon
                                String dateLabel = 'Never Expires';
                                IconData dateIcon = LucideIcons.calendarCheck;
                                if (coupon.expiry != null) {
                                  dateLabel = isExpired
                                      ? 'Ended ${DateFormat('MMM dd, yyyy').format(coupon.expiry!)}'
                                      : 'Ends ${DateFormat('MMM dd, yyyy').format(coupon.expiry!)}';
                                  dateIcon = isExpired ? LucideIcons.history : LucideIcons.calendarDays;
                                }

                                return _CampaignCard(
                                  width: (constraints.maxWidth - 3.w) / 3,
                                  code: coupon.code,
                                  status: coupon.status.toUpperCase(),
                                  title: coupon.title,
                                  desc: coupon.description ?? 'Promotional campaign',
                                  progress: progress,
                                  progressLabel: progressLabel,
                                  limitLabel: coupon.limit == 0 ? 'Unlimited Usage' : null,
                                  dateLabel: dateLabel,
                                  dateIcon: dateIcon,
                                  isExpired: isExpired,
                                  isScheduled: isScheduled,
                                  isEndingSoon: isEndingSoon,
                                  onEdit: () => _showUpdateDialog(coupon),
                                  onDelete: () {
                                    // Add delete action if needed
                                  },
                                );
                              }),
                            // Quick Campaign Card
                            InkWell(
                              onTap: () {
                                final randomNum = DateTime.now().millisecond;
                                _codeController.text = 'FITMORE$randomNum';
                                _valueController.text = '10';
                                setState(() {
                                  _discountType = 'Percentage';
                                });
                              },
                              borderRadius: BorderRadius.circular(12),
                              child: DottedBorder(
                                color: Colors.grey[300]!,
                                radius: 12,
                                child: Container(
                                  width: (constraints.maxWidth - 3.w) / 3,
                                  height: 240, // Approx height matching others
                                  decoration: BoxDecoration(
                                    color: Colors.grey[50],
                                    borderRadius: BorderRadius.circular(12),
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
            ],
          ),
          if (subtext != null) ...[
            SizedBox(height: 0.5.h),
            Text(
              subtext!,
              style: GoogleFonts.inter(
                fontSize: 9.sp,
                fontWeight: FontWeight.w500,
                color: subtextColor ?? Colors.grey[500],
              ),
            ),
          ],
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

  final String? limitLabel;
  final String dateLabel;
  final IconData dateIcon;
  final bool isExpired;
  final bool isScheduled;
  final bool isEndingSoon;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const _CampaignCard({
    required this.width,
    required this.code,
    required this.status,
    required this.title,
    required this.desc,
    this.progress,
    this.progressLabel,

    this.limitLabel,
    required this.dateLabel,
    required this.dateIcon,
    this.isExpired = false,
    this.isScheduled = false,
    this.isEndingSoon = false,
    this.onEdit,
    this.onDelete,
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
              color: Colors.orange.withValues(alpha: 0.05),
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
                  'Usage Progress',
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
                IconButton(
                  onPressed: onEdit,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: Icon(LucideIcons.pencil, size: 16, color: Colors.grey[400]),
                ),
                SizedBox(width: 12),
                IconButton(
                  onPressed: onDelete,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: Icon(LucideIcons.trash2, size: 16, color: Colors.grey[400]),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class DottedBorder extends StatelessWidget {
  final Widget child;
  final Color color;
  final double strokeWidth;
  final double gap;
  final double radius;

  const DottedBorder({
    required this.child,
    required this.color,
    this.strokeWidth = 2,
    this.gap = 5,
    this.radius = 12,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DottedPainter(
        color: color,
        strokeWidth: strokeWidth,
        gap: gap,
        radius: radius,
      ),
      child: child,
    );
  }
}

class _DottedPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;
  final double radius;

  _DottedPainter({
    required this.color,
    required this.strokeWidth,
    required this.gap,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    const dashWidth = 5.0;
    final dashSpace = gap;

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(radius),
        ),
      );

    for (final metric in path.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        canvas.drawPath(
          metric.extractPath(distance, distance + dashWidth),
          paint,
        );
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
