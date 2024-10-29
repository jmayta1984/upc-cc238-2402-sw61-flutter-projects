
import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/characters/domain/character.dart';
import 'package:rick_and_morty/shared/data/local/favorite_dao.dart';
import 'package:rick_and_morty/shared/data/local/favorite_model.dart';

class CharacterListItem extends StatefulWidget {
  const CharacterListItem({super.key, required this.character});
  final Character character;

  @override
  State<CharacterListItem> createState() => _CharacterListItemState();
}

class _CharacterListItemState extends State<CharacterListItem> {

  void _validate() async {
    bool favorite = await FavoriteDao().isFavorite(widget.character.id);
    setState(() {
      widget.character.isFavorite = favorite;
    });
  }

  @override
  void initState() {
    _validate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                widget.character.name,
                maxLines: 1,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  widget.character.isFavorite = !widget.character.isFavorite;
                });

                if (widget.character.isFavorite) {
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
              icon: Icon(
                Icons.favorite_outline,
                color: widget.character.isFavorite ? Colors.red : Colors.grey,
              ),
            )
          ],
        ),
        Row(
          children: [
            ClipOval(
                child: Hero(
                  tag: widget.character.id,
                  child: Image.network(
                                widget.character.image,
                                width: 96,
                                height: 96,
                              ),
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.character.species,
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(widget.character.gender),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    ));
  }
}
