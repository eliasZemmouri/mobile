import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:user_project/data/produit.dart';
import 'dart:math' as math;
import 'package:geolocator/geolocator.dart';


class ProduitService {
  final String apiBaseUrl = 'http://localhost:8080/api/produits';

  Future<List<Produit>> fetchAllProduits() async {
    final response = await http.get(Uri.parse(apiBaseUrl + '/all'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print('Réponse JSON : $jsonResponse'); // Log de débogage
      return jsonResponse.map((produit) => Produit.fromJson(produit)).toList();
    } else {
      throw Exception('Failed to load produits');
    }
  }
  Future<List<Produit>> fetchFilteredProduits(String type, double latitude, double longitude, double rayon) async {
    final response = await http.get(Uri.parse('$apiBaseUrl/filtre?type=$type&latitude=$latitude&longitude=$longitude&rayon=$rayon'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((produit) => Produit.fromJson(produit)).toList();
    } else {
      throw Exception('Failed to load produits');
    }
  }
  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const p = 0.017453292519943295; // Pi / 180
    final c = math.cos;
    final a = 0.5 - c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) *
            (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * math.asin(math.sqrt(a)); // 2 * R * asin(sqrt(a)), R = 6371 km
  }
  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Les services de localisation sont désactivés.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Les permissions de localisation sont refusées.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Les permissions de localisation sont refusées en permanence.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
