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
        title: Row(
          children: _buildIconButtons(),
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }

  List<Widget> _buildIconButtons() {
    return List.generate(_icons.length, (index) {
      return Expanded(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: _selectedIndex == index
                  ? Border(
                bottom: BorderSide(
                  color: Colors.blueAccent,
                  width: 7.0,
                ),
              )
                  : null,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
            ),
            child: Icon(
              _icons[index],
              size: 25,
              color: _selectedIndex == index ? Colors.blue : Colors.grey,
            ),
          ),
        ),
      );
    });
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AccueilPage(),
  ));
}
