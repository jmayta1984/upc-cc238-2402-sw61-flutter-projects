import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/characters/data/remote/character_model.dart';
import 'package:rick_and_morty/shared/data/local/favorite_dao.dart';
import 'package:rick_and_morty/shared/data/local/favorite_model.dart';

class CharacterDetailPage extends StatefulWidget {
  const CharacterDetailPage({super.key, required this.character});

  final CharacterModel character;

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {
  bool _isFavorite = false;

  Future<void> _loadData() async {
    bool isFavorite = await FavoriteDao().isFavorite(widget.character.id);
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
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                expandedHeight: height * 0.3,
                flexibleSpace: FlexibleSpaceBar(
                  background: Hero(
                    tag: widget.character.id,
                    child: Image.network(
                      widget.character.image,
                      width: double.infinity,
                      height: height * 0.3,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ];
          },
          body: Column(
            children: [
              Text(
                widget.character.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(widget.character.species),
              Text(widget.character.gender),
              Text(widget.character.status),
              IconButton.outlined(
                  onPressed: () {
                    setState(() {
                      _isFavorite = !_isFavorite;
                    });
                    if (_isFavorite) {
                      FavoriteDao().insertFavorite(FavoriteModel(
                          id: widget.character.id,
                          name: widget.character.name,
                          image: widget.character.image,
                          species: widget.character.species,
                          status: widget.character.status));
                    } else {
                      FavoriteDao().deleteFavorite(widget.character.id);
                    }
                  },
                  icon: Icon(Icons.favorite_outline,
                      color: _isFavorite ? Colors.red : Colors.grey))
            ],
          )),
    );
  }
}
