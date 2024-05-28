import 'package:flutter/material.dart';

import 'category_card.dart';

class SupermarchesPage extends StatelessWidget {
  final List<CategoryCardData> supermarches = [
    CategoryCardData(
      title: 'Supermarché 1',
      latitude: 4.0,
      longitude: 4.0,
      color: Colors.green,
      icon: Icons.shopping_cart,
    ),
    CategoryCardData(
      title: 'Supermarché 2',
      latitude: 4.0,
      longitude: 4.0,
      color: Colors.green,
      icon: Icons.shopping_cart,
    ),
    // Ajoutez d'autres supermarchés ici
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: supermarches.length,
      itemBuilder: (context, index) {
        return CategoryCard(
          data: supermarches[index],
        );
      },
    );
  }
}
