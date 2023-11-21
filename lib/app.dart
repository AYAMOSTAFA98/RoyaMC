import 'package:flutter/material.dart';
import 'package:roya_center/core/core_features/theme/presentation/utils/themes/i_theme.dart';
import 'package:roya_center/splash/presentation/screens/splash_screen.dart';
import 'core/core_features/theme/presentation/utils/themes/theme_light.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RoyaMC', 
      theme: ThemeLight().getThemeData(),
      home: const SplashScreen(),
    );
  }
}
