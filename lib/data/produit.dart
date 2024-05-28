class Produit {
  final String id;
  final String title;
  final double latitude;
  final double longitude;
  final String imageUrl;

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
      title: json['titre'] ?? "",
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      imageUrl: json['imageUrl'] ?? "", // Vérification pour imageUrl si nécessaire
    );
  }
}
