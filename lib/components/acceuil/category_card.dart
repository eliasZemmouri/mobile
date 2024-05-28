import 'package:flutter/material.dart';

class CategoryCardData {
  final String title;
  final double latitude;
  final double longitude;
  final Color color;
  final IconData icon;

  CategoryCardData({
    required this.title,
    required this.latitude,
    required this.longitude,
    required this.color,
    required this.icon,
  });
}

class CategoryCard extends StatelessWidget {
  final CategoryCardData data;

  CategoryCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(data.title),
                    subtitle: Text('latitude: ${data.latitude} et longitude ${data.longitude}'),
                    leading: Icon(data.icon),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Fermer'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Mettez ici le code pour réserver
                        },
                        child: Text('Réserver'),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                ],
              ),
            );
          },
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 11.0), // Ajout de padding horizontal
        child: Card(
          color: data.color,
          child: ListTile(
            leading: Icon(data.icon),
            title: Text(data.title),
            subtitle: Text(' ${data.latitude} et ${data.longitude}'),
          ),
        ),
      ),
    );
  }
}
