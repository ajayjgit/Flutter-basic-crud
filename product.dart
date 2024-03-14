import 'dart:convert';
import 'package:http/http.dart' as http;

class product {
  String name;

  product({
    required this.name,
  });

  static Future<List<product>> getproduct() async {
    String url = "http://192.168.1.170/oc/n_product.php";

    try {
      // Make the HTTP GET request
      var response = await http.get(Uri.parse(url));

      // Check if the response is successful
      if (response.statusCode == 200) {
        // Parse the JSON response into a List<dynamic>
        List<dynamic> jsonData = jsonDecode(response.body);

        // Convert the List<dynamic> to List<Combo>
        List<product> n_prd = jsonData.map((data) {
          return product(name: data['product_name']);
        }).toList();

        // Return the list of combos
        return n_prd;
      } else {
        // If the server responds with an error, throw an exception
        throw Exception('Failed to load combos');
      }
    } catch (e) {
      // If an error occurs during the HTTP request, throw an exception
      throw Exception('Failed to load combos: $e');
    }
  }
}
