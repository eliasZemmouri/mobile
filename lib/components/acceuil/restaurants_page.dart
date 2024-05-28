import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    _loadProduits();
  }

  Future<void> _loadProduits() async {
    final produits = await _produitService.fetchAllProduits();
    print("baaaaka");
    if (produits.isNotEmpty) {
      setState(() {
        _produits = produits;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _produits.length,
      itemBuilder: (context, index) {
        final Produit produit = _produits[index];
        return CategoryCard(
          data: CategoryCardData(
            title: produit.title,
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
