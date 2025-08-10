import 'package:get/get.dart';
import '../../services/api_service.dart';
import '../../routes/app_routes.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  Future<void> login() async {
    try {
      print("Username entered: '${username.value}'");
      print("Password entered: '${password.value}'");

      isLoading.value = true;
      final res = await ApiService.login(username.value.trim(), password.value);

      if (res.containsKey("token")) {
        Get.snackbar("Success", "Login successful");
        Get.offAllNamed(AppRoutes.products);
      } else {
        Get.snackbar("Error", "Invalid credentials");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
