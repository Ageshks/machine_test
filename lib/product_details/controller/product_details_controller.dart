import 'package:get/get.dart';
import '../../data/models/product_model.dart';
import '../../services/api_service.dart';

class ProductDetailsController extends GetxController {
  var product = Rxn<Product>();
  var isLoading = false.obs;

  @override
  void onInit() {
    final id = int.parse(Get.parameters['id'] ?? '0');
    if (id > 0) fetchProduct(id);
    super.onInit();
  }

  Future<void> fetchProduct(int id) async {
    try {
      isLoading.value = true;
      final data = await ApiService.getProduct(id);
      product.value = Product.fromJson(data);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
