import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sizer/sizer.dart';

class RecentOrdersTable extends StatelessWidget {
  RecentOrdersTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
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
              Text(
                'Recent Orders',
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'View All Orders',
                  style: GoogleFonts.inter(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF258fb0),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 1.h),
          // Table Header
          Container(
            padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 1.w),
            color: Colors.grey[50],
            child: Row(
              children: [
                Expanded(flex: 2, child: _HeaderCell('ORDER ID')),
                Expanded(flex: 3, child: _HeaderCell('CUSTOMER')),
                Expanded(flex: 2, child: _HeaderCell('AMOUNT')),
                Expanded(flex: 2, child: _HeaderCell('STATUS')),
                Expanded(
                  flex: 1,
                  child: _HeaderCell('ACTION', align: TextAlign.end),
                ),
              ],
            ),
          ),
          // Table Rows
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _orders.length,
            separatorBuilder: (context, index) =>
                Divider(height: 1, color: Colors.grey[100]),
            itemBuilder: (context, index) {
              final order = _orders[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 1.w),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        order['id'],
                        style: GoogleFonts.inter(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF258fb0),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: order['avatarColor'],
                            child: Text(
                              order['customer'][0],
                              style: GoogleFonts.inter(
                                fontSize: 8.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              order['customer'],
                              style: GoogleFonts.inter(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        order['amount'],
                        style: GoogleFonts.inter(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: order['statusColor'].withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            order['status'],
                            style: GoogleFonts.inter(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w600,
                              color: order['statusColor'],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          LucideIcons.moreHorizontal,
                          color: Colors.grey,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _HeaderCell(String text, {TextAlign align = TextAlign.start}) {
    return Text(
      text,
      textAlign: align,
      style: GoogleFonts.inter(
        fontSize: 9.sp,
        fontWeight: FontWeight.w600,
        color: Colors.grey[500],
        letterSpacing: 0.5,
      ),
    );
  }

  final List<Map<String, dynamic>> _orders = [
    {
      'id': '#ORD-9402',
      'customer': 'Jane Doe',
      'amount': '\$124.50',
      'status': 'Shipped',
      'statusColor': Colors.green,
      'avatarColor': Colors.blue[200],
    },
    {
      'id': '#ORD-9403',
      'customer': 'Robert Smith',
      'amount': '\$42.00',
      'status': 'Processing',
      'statusColor': Colors.orange,
      'avatarColor': Colors.purple[200],
    },
    {
      'id': '#ORD-9404',
      'customer': 'Maria Lopez',
      'amount': '\$215.99',
      'status': 'Paid',
      'statusColor': Colors
          .green, // Light green in image looks like "Paid" is generally positive
      'avatarColor': Colors.orange[200],
    },
    {
      'id': '#ORD-9405',
      'customer': 'Tom Cook',
      'amount': '\$89.00',
      'status': 'Cancelled',
      'statusColor': Colors.grey,
      'avatarColor': Colors.red[200],
    },
  ];
}
