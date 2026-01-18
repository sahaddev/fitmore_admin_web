import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:video_player/video_player.dart';
import '../view_model/auth_view_model.dart';
import '../../../../core/utils/validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'user@example.com');
  final _passwordController = TextEditingController(text: 'password123');
  late VideoPlayerController _videoController;
  bool _rememberMe = false;
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    _videoController =
        VideoPlayerController.asset('assets/videos/login_video.mp4')
          ..initialize().then((_) {
            _videoController.play();
            _videoController.setLooping(true);
            _videoController.setVolume(0); // Mute for background
            setState(() {}); // Update UI when video loads
          });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _videoController.dispose();
    super.dispose();
  }

  void _onLogin() async {
    if (_formKey.currentState!.validate()) {
      if (!mounted) return;
      final success = await context.read<AuthViewModel>().login(
        _emailController.text,
        _passwordController.text,
      );
      if (success && mounted) {
        context.go('/products');
      } else if (mounted) {
        final error = context.read<AuthViewModel>().error;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(error ?? 'Login failed')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Video Background
          if (_videoController.value.isInitialized)
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _videoController.value.size.width,
                  height: _videoController.value.size.height,
                  child: VideoPlayer(_videoController),
                ),
              ),
            )
          else
            Positioned.fill(
              child: Image.network(
                'https://images.unsplash.com/photo-1538481199705-c710c4e965fc?q=80&w=2665&auto=format&fit=crop', // Fallback/Loading image
                fit: BoxFit.cover,
              ),
            ),

          // Dark Overlay
          Positioned.fill(
            child: Container(color: Colors.black.withValues(alpha: 0.5)),
          ),
          // Main Content
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 450),
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(
                        alpha: 0.2,
                      ), // More transparent/glassy
                      borderRadius: BorderRadius.circular(24), // More rounded
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.1),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(
                            alpha: 0.3,
                          ), // More transparent/glassy
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Title Section
                          Text(
                            'NexusGate',
                            style: GoogleFonts.orbitron(
                              fontSize: 15.sp, // Slightly larger
                              fontWeight: FontWeight.w900, // Thicker font
                              color: Colors.white,
                              letterSpacing: 1.5,
                            ),
                          ),
                          const SizedBox(height: 12),
                          _BlinkingWidget(
                            duration: const Duration(seconds: 2),
                            child: Text(
                              'Your gaming universe awaits',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                color: Colors.white.withValues(alpha: 0.9),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          _BlinkingWidget(
                            duration: const Duration(seconds: 1),
                            child: Text(
                              '[Press Enter to join the adventure]',
                              style: GoogleFonts.inter(
                                color: Colors.white.withValues(alpha: 0.5),
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildEmoji('⚔️'),
                              const SizedBox(width: 12),
                              _buildEmoji('🎮'),
                              const SizedBox(width: 12),
                              _buildEmoji('🏆'),
                            ],
                          ),
                          const SizedBox(height: 40),

                          // Inputs
                          _buildInput(
                            controller: _emailController,
                            icon: LucideIcons.mail,
                            hint: 'Email address',
                            validator: Validators.validateEmail,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 20),
                          _buildInput(
                            controller: _passwordController,
                            icon: LucideIcons.lock,
                            hint: 'Password',
                            isPassword: true,
                            obscureText: _isObscure,
                            onTogglePassword: () {
                              setState(() => _isObscure = !_isObscure);
                            },
                            validator: Validators.validatePassword,
                          ),

                          const SizedBox(height: 24),

                          // Remember Me & Forgot Password
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Transform.scale(
                                    scale: 0.8,
                                    child: Switch(
                                      value: _rememberMe,
                                      onChanged: (val) =>
                                          setState(() => _rememberMe = val),
                                      activeThumbColor: Colors.white,
                                      activeTrackColor: const Color(
                                        0xFFA855F7,
                                      ), // Light purple track
                                      inactiveThumbColor: Colors.white,
                                      inactiveTrackColor: Colors.white
                                          .withValues(alpha: 0.2),
                                      trackOutlineColor:
                                          WidgetStateProperty.all(
                                            Colors.transparent,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    'Remember me',
                                    style: GoogleFonts.inter(
                                      color: Colors.white.withValues(
                                        alpha: 0.9,
                                      ),
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot password?',
                                  style: GoogleFonts.inter(
                                    color: Colors.white.withValues(alpha: 0.9),
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 32),

                          // Login Button
                          SizedBox(
                            width: double.infinity,
                            child: Consumer<AuthViewModel>(
                              builder: (context, viewModel, _) {
                                return ElevatedButton(
                                  onPressed: viewModel.isLoading
                                      ? null
                                      : _onLogin,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                      255,
                                      141,
                                      19,
                                      250,
                                    ), // Vibrant Purple from image
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 20,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: viewModel.isLoading
                                      ? const SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 2,
                                          ),
                                        )
                                      : Text(
                                          'Enter NexusGate',
                                          style: GoogleFonts.inter(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                );
                              },
                            ),
                          ),

                          const SizedBox(height: 40),

                          // Quick Access
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.white.withValues(alpha: 0.1),
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: Text(
                                  'quick access via',
                                  style: GoogleFonts.inter(
                                    color: Colors.white.withValues(alpha: 0.7),
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.white.withValues(alpha: 0.1),
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 24),

                          // Social Buttons
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildSocialButton(LucideIcons.chrome),
                              const SizedBox(width: 15),
                              _buildSocialButton(LucideIcons.twitter),
                              const SizedBox(width: 15),
                              _buildSocialButton(LucideIcons.gamepad2),
                            ],
                          ),

                          const SizedBox(height: 40),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account? ",
                                style: GoogleFonts.inter(
                                  color: Colors.white.withValues(alpha: 0.7),
                                  fontSize: 10.sp,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "Create Account",
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmoji(String emoji) {
    return Text(emoji, style: TextStyle(fontSize: 14.sp));
  }

  Widget _buildInput({
    required TextEditingController controller,
    required IconData icon,
    required String hint,
    required String? Function(String?) validator,
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? onTogglePassword,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      style: GoogleFonts.inter(
        color: Colors.white,
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.white.withValues(alpha: 0.7),
          size: 20,
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  obscureText ? LucideIcons.eye : LucideIcons.eyeOff,
                  color: Colors.white.withValues(alpha: 0.7),
                  size: 20,
                ),
                onPressed: onTogglePassword,
              )
            : null,
        hintText: hint,
        hintStyle: GoogleFonts.inter(
          color: Colors.white.withValues(alpha: 0.5),
          fontSize: 10.sp,
        ),
        filled: true,
        fillColor: Colors.white.withValues(
          alpha: 0.15,
        ), // Slightly lighter fill
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.3)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red.withValues(alpha: 0.5)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red.withValues(alpha: 0.5)),
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon) {
    return Expanded(
      child: Container(
        width: 50,
        height: 38,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(12), // More rounded
          border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white.withValues(alpha: 0.9),
            size: 20,
          ),
        ),
      ),
    );
  }
}

class _BlinkingWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const _BlinkingWidget({required this.child, required this.duration});

  @override
  State<_BlinkingWidget> createState() => _BlinkingWidgetState();
}

class _BlinkingWidgetState extends State<_BlinkingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0.3,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _animation, child: widget.child);
  }
}
