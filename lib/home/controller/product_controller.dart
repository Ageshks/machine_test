import 'package:get/get.dart';
import '../../data/models/product_model.dart';
import '../../services/api_service.dart';

class ProductsController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts(firstLoad: true);
  }

  Future<void> fetchProducts({bool firstLoad = false}) async {
    try {
      if (firstLoad) isLoading.value = true;
      final data = await ApiService.getProducts();
      products.value = data.map<Product>((p) => Product.fromJson(p)).toList();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      if (firstLoad) isLoading.value = false;
    }
  }
}
