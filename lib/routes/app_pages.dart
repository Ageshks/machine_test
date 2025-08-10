import 'package:get/get.dart';
import '../login_flow/view/login_view.dart';
import '../home/view/products_view.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.login, page: () => LoginView()),
    GetPage(name: AppRoutes.products, page: () => ProductsView()),
  ];
}
