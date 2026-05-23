import 'package:fitmore_web/features/user/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sizer/sizer.dart';

import '../blocs/userCreate/user_create_bloc.dart';
import '../../../../core/widgets/custom_status_dialog.dart';

class UserDialog extends StatefulWidget {
  final UserEntity? user;

  const UserDialog({super.key, this.user});

  @override
  State<UserDialog> createState() => _UserDialogState();
}

class _UserDialogState extends State<UserDialog> {
  late final TextEditingController _usernameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _phoneController;

  late bool _isActive;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController(
      text: widget.user?.username ?? '',
    );
    _emailController = TextEditingController(text: widget.user?.email ?? '');
    _passwordController = TextEditingController(
      text: widget.user?.password ?? '',
    );
    _phoneController = TextEditingController(
      text: widget.user?.phoneNumber ?? '',
    );
    _isActive = widget.user?.active ?? true;
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isUpdate = widget.user != null;

    return BlocConsumer<UserCreateBloc, UserCreateState>(
      listener: (context, state) {
        if (state is UserCreateStateSuccess) {
          showCustomStatusDialog(
            context: context,
            status: DialogStatus.success,
            title: 'Success!',
            message: widget.user == null
                ? 'User created successfully.'
                : 'User updated successfully.',
            buttonText: 'Done',
            onButtonPressed: () {
              Navigator.pop(context);
            },
          );
        } else if (state is UserCreateStateError) {
          showCustomStatusDialog(
            context: context,
            status: DialogStatus.error,
            title: 'Error',
            message: state.message,
            buttonText: 'Close',
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is UserCreateStateLoading;

        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            width: 35.w,
            padding: const EdgeInsets.all(32),
            child: Form(
              key: _formKey,
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
                        child: Icon(
                          isUpdate
                              ? LucideIcons.userCheck
                              : LucideIcons.userPlus,
                          color: const Color(0xFF258fb0),
                          size: 20,
                        ),
                      ),
                      SizedBox(width: 1.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isUpdate ? 'Update User' : 'Add New User',
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            isUpdate
                                ? 'Modify account permissions and info'
                                : 'Create a new administrative or customer account',
                            style: GoogleFonts.inter(
                              fontSize: 8.sp,
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
                        child: _buildInput(
                          label: 'Username',
                          hint: 'e.g. johndoe',
                          controller: _usernameController,
                          icon: LucideIcons.user,
                          validator: (v) =>
                              v!.isEmpty ? 'Username required' : null,
                        ),
                      ),
                      SizedBox(width: 1.w),
                      Expanded(
                        child: _buildInput(
                          label: 'Phone Number',
                          hint: '+1 (555) 000-0000',
                          controller: _phoneController,
                          icon: LucideIcons.phone,
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.5.h),

                  _buildInput(
                    label: 'Email Address',
                    hint: 'john@example.com',
                    controller: _emailController,
                    icon: LucideIcons.mail,
                    keyboardType: TextInputType.emailAddress,
                    validator: (v) => v!.contains('@') ? null : 'Invalid email',
                  ),
                  SizedBox(height: 2.5.h),

                  _buildInput(
                    label: 'Password',
                    hint: isUpdate
                        ? 'Leave empty to keep current'
                        : 'At least 8 characters',
                    controller: _passwordController,
                    icon: LucideIcons.lock,
                    obscureText: true,
                    validator: (v) =>
                        !isUpdate && v!.length < 8 ? 'Too short' : null,
                  ),
                  SizedBox(height: 3.h),

                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Account Status',
                              style: GoogleFonts.inter(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              'Active users can log in and place orders',
                              style: GoogleFonts.inter(
                                fontSize: 8.sp,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Switch(
                          value: _isActive,
                          onChanged: (v) => setState(() => _isActive = v),
                          activeThumbColor: const Color(0xFF258fb0),
                        ),
                      ],
                    ),
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
                        onPressed: isLoading
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  final user = UserEntity(
                                    id: widget.user?.id,
                                    mongoId: widget.user?.mongoId,
                                    username: _usernameController.text,
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    phoneNumber: _phoneController.text,
                                    active: _isActive,
                                  );
                                  if (isUpdate) {
                                    context.read<UserCreateBloc>().add(
                                      UserCreateEvent.updateUser(user: user),
                                    );
                                  } else {
                                    context.read<UserCreateBloc>().add(
                                      UserCreateEvent.createUser(user: user),
                                    );
                                  }
                                }
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
                          elevation: 0,
                        ),
                        child: isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                isUpdate ? 'Update Account' : 'Create Account',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildInput({
    required String label,
    required String hint,
    required TextEditingController controller,
    required IconData icon,
    bool obscureText = false,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 9.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 1.h),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          style: GoogleFonts.inter(fontSize: 10.sp),
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, size: 18, color: Colors.grey[400]),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFF258fb0),
                width: 1.5,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            fillColor: Colors.white,
            filled: true,
          ),
        ),
      ],
    );
  }
}
