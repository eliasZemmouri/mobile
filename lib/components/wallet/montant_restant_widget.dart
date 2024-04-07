import 'package:flutter/material.dart';

class MontantRestantWidget extends StatelessWidget {
  final int creditsRestants;
  final Function(int) modifierCredits;

  MontantRestantWidget({
    required this.creditsRestants,
    required this.modifierCredits,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        'Montant restant : $creditsRestants crédits',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
