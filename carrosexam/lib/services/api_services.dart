import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://carros-electricos.wiremockapi.cloud";

  static Future<String?> login(String username, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/auth"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"username": username, "password": password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["token"];
    } else {
      return null;
    }
  }

  static Future<List<dynamic>?> getCarros(String token) async {
    final response = await http.get(
      Uri.parse("$baseUrl/carros"),
      headers: {"Authorization": token},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }
}
