import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sizer/sizer.dart';

import '../view_model/product_view_model.dart';
import '../../dashboard/widgets/dashboard_sidebar.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _priceController = TextEditingController();
  final _salePriceController = TextEditingController();
  final _skuController = TextEditingController();
  final _tagsController = TextEditingController();

  // State
  String _selectedCategory = 'Lighting & Decor';
  String _selectedCollection = 'Winter 2024';
  int _stockCount = 1;
  bool _trackStock = true;
  bool _isPublished = true;
  final List<String> _tags = ['modern', 'oak'];

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _priceController.dispose();
    _salePriceController.dispose();
    _skuController.dispose();
    _tagsController.dispose();
    super.dispose();
  }

  void _onSave() async {
    // TODO: Implement actual save logic with viewModel
    // For now, just validation
    if (_formKey.currentState!.validate()) {
      context.read<ProductViewModel>().addProduct(
        _nameController.text,
        _descController.text,
        double.tryParse(_priceController.text) ?? 0.0,
      );
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FC),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sidebar
          const DashboardSidebar(currentPath: '/products'),

          // Main Content Area
          Expanded(
            child: Column(
              children: [
                // Top Action Bar
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Products',
                                style: GoogleFonts.inter(
                                  color: Colors.grey[500],
                                  fontSize: 9.sp,
                                ),
                              ),
                              Icon(
                                Icons.chevron_right,
                                size: 12.sp,
                                color: Colors.grey[400],
                              ),
                              Text(
                                'Add New Product',
                                style: GoogleFonts.inter(
                                  color: Colors.black87,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 0.5.h),
                          Text(
                            'New Store Listing',
                            style: GoogleFonts.inter(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () => context.pop(),
                        child: Text(
                          'Discard Draft',
                          style: GoogleFonts.inter(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w600,
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                      SizedBox(width: 1.w),
                      ElevatedButton.icon(
                        onPressed: _onSave,
                        icon: Icon(LucideIcons.save, size: 14.sp),
                        label: Text(
                          'Save Product',
                          style: GoogleFonts.inter(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF258fb0),
                          foregroundColor: Colors.white,
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
                ),
                Divider(height: 1, color: Colors.grey[200]),

                // Scrollable Form Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(2.w),
                    child: Form(
                      key: _formKey,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Left Column (Main Form)
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                _buildBasicInfoCard(),
                                SizedBox(height: 2.h),
                                _buildPricingInventoryCard(),
                              ],
                            ),
                          ),
                          SizedBox(width: 2.w),
                          // Right Column (Media & Settings)
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                _buildProductMediaCard(),
                                SizedBox(height: 2.h),
                                _buildTagsSEOCard(),
                              ],
                            ),
                          ),
                        ],
                      ),
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

  Widget _buildBasicInfoCard() {
    return _SectionCard(
      title: 'Basic Information',
      icon: LucideIcons.info,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Label('Product Name'),
          _TextInput(
            controller: _nameController,
            hint: 'e.g. Minimalist Oak Desk Lamp',
          ),
          SizedBox(height: 2.h),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Label('Category'),
                    _DropdownInput(
                      value: _selectedCategory,
                      items: const [
                        'Lighting & Decor',
                        'Furniture',
                        'Electronics',
                      ],
                      onChanged: (v) => setState(() => _selectedCategory = v!),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 1.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Label('Collection'),
                    _DropdownInput(
                      value: _selectedCollection,
                      items: const [
                        'Winter 2024',
                        'Summer 2024',
                        'Core Collection',
                      ],
                      onChanged: (v) =>
                          setState(() => _selectedCollection = v!),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          _Label('Description'),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[50],
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(LucideIcons.bold, size: 16, color: Colors.grey[700]),
                      const SizedBox(width: 12),
                      Icon(
                        LucideIcons.italic,
                        size: 16,
                        color: Colors.grey[700],
                      ),
                      const SizedBox(width: 12),
                      Icon(LucideIcons.list, size: 16, color: Colors.grey[700]),
                      const Spacer(),
                      Icon(LucideIcons.link, size: 16, color: Colors.grey[700]),
                    ],
                  ),
                ),
                TextFormField(
                  controller: _descController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText:
                        'Describe the key features and story of your product...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPricingInventoryCard() {
    return _SectionCard(
      title: 'Pricing & Inventory',
      icon: LucideIcons.banknote,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Label('Regular Price'),
                    _TextInput(
                      controller: _priceController,
                      prefix: '\$',
                      hint: '0.00',
                    ),
                  ],
                ),
              ),
              SizedBox(width: 1.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Label('Sale Price (Optional)'),
                    _TextInput(controller: _salePriceController, prefix: '\$'),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Label('SKU'),
                    _TextInput(
                      controller: _skuController,
                      hint: 'LD-2024-OAK-SM',
                    ),
                  ],
                ),
              ),
              SizedBox(width: 1.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Label('Available Stock'),
                    Container(
                      height: 48,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () => setState(
                              () => _stockCount > 0 ? _stockCount-- : null,
                            ),
                            icon: Icon(
                              LucideIcons.minus,
                              size: 14.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                '$_stockCount',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () => setState(() => _stockCount++),
                            icon: Icon(
                              LucideIcons.plus,
                              size: 14.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF2F8FA),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE1F0F5)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Color(0xFFD3EBF1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    LucideIcons.packageCheck,
                    size: 20,
                    color: Color(0xFF258fb0),
                  ),
                ),
                SizedBox(width: 1.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Track Stock',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 10.sp,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        'Automatically update inventory on sale',
                        style: GoogleFonts.inter(
                          fontSize: 9.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: _trackStock,
                  onChanged: (v) => setState(() => _trackStock = v),
                  activeColor: const Color(0xFF258fb0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductMediaCard() {
    return _SectionCard(
      title: 'Product Media',
      icon: LucideIcons.image,
      headerAction: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          '4 SLOTS',
          style: TextStyle(
            fontSize: 8.sp,
            color: Colors.grey[500],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.2,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFE8E6DE),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF258fb0), width: 2),
              ),
              child: Stack(
                children: [
                  Center(
                    // Placeholder for main image
                    child: Container(
                      width: 40,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF258fb0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'MAIN',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 8.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 1.h),
          Row(
            children: [
              Expanded(child: _MediaPlaceholder()),
              SizedBox(width: 1.w),
              Expanded(child: _MediaPlaceholder()),
            ],
          ),
          SizedBox(height: 1.h),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(LucideIcons.helpCircle, size: 16, color: Colors.grey[500]),
                SizedBox(width: 0.5.w),
                Expanded(
                  child: Text(
                    'Recommended: 1200x1200px. PNG or JPG with transparent background or clean studio lighting. Max size 5MB.',
                    style: GoogleFonts.inter(
                      fontSize: 8.sp,
                      color: Colors.grey[500],
                      height: 1.5,
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

  Widget _buildTagsSEOCard() {
    return _SectionCard(
      title: 'Tags & SEO',
      icon: LucideIcons.tag,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Label('Search Tags'),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[50],
            ),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ..._tags.map(
                  (tag) => Chip(
                    label: Text(
                      tag,
                      style: GoogleFonts.inter(
                        fontSize: 9.sp,
                        color: const Color(0xFF258fb0),
                      ),
                    ),
                    backgroundColor: const Color(0xFFEAF6F9),
                    deleteIcon: const Icon(
                      Icons.close,
                      size: 14,
                      color: Color(0xFF258fb0),
                    ),
                    onDeleted: () => setState(() => _tags.remove(tag)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: BorderSide.none,
                    ),
                    padding: EdgeInsets.zero,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
                SizedBox(
                  width: 60,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Add...',
                      hintStyle: GoogleFonts.inter(
                        fontSize: 9.sp,
                        color: Colors.grey[500],
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 8,
                      ),
                    ),
                    onSubmitted: (val) {
                      if (val.isNotEmpty) setState(() => _tags.add(val));
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h),
          _Label('Visibility Status'),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _isPublished = true),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: _isPublished ? Colors.white : Colors.transparent,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(7),
                          bottomLeft: Radius.circular(7),
                        ),
                        border: _isPublished
                            ? Border.all(
                                color: const Color(0xFF258fb0),
                                width: 1.5,
                              )
                            : null,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Published',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 10.sp,
                          color: _isPublished
                              ? const Color(0xFF258fb0)
                              : Colors.grey[500],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(width: 1, height: 40, color: Colors.grey[300]),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _isPublished = false),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: !_isPublished
                            ? Colors.white
                            : Colors.transparent,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(7),
                          bottomRight: Radius.circular(7),
                        ),
                        border: !_isPublished
                            ? Border.all(
                                color: const Color(0xFF258fb0),
                                width: 1.5,
                              )
                            : null,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Draft',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 10.sp,
                          color: !_isPublished
                              ? const Color(0xFF258fb0)
                              : Colors.grey[500],
                        ),
                      ),
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

// --- Shared Local Widgets ---

class _SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;
  final Widget? headerAction;

  const _SectionCard({
    required this.title,
    required this.icon,
    required this.child,
    this.headerAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              if (headerAction != null) ...[const Spacer(), headerAction!],
            ],
          ),
          Divider(height: 3.h, color: Colors.grey[100]),
          child,
        ],
      ),
    );
  }
}

class _MediaPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[200]!,
            width: 2,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: DottedBorder(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(LucideIcons.camera, color: Colors.grey[400], size: 16.sp),
                const SizedBox(height: 4),
                Text(
                  'ADD VIEW',
                  style: GoogleFonts.inter(
                    fontSize: 7.sp,
                    color: Colors.grey[400],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DottedBorder extends StatelessWidget {
  final Widget child;
  const DottedBorder({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _DottedPainter(), child: child);
  }
}

class _DottedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    var path = Path();
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        const Radius.circular(12),
      ),
    );

    // Simple dash implementation
    Path dashPath = Path();
    double dashWidth = 5;
    double dashSpace = 5;
    double distance = 0;

    for (PathMetric pathMetric in path.computeMetrics()) {
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
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _Label extends StatelessWidget {
  final String text;
  const _Label(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 9.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }
}

class _TextInput extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final String? prefix;

  const _TextInput({required this.controller, this.hint, this.prefix});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 10.sp),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[400], fontSize: 10.sp),
          border: InputBorder.none,
          prefixText: prefix != null ? '$prefix ' : null,
          prefixStyle: TextStyle(
            color: Colors.grey[600],
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}

class _DropdownInput extends StatelessWidget {
  final String value;
  final List<String> items;
  final Function(String?) onChanged;

  const _DropdownInput({
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: Icon(
            LucideIcons.chevronDown,
            size: 16,
            color: Colors.grey[600],
          ),
          onChanged: onChanged,
          items: items
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(e, style: GoogleFonts.inter(fontSize: 10.sp)),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
