import 'package:flutter/material.dart';
import 'package:superhero/features/heroes/domain/super_hero.dart';
import 'package:superhero/features/heroes/presentation/hero_detail_page.dart';
import 'package:superhero/features/heroes/presentation/hero_list_item.dart';

class HeroList extends StatelessWidget {
  const HeroList({super.key, required this.heroes});
  final List<SuperHero> heroes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: heroes.length,
      itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HeroDetailPage(hero: heroes[index]),
                ));
          },
          child: HeroListItem(hero: heroes[index])),
    );
  }
}
