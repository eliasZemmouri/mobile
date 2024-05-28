// restaurant_model.dart
class Produit {
  final String id;
  final String title;
  final double distance;
  final String imageUrl; // Ajoutez d'autres champs si nécessaire

  Produit({
    required this.id,
    required this.title,
    required this.distance,
    required this.imageUrl,
  });

  factory Produit.fromJson(Map<String, dynamic> json) {
    return Produit(
      id: json['id'],
      title: json['titre'] ?? "", // Vérifiez si la valeur title est nulle
      distance: json['distance'] != null ? json['distance'].toDouble() : 0.0,
      imageUrl: json['imageUrl'] ?? "", // Ajoutez une vérification similaire pour imageUrl si nécessaire
    );
  }

}
