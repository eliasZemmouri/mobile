import 'package:flutter/material.dart';
import 'package:user_project/components/profil/profil_page.dart';
import 'package:user_project/components/taches/taches_page.dart';

import 'acceuil/acceuil_page.dart';
import 'bottom_buttons.dart';
import 'bouttons_menu/mes_points_page.dart';
import 'bouttons_menu/parametres_page.dart';
import 'wallet/historique_achats_block.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int creditsRestants = 100;
  int _selectedBottomButtonIndex = 1;

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

  Widget _buildSelectedPage(int index) {
    switch (index) {
      case 0:
        return AccueilPage();
      case 1:
        return HistoriqueAchatsBlock(
          historiqueAchats: [
            HistoriqueAchat('Article 1', 10),
            HistoriqueAchat('Article 2', 20),
            HistoriqueAchat('Article 3', 15),
            HistoriqueAchat('Article 4', 150),
          ],
          creditsRestants: creditsRestants,
          modifierCredits: modifierCredits, // Passer modifierCredits ici
        );
      case 2:
        return TachesPage();
      default:
        return Container();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Container(),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MesPointsPage()),
                  );
                },
              ),
              ListTile(
                title: Text('Paramètres'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ParametresPage()),
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
            Expanded(
              child: _buildSelectedPage(_selectedBottomButtonIndex),
            ),
            BottomButtons(_selectedBottomButtonIndex, _onButtonTap),
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
