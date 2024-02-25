// mes_points_page.dart

import 'package:flutter/material.dart';

class MesPointsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes Points'),
      ),
      body: Center(
        child: Text('Nombre de points accumulés : X'), // Remplacez X par le nombre réel de points
      ),
    );
  }
}
