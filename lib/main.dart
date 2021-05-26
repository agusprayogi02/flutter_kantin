import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/routes/app_pages.dart';
import 'package:school_app/ui/pages/splash_page/splash_page.dart';
import 'package:school_app/ui/theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.INITIAL,
      theme: appThemeData,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      home: SplashPage(),
    );
  }
}
