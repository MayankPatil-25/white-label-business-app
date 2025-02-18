class SalonCatalog {
  final int id;
  final String name;

  SalonCatalog({required this.id, required this.name});

  factory SalonCatalog.fromJson(Map<String, dynamic> json) {
    return SalonCatalog(id: json["id"], name: json["name"]);
  }
}
