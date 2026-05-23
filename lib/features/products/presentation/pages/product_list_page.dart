import 'package:fitmore_web/core/routes/app_routers.dart';
import 'package:fitmore_web/core/routes/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/product.dart';
import '../blocs/productList/product_list_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../dashboard/presentation/widgets/dashboard_header.dart';

class Product {
  final String id;
  final String name;
  final String sku;
  final String category;
  final double price;
  final int stock;
  final String status;
  final Color imageColor;

  Product({
    required this.id,
    required this.name,
    required this.sku,
    required this.category,
    required this.price,
    required this.stock,
    required this.status,
    required this.imageColor,
  });
}

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
    context.read<ProductListBloc>().add(const ProductListEvent.fetchProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FC),
      body: Column(
        children: [
          // Global Header
          const DashboardHeader(title: 'Products'),

          // Scrollable Page Content
          Expanded(
            child: BlocBuilder<ProductListBloc, ProductListState>(
              builder: (context, state) {
                return state.when(
                  initial: () =>
                      const Center(child: CircularProgressIndicator()),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  failure: (message) => Center(
                    child: Text(
                      'Failed to load products: $message',
                      style: GoogleFonts.inter(color: Colors.red),
                    ),
                  ),
                  loaded: (products) {
                    // Compute metrics dynamically from the live list of products
                    final totalValue = products.fold<double>(
                      0.0,
                      (prev, p) => prev + (p.price * p.quantity),
                    );
                    final lowStockCount = products
                        .where((p) => p.quantity <= 10)
                        .length;
                    final topSelling = products.isNotEmpty
                        ? products.first.title
                        : 'N/A';

                    return SingleChildScrollView(
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
                                    'Monitoring ${products.length} items across 12 categories',
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
                                    icon: Icon(
                                      LucideIcons.download,
                                      size: 14.sp,
                                    ),
                                    label: const Text('Export CSV'),
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: Colors.grey[700],
                                      side: BorderSide(
                                        color: Colors.grey[300]!,
                                      ),
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
                                  color: Colors.black.withValues(alpha: 0.02),
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
                                // Table Rows (Dynamic from server)
                                if (products.isEmpty)
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 5.h,
                                    ),
                                    child: const Center(
                                      child: Text('No products found.'),
                                    ),
                                  )
                                else
                                  ...products.map(
                                    (product) => _ProductRow(
                                      id: product.id?.toString() ?? '',
                                      name: product.title,
                                      sku: 'PRO-${product.id ?? 'N/A'}',
                                      category: product.category,
                                      price: product.price.toDouble(),
                                      stock: product.quantity,
                                      status: product.active
                                          ? (product.quantity > 10
                                                ? 'In Stock'
                                                : 'Low Stock')
                                          : 'Out of Stock',
                                      imageColor: Colors.blueGrey,
                                    ),
                                  ),
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
                                  'SHOWING ${products.length} OF ${products.length} PRODUCTS',
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
                                    _PaginationButton(
                                      text: '1',
                                      isActive: true,
                                    ),
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
                                  value: topSelling,
                                  icon: LucideIcons.trendingUp,
                                  iconColor: Colors.green,
                                  isPrimary: false,
                                ),
                              ),
                              SizedBox(width: 2.w),
                              Expanded(
                                child: _BottomStatCard(
                                  title: 'LOW STOCK ITEMS',
                                  value: '$lowStockCount Products',
                                  icon: LucideIcons.alertTriangle,
                                  iconColor: Colors.orange,
                                  isPrimary: false,
                                ),
                              ),
                              SizedBox(width: 2.w),
                              Expanded(
                                child: _BottomStatCard(
                                  title: 'TOTAL INVENTORY VALUE',
                                  value:
                                      '\$${NumberFormat('#,##0.00').format(totalValue)}',
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
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await NavigationService.pushNamed(
            AppRouters.addProduct,
          );
          if (result == true) {
            if (context.mounted) {
              context.read<ProductListBloc>().add(
                const ProductListEvent.fetchProducts(),
              );
            }
          }
        },
        backgroundColor: AppColors.textSecondary,
        foregroundColor: AppColors.background,
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
  final String id;
  final String name;
  final String sku;
  final String category;
  final double price;
  final int stock;
  final String status;
  final Color imageColor;

  const _ProductRow({
    required this.id,
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

    return InkWell(
      onTap: () {
        final dummyEntity = ProductEntity(
          id: int.tryParse(id) ?? 0,
          title: name,
          subTitle: 'Premium $category item',
          description:
              'This is a high-quality $name from our $category collection.',
          imageOne: '',
          imageTwo: '',
          imageThree: '',
          imageFour: '',
          price: price.toInt(),
          category: category,
          quantity: stock,
          active: status == 'In Stock',
        );
        NavigationService.pushNamed(
          AppRouters.productDetails,
          arguments: dummyEntity,
        );
      },
      child: Container(
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
                      color: imageColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                      image: null, // Placeholder
                    ),
                    child: Center(
                      child: Icon(
                        LucideIcons.image,
                        size: 20,
                        color: imageColor,
                      ),
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
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: Icon(
                      LucideIcons.edit,
                      size: 12.sp,
                      color: const Color(0xFF258fb0),
                    ),
                    onPressed: () {
                      final dummyEntity = ProductEntity(
                        id: int.tryParse(id) ?? 0,
                        title: name,
                        subTitle: 'Premium $category item',
                        description:
                            'This is a high-quality $name from our $category collection.',
                        imageOne: '',
                        imageTwo: '',
                        imageThree: '',
                        imageFour: '',
                        price: price.toInt(),
                        category: category,
                        quantity: stock,
                        active: status == 'In Stock',
                      );
                      NavigationService.pushNamed(
                        AppRouters.updateProduct,
                        arguments: dummyEntity,
                      );
                    },
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: Icon(
                      LucideIcons.trash2,
                      size: 12.sp,
                      color: Colors.grey[400],
                    ),
                    onPressed: () => _showDeleteDialog(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    final parsedId = int.tryParse(id) ?? 0;
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.red[50],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        LucideIcons.alertTriangle,
                        color: Colors.red[600],
                        size: 20.sp,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Delete Product',
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Are you sure you want to delete "$name"? This action cannot be undone and will permanently remove this product from the database.',
                  style: GoogleFonts.inter(
                    fontSize: 10.sp,
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: () => Navigator.of(dialogContext).pop(),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.grey[300]!),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.inter(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(dialogContext).pop();
                        context.read<ProductListBloc>().add(
                          ProductListEvent.deleteProduct(parsedId),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[600],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Delete',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
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
              color: Colors.black.withValues(alpha: 0.02),
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
                  ? Colors.white.withValues(alpha: 0.2)
                  : Colors.grey[50],
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20.sp),
          ),
          SizedBox(width: 1.5.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                    fontSize: 8.sp,
                    fontWeight: FontWeight.bold,
                    color: isPrimary
                        ? Colors.white.withValues(alpha: 0.8)
                        : Colors.grey[500],
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  value,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: isPrimary ? Colors.white : Colors.black87,
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
