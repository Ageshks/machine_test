import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://fakestoreapi.com";

  static Future<Map<String, dynamic>> login(
    String username,
    String password,
  ) async {
    final res = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"username": username, "password": password}),
    );

    print("Status code: ${res.statusCode}");
    print("Response body: ${res.body}");

    if (res.statusCode == 200 || res.statusCode == 201) {
      return jsonDecode(res.body);
    } else {
      throw Exception('Login failed: ${res.body}');
    }
  }

  static Future<List<dynamic>> getProducts() async {
    final res = await http.get(Uri.parse('$baseUrl/products'));
    if (res.statusCode == 200) return jsonDecode(res.body);
    throw Exception('Failed to fetch products');
  }

  static Future<Map<String, dynamic>> getProduct(int id) async {
    final res = await http.get(Uri.parse('$baseUrl/products/$id'));
    if (res.statusCode == 200) return jsonDecode(res.body);
    throw Exception('Failed to fetch product');
  }
}
