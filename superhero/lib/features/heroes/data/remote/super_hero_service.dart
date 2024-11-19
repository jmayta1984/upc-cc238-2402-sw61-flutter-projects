import 'dart:convert';
import 'dart:io';

import 'package:superhero/features/heroes/data/remote/super_hero_dto.dart';
import 'package:superhero/features/heroes/domain/super_hero.dart';
import 'package:http/http.dart' as http;

class SuperHeroService {
  Future<List<SuperHero>> getSuperHeroes() async {
    const String url =
        'https://www.superheroapi.com/api.php/10157703717092094/search/batman';

    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == HttpStatus.ok) {
        Map<String, dynamic> jsonReponse = jsonDecode(response.body);
        List maps = jsonReponse['results'];
        return maps
            .map((map) => SuperHeroDto.fromJson(map).toDomain())
            .toList();
      }
      return [];
    } catch (error) {
      return [];
    }
  }
}
