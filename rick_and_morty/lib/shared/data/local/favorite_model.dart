class FavoriteModel {
  final int id;
  final String name;
  final String species;
  final String status;
  final String image;

  FavoriteModel({
    required this.id,
    required this.name,
    required this.species,
    required this.status,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'species': species,
      'status': status,
      'image': image,
    };
  }

  factory FavoriteModel.fromMap(Map<String, dynamic> map) {
    return FavoriteModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      species: map['species'] ?? '',
      status: map['status'] ?? '',
      image: map['image'] ?? '',
    );
  }
  
}