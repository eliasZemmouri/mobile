import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'category_card.dart';
import '../../data/produit.dart';
import '../../data/produit_service.dart';

class RestaurantsPage extends StatefulWidget {
  @override
  _RestaurantsPageState createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  final ProduitService _produitService = ProduitService();
  late List<Produit> _produits = [];
  late Position _currentPosition;

  @override
  void initState() {
    super.initState();
    _loadProduits();
  }

  Future<void> _loadProduits() async {
    try {
      _currentPosition = await _getCurrentLocation();
      final produits = await _produitService.fetchAllProduits();

      setState(() {
        _produits = produits;
      });
    } catch (e) {
      print("Erreur lors du chargement des produits: $e");
    }
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Vérifier si les services de localisation sont activés
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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _produits.length,
      itemBuilder: (context, index) {
        final Produit produit = _produits[index];
        return CategoryCard(
          data: CategoryCardData(
            title: produit.titre,
            latitude: produit.latitude,
            longitude: produit.longitude,
            color: Colors.orange,
            icon: Icons.restaurant,
          ),
        );
      },
    );
  }
}
