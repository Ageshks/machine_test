import 'package:flutter/material.dart';
import '../data/models/product_model.dart';
import '../routes/app_routes.dart';
import 'package:get/get.dart';
import 'custom_button.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed("${AppRoutes.productDetails}/${product.id}"),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Image (fixed height proportional to card height)
                SizedBox(
                  height: constraints.maxHeight * 0.45,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    child: Image.network(
                      product.image,
                      fit: BoxFit.contain,
                      errorBuilder:
                          (context, error, stackTrace) =>
                              const Center(child: Icon(Icons.broken_image)),
                    ),
                  ),
                ),

                // Title
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Text(
                    product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                // Price
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    "\$${product.price}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),

                const Spacer(),

                // Button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                    text: "View",
                    onPressed:
                        () => Get.toNamed(
                          "${AppRoutes.productDetails}/${product.id}",
                        ),
                    color: Colors.orange,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
