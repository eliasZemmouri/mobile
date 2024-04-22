import 'package:flutter/material.dart';

class BottomButtons extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onButtonTap;

  BottomButtons(this.selectedIndex, this.onButtonTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.3),
        ),
      ),
      child: Container(
        color: Colors.white, // Couleur bleue claire pour l'arrière-plan
        padding: EdgeInsets.only(top: 12, bottom: 32), // Ajoute un padding en haut et en bas
        alignment: Alignment.center, // Centrer le contenu verticalement
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomButton(
              iconUrl: 'assets/icons/icons8-home-48.png',
              label: 'Accueil',
              isSelected: selectedIndex == 0,
              onTap: () {
                onButtonTap(0);
              },
              selectedColor: Colors.black,
              unselectedColor: Colors.blue[300]!,
            ),
            BottomButton(
              iconUrl: 'assets/icons/icons8-wallet-50.png',
              label: 'Portefeuille',
              isSelected: selectedIndex == 1,
              onTap: () {
                onButtonTap(1);
              },
              selectedColor: Colors.black,
              unselectedColor: Colors.blue[300]!,
            ),
            BottomButton(
              iconUrl: 'assets/icons/icons8-sheets-48.png',
              label: 'Tâches',
              isSelected: selectedIndex == 2,
              onTap: () {
                onButtonTap(2);
              },
              selectedColor: Colors.black,
              unselectedColor: Colors.blue[300]!,
            ),
          ],
        ),
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  final String iconUrl;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color selectedColor;
  final Color unselectedColor;

  BottomButton({
    required this.iconUrl,
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.selectedColor,
    required this.unselectedColor,
  });

  @override
  Widget build(BuildContext context) {
    Color iconColor = isSelected ? selectedColor : unselectedColor;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              iconUrl,
              color: iconColor,
              width: 25,
              height: 25,
            ),
            SizedBox(height: 1),
            Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontSize: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}