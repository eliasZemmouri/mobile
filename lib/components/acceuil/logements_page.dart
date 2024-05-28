import 'package:flutter/material.dart';

import 'category_card.dart';

class LogementsPage extends StatelessWidget {
  final List<CategoryCardData> logements = [
    CategoryCardData(
      title: 'Logement 1',
      latitude: 4.0,
      longitude: 4.0,
      color: Colors.blue,
      icon: Icons.home,
    ),
    CategoryCardData(
      title: 'Logement 2',
      latitude: 4.0,
      longitude: 4.0,
      color: Colors.blue,
      icon: Icons.home,
    ),
    CategoryCardData(
      title: 'Maisonette',
      latitude: 4.0,
      longitude: 4.0,
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
