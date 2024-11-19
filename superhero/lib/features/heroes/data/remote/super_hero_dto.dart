import 'package:superhero/features/heroes/domain/super_hero.dart';

class SuperHeroDto {
  final String id;
  final String name;
  final PowerStats powerstats;
  //final Biography biography;
  final Appearance appearance;
  //final Work work;
  //final Connections connections;
  final SuperHeroImage image;

  const SuperHeroDto({
    required this.id,
    required this.name,
    required this.powerstats,
    // required this.biography,
    required this.appearance,
    // required this.work,
    // required this.connections,
    required this.image,
  });

  factory SuperHeroDto.fromJson(Map<String, dynamic> json) {
    return SuperHeroDto(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      powerstats: PowerStats.fromJson(json['powerstats'] ?? {}),
      // biography: Biography.fromJson(json['biography'] ?? {}),
      appearance: Appearance.fromJson(json['appearance'] ?? {}),
      // work: Work.fromJson(json['work'] ?? {}),
      // connections: Connections.fromJson(json['connections'] ?? {}),
      image: SuperHeroImage.fromJson(json['image'] ?? {}),
    );
  }

  SuperHero toDomain() {
    return SuperHero(
        id: id,
        name: name,
        intelligence: powerstats.intelligence,
        image: image.url,
        gender: appearance.gender);
  }
}

class PowerStats {
  final String intelligence;
  final String strength;
  final String speed;
  final String durability;
  final String power;
  final String combat;

  const PowerStats({
    required this.intelligence,
    required this.strength,
    required this.speed,
    required this.durability,
    required this.power,
    required this.combat,
  });

  factory PowerStats.fromJson(Map<String, dynamic> json) {
    return PowerStats(
      intelligence: (json['intelligence'] == 'null') ? '0' : json['intelligence'],
      strength: json['strength'] ?? '0',
      speed: json['speed'] ?? '0',
      durability: json['durability'] ?? '0',
      power: json['power'] ?? '0',
      combat: json['combat'] ?? '0',
    );
  }
}

class Biography {
  final String fullName;
  final String alterEgos;
  final List<String> aliases;
  final String placeOfBirth;
  final String firstAppearance;
  final String publisher;
  final String alignment;

  const Biography({
    required this.fullName,
    required this.alterEgos,
    required this.aliases,
    required this.placeOfBirth,
    required this.firstAppearance,
    required this.publisher,
    required this.alignment,
  });

  factory Biography.fromJson(Map<String, dynamic> json) {
    return Biography(
      fullName: json['full-name'] ?? '',
      alterEgos: json['alter-egos'] ?? '',
      aliases: List<String>.from(json['aliases'] ?? []),
      placeOfBirth: json['place-of-birth'] ?? '',
      firstAppearance: json['first-appearance'] ?? '',
      publisher: json['publisher'] ?? '',
      alignment: json['alignment'] ?? '',
    );
  }
}

class Appearance {
  final String gender;

  const Appearance({required this.gender});

  factory Appearance.fromJson(Map<String, dynamic> json) {
    return Appearance(gender: json['gender'] ?? '');
  }
}

class SuperHeroImage {
  final String url;

  const SuperHeroImage({required this.url});

  factory SuperHeroImage.fromJson(Map<String, dynamic> json) {
    return SuperHeroImage(url: json['url'] ?? '');
  }
}
