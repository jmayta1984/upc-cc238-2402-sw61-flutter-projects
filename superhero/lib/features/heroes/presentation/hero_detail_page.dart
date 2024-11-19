import 'package:flutter/material.dart';
import 'package:superhero/features/heroes/data/local/super_hero_dao.dart';
import 'package:superhero/features/heroes/domain/super_hero.dart';

class HeroDetailPage extends StatefulWidget {
  const HeroDetailPage({super.key, required this.hero});
  final SuperHero hero;

  @override
  State<HeroDetailPage> createState() => _HeroDetailPageState();
}

class _HeroDetailPageState extends State<HeroDetailPage> {
  bool _isFavorite = false;

  Future<void> _loadData() async {
    bool isFavorite = await SuperHeroDao().isFavorite(widget.hero.id);
    setState(() {
      _isFavorite = isFavorite;
    });
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  floating: true,
                  pinned: true,
                  expandedHeight: 400,
                  actions: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _isFavorite = !_isFavorite;
                        });
                        _isFavorite
                            ? SuperHeroDao().insert(widget.hero)
                            : SuperHeroDao().delete(widget.hero.id);
                      },
                      icon: Icon(
                          _isFavorite ? Icons.favorite : Icons.favorite_border),
                      color: Colors.red,
                    )
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                      widget.hero.image,
                      height: 400,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const SizedBox(
                        height: 400,
                        width: double.infinity,
                        child: Icon(Icons.person),
                      ),
                    ),
                  ),
                )
              ],
          body: SingleChildScrollView(
            child: Column(
              children: [
                Text(widget.hero.name),
                Text(widget.hero.intelligence),
                Slider(
                  value: double.parse(widget.hero.intelligence) / 100,
                  onChanged: (value) => {},
                )
              ],
            ),
          )),
    );
  }
}
