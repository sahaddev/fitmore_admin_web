import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sizer/sizer.dart';

enum DialogStatus { success, error }

void showCustomStatusDialog({
  required BuildContext context,
  required DialogStatus status,
  required String title,
  required String message,
  required String buttonText,
  VoidCallback? onButtonPressed,
}) {
  final isSuccess = status == DialogStatus.success;

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isSuccess ? Colors.green[50] : Colors.red[50],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isSuccess ? LucideIcons.checkCircle : LucideIcons.alertTriangle,
                  color: isSuccess ? Colors.green[600] : Colors.red[600],
                  size: 24.sp,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                message,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 10.sp,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                    if (onButtonPressed != null) {
                      onButtonPressed();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSuccess ? const Color(0xFF258fb0) : Colors.red[600],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    buttonText,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
