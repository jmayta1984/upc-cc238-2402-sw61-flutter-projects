import 'package:superhero/features/heroes/domain/super_hero.dart';

class SuperHeroService {
  Future<List<SuperHero>> getSuperHeroes() async {
    const String url = 'https://www.superheroapi.com/api.php/10157703717092094/search/batman';
  }
}