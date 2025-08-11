import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';
import '../home/controller/product_controller.dart';

class AppDrawer extends StatelessWidget {
  final ProductsController controller;
  const AppDrawer({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("mor_2314"),
            accountEmail: Text("example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 40),
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
    return ListTile(leading: Icon(icon), title: Text(text), onTap: onTap);
  }
}
