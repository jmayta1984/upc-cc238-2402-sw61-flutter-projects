class SuperHero {
  final String id;
  final String name;
  final String gender;
  final String intelligence;
  final String image;

  const SuperHero({
    required this.id,
    required this.name,
    required this.gender,
    required this.intelligence,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
      'intelligence': intelligence,
      'image': image
    };
  }

  factory SuperHero.fromMap(Map<String, dynamic> map) {
    return SuperHero(
      id: map['id'],
      name: map['name'],
      gender: map['gender'],
      intelligence: map['intelligence'],
      image: map['image'],
    );
  }
}
