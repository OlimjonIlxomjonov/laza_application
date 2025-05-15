import 'package:flutter/material.dart';
import 'package:laza_applicaiton/core/page_routes/route_generator.dart';
import 'package:laza_applicaiton/core/utils/responsiveness/app_responsivness.dart';

import 'auth/presentation/screen/splash/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsiveness.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: AppRoute.navigatorKey,
      home: SplashPage(),
    );
  }
}
