import 'package:flutter/material.dart';
import 'package:superhero/features/heroes/data/local/super_hero_dao.dart';
import 'package:superhero/features/heroes/domain/super_hero.dart';

class FavoriteListPage extends StatefulWidget {
  const FavoriteListPage({super.key});

  @override
  State<FavoriteListPage> createState() => _FavoriteListPageState();
}

class _FavoriteListPageState extends State<FavoriteListPage> {
  List<SuperHero> _heroes = [];

  Future<void> _loadData() async {
    List<SuperHero> heroes = await SuperHeroDao().fetchAll();

    setState(() {
      _heroes = heroes;
    });
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _heroes.length,
      itemBuilder: (context, index) => Card(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(_heroes[index].name),
      )),
    );
  }
}
