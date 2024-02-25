import 'package:flutter/material.dart';
import 'package:user_project/components/profil/profil_page.dart';
import 'package:user_project/components/taches/taches_page.dart';

import 'acceuil/acceuil_page.dart';
import 'bottom_buttons.dart';
import 'bouttons_menu/mes_points_page.dart';
import 'bouttons_menu/parametres_page.dart';
import 'wallet/historique_achats_block.dart';
import 'wallet/montant_restant_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int creditsRestants = 100;
  int _selectedBottomButtonIndex = 1; // Index du bouton de portefeuille sélectionné

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void modifierCredits(int nouvelleValeur) {
    setState(() {
      creditsRestants = nouvelleValeur;
    });
  }

  void _onButtonTap(int index) {
    setState(() {
      _selectedBottomButtonIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0), // Aucun espace réservé en bas de l'AppBar
          child: Container(), // Contenu vide pour éviter l'espace
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilPage()),
                );
              },
              child: Text(
                '🙍',
                style: TextStyle(fontSize: 30),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: Text('Mes Points'),
                onTap: () {
                  Navigator.pop(context);
                  // Naviguer vers la page "Mes Points"
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MesPointsPage()), // Créez cette page
                  );
                },
              ),
              ListTile(
                title: Text('Paramètres'),
                onTap: () {
                  Navigator.pop(context);
                  // Naviguer vers la page "Paramètres"
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ParametresPage()), // Créez cette page
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            MontantRestantWidget(
              creditsRestants: creditsRestants,
              modifierCredits: modifierCredits,
            ),
            Expanded(
              child: _selectedBottomButtonIndex == 0
                  ? AccueilPage()
                  : _selectedBottomButtonIndex == 1
                  ? HistoriqueAchatsBlock([
                HistoriqueAchat('Article 1', 10),
                HistoriqueAchat('Article 2', 20),
                HistoriqueAchat('Article 3', 15),
              ])
                  : TachesPage(),
            ),
            BottomButtons(_selectedBottomButtonIndex, _onButtonTap), // Affichage des boutons en bas
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
