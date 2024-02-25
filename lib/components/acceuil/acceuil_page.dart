import 'package:flutter/material.dart';
import 'restaurants_page.dart';
import 'supermarches_page.dart';
import 'logements_page.dart';
import 'divertissements_page.dart';

class AccueilPage extends StatefulWidget {
  @override
  _AccueilPageState createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  int _selectedIndex = 0;

  List<Widget> _pages = [
    RestaurantsPage(),
    SupermarchesPage(),
    LogementsPage(),
    DivertissementsPage(),
  ];

  List<IconData> _icons = [
    Icons.restaurant,
    Icons.shopping_cart,
    Icons.hotel,
    Icons.theaters,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Container(
            color: Colors.grey[300], // Couleur de fond grise
            child: Row(
              children: [
                for (int i = 0; i < _icons.length; i++)
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = i;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4, // Occupe un quart de la largeur
                        decoration: BoxDecoration(
                          color: _selectedIndex == i ? Colors.blue : Colors.grey,
                          boxShadow: [
                            if (_selectedIndex == i)
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                              ),
                          ],
                        ),
                        padding: EdgeInsets.all(20),
                        child: Icon(
                          _icons[i],
                          size: 25, // Taille des emojis réduite à 25
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AccueilPage(),
  ));
}
