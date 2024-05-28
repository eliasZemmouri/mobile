import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
import './produit.dart';

class ProduitService {
  final String apiBaseUrl = 'http://localhost:8080/api/produits';

  Future<List<Produit>> fetchAllProduits() async {
    final response = await http.get(Uri.parse(apiBaseUrl + '/all'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((produit) => Produit.fromJson(produit)).toList();
    } else {
      throw Exception('Failed to load produits');
    }
  }


// Add other methods as needed
}