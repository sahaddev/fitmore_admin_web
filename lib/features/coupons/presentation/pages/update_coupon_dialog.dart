import 'package:fitmore_web/features/coupons/domain/entities/coupon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class UpdateCouponDialog extends StatefulWidget {
  final CouponEntity coupon;

  const UpdateCouponDialog({super.key, required this.coupon});

  @override
  State<UpdateCouponDialog> createState() => _UpdateCouponDialogState();
}

class _UpdateCouponDialogState extends State<UpdateCouponDialog> {
  late final TextEditingController _titleController;
  late final TextEditingController _codeController;
  late final TextEditingController _descController;
  late final TextEditingController _limitController;
  late final TextEditingController _valueController;

  late String _discountType;
  DateTime? _selectedExpiry;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.coupon.title);
    _codeController = TextEditingController(text: widget.coupon.code);
    _descController = TextEditingController(
      text: widget.coupon.description ?? '',
    );
    _limitController = TextEditingController(
      text: widget.coupon.limit.toString(),
    );

    _discountType = widget.coupon.percentage != null
        ? 'Percentage'
        : 'Fixed Amount';
    _valueController = TextEditingController(
      text: (widget.coupon.percentage ?? widget.coupon.fixedAmount ?? 0)
          .toString(),
    );
    _selectedExpiry = widget.coupon.expiry;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _codeController.dispose();
    _descController.dispose();
    _limitController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedExpiry ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() => _selectedExpiry = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 40.w,
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAF6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    LucideIcons.ticket,
                    color: Color(0xFF258fb0),
                    size: 20,
                  ),
                ),
                SizedBox(width: 1.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Update Coupon',
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'Modify campaign details and limits',
                      style: GoogleFonts.inter(
                        fontSize: 9.sp,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(LucideIcons.x, size: 20),
                  color: Colors.grey[400],
                ),
              ],
            ),
            const Divider(height: 48),

            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildInput(
                    label: 'Coupon Title',
                    hint: 'e.g. Summer Clearance',
                    controller: _titleController,
                  ),
                ),
                SizedBox(width: 1.w),
                Expanded(
                  flex: 1,
                  child: _buildInput(
                    label: 'Coupon Code',
                    hint: 'SUMMER25',
                    controller: _codeController,
                    isMonospace: true,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),

            _buildInput(
              label: 'Description',
              hint: 'Briefly describe the campaign target...',
              controller: _descController,
              maxLines: 2,
            ),
            SizedBox(height: 2.h),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Discount Type',
                        style: GoogleFonts.inter(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 1.h),
                      _buildDiscountToggle(),
                    ],
                  ),
                ),
                SizedBox(width: 1.w),
                Expanded(
                  child: _buildInput(
                    label: 'Discount Value',
                    hint: '0',
                    controller: _valueController,
                    keyboardType: TextInputType.number,
                    suffix: _discountType == 'Percentage' ? '%' : '\$',
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),

            Row(
              children: [
                Expanded(
                  child: _buildInput(
                    label: 'Usage Limit',
                    hint: '0 for unlimited',
                    controller: _limitController,
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 1.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Expiry Date',
                        style: GoogleFonts.inter(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 1.h),
                      InkWell(
                        onTap: _pickDate,
                        child: Container(
                          height: 48,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Text(
                                _selectedExpiry == null
                                    ? 'No Expiry'
                                    : DateFormat(
                                        'MMM dd, yyyy',
                                      ).format(_selectedExpiry!),
                                style: GoogleFonts.inter(fontSize: 10.sp),
                              ),
                              const Spacer(),
                              Icon(
                                LucideIcons.calendar,
                                size: 16,
                                color: Colors.grey[400],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.inter(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(width: 1.w),
                ElevatedButton(
                  onPressed: () {
                    // Update logic here
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF258fb0),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Save Changes',
                    style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInput({
    required String label,
    required String hint,
    required TextEditingController controller,
    bool isMonospace = false,
    int maxLines = 1,
    TextInputType? keyboardType,
    String? suffix,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(fontSize: 9.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 1.h),
        TextField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          style: isMonospace
              ? GoogleFonts.robotoMono(
                  fontWeight: FontWeight.bold,
                  fontSize: 10.sp,
                )
              : GoogleFonts.inter(fontSize: 10.sp),
          decoration: InputDecoration(
            hintText: hint,
            suffixText: suffix,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDiscountToggle() {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          _toggleButton('Percentage', _discountType == 'Percentage', true),
          Container(width: 1, color: Colors.grey[300]),
          _toggleButton('Fixed Amount', _discountType == 'Fixed Amount', false),
        ],
      ),
    );
  }

  Widget _toggleButton(String label, bool active, bool left) {
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => _discountType = label),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: active ? const Color(0xFFEAF6F9) : Colors.transparent,
            borderRadius: BorderRadius.horizontal(
              left: left ? const Radius.circular(7) : Radius.zero,
              right: !left ? const Radius.circular(7) : Radius.zero,
            ),
          ),
          child: Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 9.sp,
              fontWeight: FontWeight.w600,
              color: active ? const Color(0xFF258fb0) : Colors.grey[600],
            ),
          ),
        ),
      ),
    );
  }
}
