import 'package:fitmore_web/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'core/routes/app_routers.dart';
import 'core/constants/app_colors.dart';
import 'core/routes/navigation_service.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return PlatformApp(
          title: 'FitMore Web',
          debugShowCheckedModeBanner: false,
          navigatorKey: NavigationService.navigatorKey,
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: AppRouters.login,
          localizationsDelegates: const [
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
          ],
          material: (context, platform) => MaterialAppData(
            theme: ThemeData(
              primaryColor: AppColors.primary,
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
              useMaterial3: true,
            ),
          ),
        );
      },
    );
  }
}
