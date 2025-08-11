import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';
import '../home/controller/product_controller.dart';
import '../../constants/colors.dart'; // import your colors

class AppDrawer extends StatelessWidget {
  final ProductsController controller;
  const AppDrawer({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: AppColors.primaryOrange),
            accountName: const Text(
              "mor_2314",
              style: TextStyle(color: AppColors.white),
            ),
            accountEmail: const Text(
              "example.com",
              style: TextStyle(color: AppColors.white),
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: AppColors.white,
              child: Icon(
                Icons.person,
                size: 40,
                color: AppColors.primaryOrange,
              ),
            ),
          ),
          _buildDrawerItem(
            icon: Icons.person,
            text: "Profile",
            onTap: () {
              Navigator.pop(context);
              // Navigate to profile page
            },
          ),
          _buildDrawerItem(
            icon: Icons.settings,
            text: "Settings",
            onTap: () {
              Navigator.pop(context);
              // Navigate to settings page
            },
          ),
          const Spacer(),
          const Divider(),
          _buildDrawerItem(
            icon: Icons.logout,
            text: "Logout",
            onTap: () {
              controller.products.clear();
              Get.offAllNamed(AppRoutes.login);
              Get.snackbar("Logged out", "You have been logged out");
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryOrange),
      title: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
      onTap: onTap,
      hoverColor: AppColors.primaryOrange.withOpacity(
        0.1,
      ), // subtle hover effect for desktop/web
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      dense: true,
    );
  }
}
