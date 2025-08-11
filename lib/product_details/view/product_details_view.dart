import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/product_details_controller.dart';
import '../../widgets/glass_card.dart';
import '../../constants/colors.dart';

class ProductDetailsView extends StatelessWidget {
  ProductDetailsView({super.key});

  final ProductDetailsController controller = Get.put(
    ProductDetailsController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const CircularProgressIndicator();
          }

          final p = controller.product.value;
          if (p == null) {
            return const Text(
              "Product not found",
              style: TextStyle(color: Colors.white),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: GlassCard(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Get.back(),
                    ),
                  ),
                  Image.network(p.image, height: 200, fit: BoxFit.contain),
                  const SizedBox(height: 16),
                  Text(
                    p.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "\$${p.price}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.greenAccent,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    p.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
