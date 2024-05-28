// restaurant_model.dart
class Produit {
  final String id;
  final String title;
  final double latitude;
  final double longitude;
  final String imageUrl; // Ajoutez d'autres champs si nécessaire

  Produit({
    required this.id,
    required this.title,
    required this.latitude,
    required this.longitude,
    required this.imageUrl,
  });

  factory Produit.fromJson(Map<String, dynamic> json) {
    return Produit(
      id: json['id'],
      title: json['titre'] ?? "", // Vérifiez si la valeur title est nulle
      latitude: (json['latitude'] as num).toDouble(), // Conversion explicite en double
      longitude: (json['longitude'] as num).toDouble(), // Conversion explicite en double
      imageUrl: json['imageUrl'] ?? "", // Ajoutez une vérification similaire pour imageUrl si nécessaire
    );
  }

}
