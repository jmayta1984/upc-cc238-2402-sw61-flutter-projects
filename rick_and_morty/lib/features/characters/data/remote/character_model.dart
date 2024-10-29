import 'package:rick_and_morty/features/characters/domain/character.dart';

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

  Character toCharacter() {
    return Character(
        id: id,
        name: name,
        status: status,
        species: species,
        image: image,
        gender: gender);
  }
}
