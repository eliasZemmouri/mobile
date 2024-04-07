import 'package:flutter/material.dart';

import 'category_card.dart';

class LogementsPage extends StatelessWidget {
  final List<CategoryCardData> logements = [
    CategoryCardData(
      title: 'Logement 1',
      distance: 10.0,
      color: Colors.blue,
      icon: Icons.home,
    ),
    CategoryCardData(
      title: 'Logement 2',
      distance: 8.0,
      color: Colors.blue,
      icon: Icons.home,
    ),
    CategoryCardData(
      title: 'Maisonette',
      distance: 3.5,
      color: Colors.blue,
      icon: Icons.home,
    ),
    // Ajoutez d'autres logements ici
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: logements.length,
      itemBuilder: (context, index) {
        return CategoryCard(
          data: logements[index],
        );
      },
    );
  }
}
