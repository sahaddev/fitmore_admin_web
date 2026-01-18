import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../view_model/product_view_model.dart';
import '../../../../widgets/common/app_button.dart';
import '../../../../widgets/common/app_textfield.dart';
import '../../../../core/utils/validators.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _onSave() async {
    if (_formKey.currentState!.validate()) {
      final success = await context.read<ProductViewModel>().addProduct(
        _nameController.text,
        _descController.text,
        double.tryParse(_priceController.text) ?? 0.0,
      );

      if (success && mounted) {
        context.pop(); // Go back to list
      } else if (mounted) {
        final error = context.read<ProductViewModel>().error;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error ?? 'Failed to add product')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProductViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Add Product')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AppTextField(
                label: 'Product Name',
                controller: _nameController,
                validator: (v) => Validators.validateRequired(v, 'Name'),
              ),
              const SizedBox(height: 16),
              AppTextField(
                label: 'Description',
                controller: _descController,
                validator: (v) => Validators.validateRequired(v, 'Description'),
              ),
              const SizedBox(height: 16),
              AppTextField(
                label: 'Price',
                controller: _priceController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Price is required';
                  if (double.tryParse(v) == null) return 'Enter a valid number';
                  return null;
                },
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: AppButton(
                  text: 'Save Product',
                  onPressed: _onSave,
                  isLoading: viewModel.isLoading,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
