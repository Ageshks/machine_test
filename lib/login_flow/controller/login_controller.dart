import 'package:get/get.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  Future<void> login() async {
    try {
      print("Username entered: '${username.value}'");
      print("Password entered: '${password.value}'");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
