import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/login_controller.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custom_button.dart';
import '../../constants/colors.dart';
import '../../widgets/glass_card.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0), // plain background
      body: Center(
        child: GlassCard(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                label: "Username",
                onChanged: (val) => controller.username.value = val,
              ),
              const SizedBox(height: 12),
              CustomTextField(
                label: "Password",
                obscureText: true,
                onChanged: (val) => controller.password.value = val,
              ),
              const SizedBox(height: 20),
              Obx(
                () => CustomButton(
                  text: "Login",
                  isLoading: controller.isLoading.value,
                  onPressed: controller.login,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
