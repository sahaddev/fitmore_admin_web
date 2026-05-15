import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/product.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../dashboard/presentation/widgets/dashboard_header.dart';
import '../../../../core/routes/app_routers.dart';
import '../../../../core/routes/navigation_service.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductEntity product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FC),
      body: Column(
        children: [
          const DashboardHeader(title: 'Product Details'),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(2.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTopActionBar(context),
                  SizedBox(height: 3.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left Column: Product Info & Images
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            _buildMainInfoCard(),
                            SizedBox(height: 2.h),
                            _buildDescriptionCard(),
                          ],
                        ),
                      ),
                      SizedBox(width: 2.w),
                      // Right Column: Summary & Actions
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            _buildInventoryStatusCard(),
                            SizedBox(height: 2.h),
                            _buildCategoryCollectionCard(),
                            SizedBox(height: 2.h),
                            _buildQuickStatsCard(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopActionBar(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(LucideIcons.arrowLeft),
          color: Colors.grey[600],
        ),
        SizedBox(width: 0.5.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.title,
              style: GoogleFonts.inter(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Text(
              'SKU: LD-2024-OAK-SM | ID: ${product.id ?? product.mongoId}',
              style: GoogleFonts.inter(
                fontSize: 10.sp,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
        const Spacer(),
        OutlinedButton.icon(
          onPressed: () {},
          icon: Icon(LucideIcons.trash2, size: 14.sp),
          label: const Text('Delete'),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.red[600],
            side: BorderSide(color: Colors.red[100]!),
            padding: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.5.h),
          ),
        ),
        SizedBox(width: 1.w),
        ElevatedButton.icon(
          onPressed: () {
            NavigationService.pushNamed(
              AppRouters.updateProduct,
              arguments: product,
            );
          },
          icon: Icon(LucideIcons.edit, size: 14.sp),
          label: const Text('Edit Product'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF258fb0),
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.5.h),
          ),
        ),
      ],
    );
  }

  Widget _buildMainInfoCard() {
    return _DetailsCard(
      title: 'General Information',
      icon: LucideIcons.info,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Images Placeholder
          Expanded(
            flex: 1,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Icon(
                        LucideIcons.image,
                        size: 40.sp,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 1.h),
                Row(
                  children: List.generate(
                    3,
                    (index) => Expanded(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          margin: EdgeInsets.only(right: index == 2 ? 0 : 8),
                          decoration: BoxDecoration(
                            color: Colors.grey[50],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey[200]!),
                          ),
                          child: Icon(
                            LucideIcons.image,
                            size: 15.sp,
                            color: Colors.grey[200],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 2.w),
          // Product Pricing & Brief
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow('Product Name', product.title),
                _buildInfoRow('Sub Title', product.subTitle),
                Divider(height: 4.h, color: Colors.grey[100]),
                Row(
                  children: [
                    Expanded(
                      child: _buildInfoRow(
                        'Regular Price',
                        '\$${product.price.toStringAsFixed(2)}',
                        isHighlight: true,
                      ),
                    ),
                    Expanded(
                      child: _buildInfoRow(
                        'Sale Price',
                        '--', // Placeholder
                        isHighlight: false,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                _buildInfoRow('Category', product.category),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionCard() {
    return _DetailsCard(
      title: 'Description',
      icon: LucideIcons.alignLeft,
      child: Text(
        product.description,
        style: GoogleFonts.inter(
          fontSize: 10.sp,
          color: Colors.grey[700],
          height: 1.6,
        ),
      ),
    );
  }

  Widget _buildInventoryStatusCard() {
    Color statusColor = product.quantity > 50
        ? Colors.green
        : (product.quantity > 10 ? Colors.orange : Colors.red);
    String statusText = product.quantity > 50
        ? 'In Stock'
        : (product.quantity > 10 ? 'Low Stock' : 'Critical');

    return _DetailsCard(
      title: 'Inventory Status',
      icon: LucideIcons.package,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Available Stock',
                style: GoogleFonts.inter(
                  fontSize: 10.sp,
                  color: Colors.grey[600],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  statusText,
                  style: GoogleFonts.inter(
                    fontSize: 8.sp,
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Text(
            '${product.quantity}',
            style: GoogleFonts.inter(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 2.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: (product.quantity / 200).clamp(0, 1),
              minHeight: 8,
              backgroundColor: Colors.grey[100],
              valueColor: AlwaysStoppedAnimation<Color>(statusColor),
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            'Stock level is ${(product.quantity / 200 * 100).toInt()}% of capacity',
            style: GoogleFonts.inter(fontSize: 8.sp, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCollectionCard() {
    return _DetailsCard(
      title: 'Organization',
      icon: LucideIcons.layers,
      child: Column(
        children: [
          _buildInfoRow('Category', product.category),
          SizedBox(height: 1.h),
          _buildInfoRow('Collection', 'Winter 2024'), // Placeholder
          SizedBox(height: 1.h),
          _buildInfoRow('Status', product.active ? 'Published' : 'Draft'),
        ],
      ),
    );
  }

  Widget _buildQuickStatsCard() {
    return _DetailsCard(
      title: 'Performance',
      icon: LucideIcons.barChart,
      child: Column(
        children: [
          _buildStatRow('Total Sales', '124 Units'),
          _buildStatRow('Revenue', '\$12,450.00'),
          _buildStatRow('Views', '1.2k (Last 30 days)'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isHighlight = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(fontSize: 9.sp, color: Colors.grey[500]),
        ),
        SizedBox(height: 0.5.h),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: isHighlight ? 14.sp : 10.sp,
            fontWeight: isHighlight ? FontWeight.bold : FontWeight.w600,
            color: isHighlight ? const Color(0xFF258fb0) : Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(fontSize: 9.sp, color: Colors.grey[600]),
          ),
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 9.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailsCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;

  const _DetailsCard({
    required this.title,
    required this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16.sp, color: const Color(0xFF258fb0)),
              SizedBox(width: 0.8.w),
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          Divider(height: 3.h, color: Colors.grey[50]),
          child,
        ],
      ),
    );
  }
}
