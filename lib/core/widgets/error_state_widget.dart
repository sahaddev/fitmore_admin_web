import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ErrorStateWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRefresh;

  const ErrorStateWidget({
    super.key,
    required this.message,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: GoogleFonts.inter(color: Colors.black),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                const Color(0xFF258fb0),
              ),
              foregroundColor: WidgetStateProperty.all(
                Colors.white,
              ),
              padding: WidgetStateProperty.all(
                EdgeInsets.symmetric(
                  horizontal: 2.w,
                  vertical: 1.h,
                ),
              ),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            onPressed: onRefresh,
            icon: const Icon(Icons.refresh),
            label: const Text('Refresh'),
          ),
        ],
      ),
    );
  }
}
