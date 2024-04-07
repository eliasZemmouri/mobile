import 'package:flutter/material.dart';
import 'montant_restant_widget.dart';

class HistoriqueAchatsBlock extends StatelessWidget {
  final List<HistoriqueAchat> historiqueAchats;
  final int creditsRestants;
  final Function(int) modifierCredits;

  HistoriqueAchatsBlock({
    required this.historiqueAchats,
    required this.creditsRestants,
    required this.modifierCredits,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MontantRestantWidget(
            creditsRestants: creditsRestants,
            modifierCredits: modifierCredits,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                ExpansionTile(
                  title: Text(
                    'Historique d\'achats',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    for (int index = 0; index < historiqueAchats.length; index++)
                      HistoriqueAchatCard(
                        nomArticle: historiqueAchats[index].nomArticle,
                        montant: historiqueAchats[index].montant,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class HistoriqueAchatCard extends StatelessWidget {
  final String nomArticle;
  final int montant;

  HistoriqueAchatCard({required this.nomArticle, required this.montant});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            nomArticle,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            'Montant: $montant crédits',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class HistoriqueAchat {
  final String nomArticle;
  final int montant;

  HistoriqueAchat(this.nomArticle, this.montant);
}
