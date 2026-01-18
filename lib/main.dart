import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'core/services/api_service.dart';
import 'core/services/storage_service.dart';
import 'features/auth/data/auth_api.dart';
import 'features/auth/data/auth_repository.dart';
import 'features/auth/view_model/auth_view_model.dart';
import 'features/products/data/product_api.dart';
import 'features/products/data/product_repository.dart';
import 'features/products/view_model/product_view_model.dart';
import 'routes/app_router.dart';
import 'core/constants/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Initialize Core Services
  // In a real app, you might use GetIt for DI, but Provider is fine for this scale
  final apiService = ApiService();
  final storageService = StorageService();

  // 2. Initialize Data Layer (APIs & Repositories)
  final authApi = AuthApi(apiService);
  final authRepository = AuthRepository(authApi, storageService);

  final productApi = ProductApi(apiService);
  final productRepository = ProductRepository(productApi);

  runApp(
    MultiProvider(
      providers: [
        // 3. Provide ViewModels (ChangeNotifiers)
        ChangeNotifierProvider(create: (_) => AuthViewModel(authRepository)),
        ChangeNotifierProvider(
          create: (_) => ProductViewModel(productRepository),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          title: 'FitMore Web',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: AppColors.primary,
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
            useMaterial3: true,
          ),
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
