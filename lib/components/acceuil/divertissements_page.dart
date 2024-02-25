import 'package:flutter/material.dart';

import 'category_card.dart';

class DivertissementsPage extends StatelessWidget {
  final List<CategoryCardData> divertissements = [
    CategoryCardData(
      title: 'Divertissement 1',
      distance: 4.0,
      color: Colors.purple,
      icon: Icons.games,
    ),
    CategoryCardData(
      title: 'Divertissement 2',
      distance: 6.0,
      color: Colors.purple,
      icon: Icons.games,
    ),
    // Ajoutez d'autres divertissements ici
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: divertissements.length,
      itemBuilder: (context, index) {
        return CategoryCard(
          data: divertissements[index],
        );
      },
    );
  }
}
