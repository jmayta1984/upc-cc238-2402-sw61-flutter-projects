import 'package:flutter/material.dart';
import 'package:superhero/features/heroes/domain/super_hero.dart';
import 'package:superhero/features/heroes/presentation/hero_list_item.dart';

class HeroList extends StatelessWidget {
  const HeroList({super.key, required this.heroes});
  final List<SuperHero> heroes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: heroes.length,
      itemBuilder: (context, index) => HeroListItem(hero: heroes[index]),
    );
  }
}
