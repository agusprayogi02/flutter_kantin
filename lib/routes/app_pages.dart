import 'package:get/get.dart';
import 'package:school_app/ui/pages/home_page/home_page.dart';
import 'package:school_app/ui/pages/splash_page/splash_page.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.INITIAL,
      page: () => SplashPage(),
    ),
  ];
}
