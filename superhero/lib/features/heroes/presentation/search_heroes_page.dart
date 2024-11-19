import 'package:flutter/material.dart';
import 'package:superhero/features/heroes/data/remote/super_hero_service.dart';
import 'package:superhero/features/heroes/domain/super_hero.dart';
import 'package:superhero/features/heroes/presentation/hero_list.dart';

class SearchHeroesPage extends StatefulWidget {
  const SearchHeroesPage({super.key});

  @override
  State<SearchHeroesPage> createState() => _SearchHeroesPageState();
}

class _SearchHeroesPageState extends State<SearchHeroesPage> {
  List<SuperHero> _heroes = [];

  Future<void> _loadData(String value) async {
    List<SuperHero> heroes = await SuperHeroService().getSuperHeroes( value);
    setState(() {
      _heroes = heroes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(border: OutlineInputBorder()),
          onSubmitted: (value) {
            _loadData(value);
          },
        ),
        Expanded(child: HeroList(heroes: _heroes))
      ],
    );
  }
}
