import 'package:flutter/material.dart';

import 'category_card.dart';

class RestaurantsPage extends StatelessWidget {
  final List<CategoryCardData> restaurants = [
    CategoryCardData(
      title: 'Restaurant 1',
      distance: 2.5,
      color: Colors.orange,
      icon: Icons.restaurant,
    ),
    CategoryCardData(
      title: 'Restaurant 2',
      distance: 5.0,
      color: Colors.orange,
      icon: Icons.restaurant,
    ),
    // Ajoutez d'autres restaurants ici
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        return CategoryCard(
          data: restaurants[index],
        );
      },
    );
  }
}
