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
    String id = '';
    if (json.containsKey('_id') && json['_id'] != null && json['_id'].containsKey('\$oid')) {
      id = json['_id']['\$oid'];
    }

    List<dynamic> location = json['location'] ?? [0.0, 0.0];
    double longitude = 0.0;
    double latitude = 0.0;
    if (location.length >= 2) {
      longitude = double.parse(location[0].toString());
      latitude = double.parse(location[1].toString());
    }

    DateTime dateAjout = DateTime.now();
    if (json.containsKey('dateAjout') && json['dateAjout'] != null) {
      if (json['dateAjout'] is String) {
        dateAjout = DateTime.parse(json['dateAjout']);
      } else if (json['dateAjout'] is Map && json['dateAjout'].containsKey('\$date')) {
        dateAjout = DateTime.parse(json['dateAjout']['\$date']);
      }
    }

    return Produit(
      id: id,
      titre: json['titre'] ?? '',
      description: json['description'] ?? '',
      type: json['type'] ?? '',
      longitude: longitude,
      latitude: latitude,
      dateAjout: dateAjout,
      actif: json['actif'] ?? false,
    );
  }
}
