class Produit {
  final String id;
  final String titre;
  final String description;
  final String type;
  final double longitude;
  final double latitude;
  final DateTime dateAjout;
  final bool actif;

  Produit({
    required this.id,
    required this.titre,
    required this.description,
    required this.type,
    required this.longitude,
    required this.latitude,
    required this.dateAjout,
    required this.actif,
  });

  factory Produit.fromJson(Map<String, dynamic> json) {
    return Produit(
      id: json['id'] ?? '',
      titre: json['titre'] ?? '',
      description: json['description'] ?? '',
      type: json['type'] ?? '',
      longitude: json['longitude'] != null ? double.parse(json['longitude'].toString()) : 0.0,
      latitude: json['latitude'] != null ? double.parse(json['latitude'].toString()) : 0.0,
      dateAjout: json['dateAjout'] != null ? DateTime.parse(json['dateAjout']) : DateTime.now(),
      actif: json['actif'] ?? false,
    );
  }
}
