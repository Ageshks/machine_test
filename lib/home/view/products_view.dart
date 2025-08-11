import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/home/controller/product_controller.dart';
import 'package:machine_test/widgets/product_card.dart';
import '../../widgets/app_drawer.dart';

class ProductsView extends StatelessWidget {
  ProductsView({super.key});
  final ProductsController controller = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(controller: controller),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "SHOPOLICS",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.products.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.products.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.inbox, size: 64, color: Colors.grey),
                const SizedBox(height: 8),
                const Text('No products found'),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => controller.fetchProducts(firstLoad: true),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () => controller.fetchProducts(firstLoad: true),
          child: GridView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.65,
            ),
            itemCount: controller.products.length,
            itemBuilder: (_, index) {
              return ProductCard(product: controller.products[index]);
            },
          ),
        );
      }),
    );
  }
}
