import 'package:flutter/material.dart';

class CategoryCardData {
  final String title;
  final double distance;
  final Color color;
  final IconData icon;

  CategoryCardData({
    required this.title,
    required this.distance,
    required this.color,
    required this.icon,
  });
}

class CategoryCard extends StatelessWidget {
  final CategoryCardData data;

  CategoryCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: data.color,
      child: ListTile(
        leading: Icon(data.icon),
        title: Text(data.title),
        subtitle: Text('${data.distance} km'),
      ),
    );
  }
}
