import 'package:get/get.dart';
import 'package:machine_test/splash/splash_screen.dart';
import '../login_flow/view/login_view.dart';
import '../home/view/products_view.dart';
import '../product_details/view/product_details_view.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.login, page: () => LoginView()),
    GetPage(name: AppRoutes.products, page: () => ProductsView()),
    GetPage(
      name: '${AppRoutes.productDetails}/:id',
      page: () => ProductDetailsView(),
    ),
  ];
}
