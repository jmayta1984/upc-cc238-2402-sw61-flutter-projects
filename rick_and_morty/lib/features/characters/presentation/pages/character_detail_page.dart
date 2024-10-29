import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/characters/domain/character.dart';

class CharacterDetailPage extends StatefulWidget {
  const CharacterDetailPage(
      {super.key,
      required this.character,
      required this.onDelete,
      required this.onInsert});

  final Character character;
  final Function() onDelete;
  final Function() onInsert;

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {
  @override
  void initState() {
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
                      widget.character.isFavorite =
                          !widget.character.isFavorite;
                    });
                    if (widget.character.isFavorite) {
                      widget.onInsert();
                    } else {
                      widget.onDelete();
                    }
                  },
                  icon: Icon(Icons.favorite_outline,
                      color: widget.character.isFavorite
                          ? Colors.red
                          : Colors.grey))
            ],
          )),
    );
  }
}
