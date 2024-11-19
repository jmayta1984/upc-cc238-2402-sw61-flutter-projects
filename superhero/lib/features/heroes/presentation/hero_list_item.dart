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
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              hero.image,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const SizedBox(
                width: 90,
                height: 90,
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hero.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(hero.gender)
              ],
            ),
          )
        ],
      ),
    );
  }
}
