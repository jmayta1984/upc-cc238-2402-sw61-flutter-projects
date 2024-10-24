class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String gender;
  final String species;
  final String image;

  CharacterModel(
      {required this.id,
      required this.name,
      required this.status,
      required this.gender,
      required this.species,
      required this.image});

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        status: json['status'] ?? '',
        gender: json['gender'] ?? '',
        species: json['species'] ?? '',
        image: json['image'] ?? '');
  }
}
