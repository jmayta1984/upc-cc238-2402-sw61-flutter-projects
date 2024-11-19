import 'package:flutter/material.dart';
import 'package:superhero/features/heroes/domain/super_hero.dart';

class HeroListItem extends StatelessWidget {
  const HeroListItem({super.key, required this.hero});
  final SuperHero hero;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Image.network(
            hero.image,
            width: 90,
            height: 90,
            fit: BoxFit.cover,
          ),
          Text(hero.name)
        ],
      ),
    );
  }
}
