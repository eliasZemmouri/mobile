import 'package:flutter/material.dart';

class BottomButtons extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onButtonTap;

  BottomButtons(this.selectedIndex, this.onButtonTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100], // Couleur bleue claire pour l'arrière-plan
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomButton(
            icon: Icons.home,
            isSelected: selectedIndex == 0,
            onTap: () {
              onButtonTap(0);
            },
          ),
          BottomButton(
            icon: Icons.account_balance_wallet,
            isSelected: selectedIndex == 1,
            onTap: () {
              onButtonTap(1);
            },
          ),
          BottomButton(
            icon: Icons.assignment,
            isSelected: selectedIndex == 2,
            onTap: () {
              onButtonTap(2);
            },
          ),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  BottomButton({
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: isSelected ? Colors.blue : Colors.transparent,
          padding: EdgeInsets.all(16),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
