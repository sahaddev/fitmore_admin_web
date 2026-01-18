import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sizer/sizer.dart';

import '../view_model/product_view_model.dart';

import '../../../../core/constants/app_colors.dart';
import '../../dashboard/widgets/dashboard_sidebar.dart';
import '../../dashboard/widgets/dashboard_header.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  String _selectedFilter = 'All Products';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductViewModel>().fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    // We can use the view model later for real data
    // final productViewModel = context.watch<ProductViewModel>();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FC),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sidebar
          const DashboardSidebar(currentPath: '/products'),

          // Main Content
          Expanded(
            child: Column(
              children: [
                // Global Header
                const DashboardHeader(title: 'Products'),

                // Scrollable Page Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.w,
                      vertical: 2.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Page Header (Title + Export)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Product Inventory',
                                  style: GoogleFonts.inter(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: 0.5.h),
                                Text(
                                  'Monitoring 2,481 items across 12 categories',
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
                                    foregroundColor: Colors.grey[700],
                                    side: BorderSide(color: Colors.grey[300]!),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 2.w,
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
                        ),

                        SizedBox(height: 3.h),

                        // Filters & Search Bar
                        Row(
                          children: [
                            _FilterButton(
                              label: 'All Products',
                              isActive: _selectedFilter == 'All Products',
                              onTap: () => setState(
                                () => _selectedFilter = 'All Products',
                              ),
                            ),
                            SizedBox(width: 1.w),
                            _FilterDropdown(label: 'Electronics'),
                            SizedBox(width: 1.w),
                            _FilterDropdown(label: 'Furniture'),
                            SizedBox(width: 1.w),
                            _FilterChip(
                              label: 'Low Stock',
                              color: Colors.orange,
                            ),
                          ],
                        ),

                        SizedBox(height: 3.h),

                        // Products Table
                        Container(
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
                            children: [
                              // Table Header
                              Padding(
                                padding: EdgeInsets.all(1.5.w),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: _TableHeader('PRODUCT'),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: _TableHeader('CATEGORY'),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: _TableHeader('PRICE'),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: _TableHeader('STOCK STATUS'),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: _TableHeader(
                                        'ACTIONS',
                                        align: TextAlign.end,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(height: 1, color: Colors.grey[100]),
                              // Table Rows (Mock Data)
                              _ProductRow(
                                name: 'Studio Pro Wireless',
                                sku: 'HEAD-PRO-01',
                                category: 'Electronics',
                                price: 249.00,
                                stock: 82,
                                status: 'In Stock',
                                imageColor: Colors.black,
                              ),
                              _ProductRow(
                                name: 'Nordic Office Chair',
                                sku: 'FURN-CHR-99',
                                category: 'Furniture',
                                price: 320.50,
                                stock: 12,
                                status: 'Low Stock',
                                imageColor: Colors.brown[300]!,
                              ),
                              _ProductRow(
                                name: 'Minimalist Timepiece',
                                sku: 'ACC-WCH-04',
                                category: 'Accessories',
                                price: 159.00,
                                stock: 45,
                                status: 'In Stock',
                                imageColor: Colors.blueGrey,
                              ),
                              _ProductRow(
                                name: 'Eco Wooden Lamp',
                                sku: 'FURN-LMP-02',
                                category: 'Furniture',
                                price: 89.99,
                                stock: 3,
                                status: 'Critical',
                                imageColor: Colors.amber[800]!,
                              ),

                              // Custom Add Product Button Row within/below table or separate
                            ],
                          ),
                        ),
                        // Pagination (Mock)
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'SHOWING 1 TO 10 OF 2,481 PRODUCTS',
                                style: GoogleFonts.inter(
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[400],
                                  letterSpacing: 1,
                                ),
                              ),
                              Row(
                                children: [
                                  _PaginationButton(
                                    icon: LucideIcons.chevronLeft,
                                  ),
                                  _PaginationButton(text: '1', isActive: true),
                                  _PaginationButton(text: '2'),
                                  _PaginationButton(text: '3'),
                                  Text(
                                    ' ... ',
                                    style: TextStyle(color: Colors.grey[400]),
                                  ),
                                  _PaginationButton(text: '248'),
                                  _PaginationButton(
                                    icon: LucideIcons.chevronRight,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 2.h),

                        // Bottom Stats
                        Row(
                          children: [
                            Expanded(
                              child: _BottomStatCard(
                                title: 'TOP SELLING',
                                value: 'Wireless Headphones',
                                icon: LucideIcons.trendingUp,
                                iconColor: Colors.green,
                                isPrimary: false,
                              ),
                            ),
                            SizedBox(width: 2.w),
                            Expanded(
                              child: _BottomStatCard(
                                title: 'LOW STOCK ITEMS',
                                value: '42 Products',
                                icon: LucideIcons.alertTriangle,
                                iconColor: Colors.orange,
                                isPrimary: false,
                              ),
                            ),
                            SizedBox(width: 2.w),
                            Expanded(
                              child: _BottomStatCard(
                                title: 'TOTAL INVENTORY VALUE',
                                value: '\$1,248,390.00',
                                icon: LucideIcons.clipboardList,
                                iconColor: Colors.white,
                                isPrimary: true, // Blue card
                              ),
                            ),
                          ],
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/add-product'),
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add),
        label: const Text("Add Product"),
      ),
    );
  }
}

// --- Helper Widgets ---

class _FilterButton extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _FilterButton({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.h),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF258fb0) : Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isActive ? const Color(0xFF258fb0) : Colors.grey[300]!,
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
            color: isActive ? Colors.white : Colors.grey[700],
          ),
        ),
      ),
    );
  }
}

class _FilterDropdown extends StatelessWidget {
  final String label;

  const _FilterDropdown({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(width: 0.5.w),
          Icon(LucideIcons.chevronDown, size: 12.sp, color: Colors.grey[500]),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final Color color;

  const _FilterChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          SizedBox(width: 0.5.w),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
        ],
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
        fontSize: 9.sp,
        fontWeight: FontWeight.w600,
        color: Colors.grey[400],
        letterSpacing: 1,
      ),
    );
  }
}

class _ProductRow extends StatelessWidget {
  final String name;
  final String sku;
  final String category;
  final double price;
  final int stock;
  final String status;
  final Color imageColor;

  const _ProductRow({
    required this.name,
    required this.sku,
    required this.category,
    required this.price,
    required this.stock,
    required this.status,
    required this.imageColor,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor = status == 'In Stock'
        ? Colors.green
        : (status == 'Low Stock' ? Colors.orange : Colors.red);
    double stockPercent = status == 'In Stock'
        ? 0.8
        : (status == 'Low Stock' ? 0.2 : 0.05);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.5.h),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[100]!)),
      ),
      child: Row(
        children: [
          // Product Info
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: imageColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    image: null, // Placeholder
                  ),
                  child: Center(
                    child: Icon(LucideIcons.image, size: 20, color: imageColor),
                  ),
                ),
                SizedBox(width: 1.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 10.sp,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        'SKU: $sku',
                        style: GoogleFonts.inter(
                          fontSize: 9.sp,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Category
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    category,
                    style: GoogleFonts.inter(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue[700],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Price
          Expanded(
            flex: 2,
            child: Text(
              '\$${price.toStringAsFixed(2)}',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 10.sp,
                color: Colors.black87,
              ),
            ),
          ),
          // Stock Status
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      status,
                      style: GoogleFonts.inter(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w600,
                        color: statusColor,
                      ),
                    ),
                    Text(
                      '$stock',
                      style: GoogleFonts.inter(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: LinearProgressIndicator(
                    value: stockPercent,
                    minHeight: 4,
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation<Color>(statusColor),
                  ),
                ),
              ],
            ),
          ),
          // Actions
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    LucideIcons.edit,
                    size: 14.sp,
                    color: const Color(0xFF258fb0),
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    LucideIcons.trash2,
                    size: 14.sp,
                    color: Colors.grey[400],
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PaginationButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final bool isActive;

  const _PaginationButton({this.text, this.icon, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF258fb0) : Colors.white,
        borderRadius: BorderRadius.circular(6),
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
            : Icon(icon, size: 14.sp, color: Colors.grey[700]),
      ),
    );
  }
}

class _BottomStatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconColor;
  final bool isPrimary;

  const _BottomStatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.iconColor,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.5.w),
      decoration: BoxDecoration(
        color: isPrimary ? const Color(0xFF258fb0) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          if (!isPrimary)
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isPrimary
                  ? Colors.white.withOpacity(0.2)
                  : Colors.grey[50],
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20.sp),
          ),
          SizedBox(width: 1.5.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 8.sp,
                  fontWeight: FontWeight.bold,
                  color: isPrimary
                      ? Colors.white.withOpacity(0.8)
                      : Colors.grey[500],
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: 4),
              Text(
                value,
                style: GoogleFonts.inter(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  color: isPrimary ? Colors.white : Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
