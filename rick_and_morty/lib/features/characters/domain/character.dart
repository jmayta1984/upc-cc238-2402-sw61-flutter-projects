class Character {
  final int id;
  final String name;
  final String status;
  final String gender;
  final String species;
  final String image;
  bool isFavorite = false;

  Character(
      {required this.id,
      required this.name,
      required this.status,
      required this.gender,
      required this.species,
      required this.image});
  
}