import 'package:flutter/material.dart';

class HistoriqueAchat {
  final String date;
  final String type;
  final String nomArticle;
  final int montant;

  HistoriqueAchat(this.date, this.type, this.nomArticle, this.montant);
}

class HistoriqueAchatCard extends StatelessWidget {
  final String date;
  final String type;
  final String nomArticle;
  final int montant;

  HistoriqueAchatCard({
    required this.date,
    required this.type,
    required this.nomArticle,
    required this.montant,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                type,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  nomArticle,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                'Montant: $montant crédits',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 16),
            child: Text(
              'Historique d\'achats',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            children: [
              for (int index = 0; index < historiqueAchats.length; index++)
                HistoriqueAchatCard(
                  date: historiqueAchats[index].date,
                  type: historiqueAchats[index].type,
                  nomArticle: historiqueAchats[index].nomArticle,
                  montant: historiqueAchats[index].montant,
                ),
            ],
          ),
        ],
      ),
    );
  }
}