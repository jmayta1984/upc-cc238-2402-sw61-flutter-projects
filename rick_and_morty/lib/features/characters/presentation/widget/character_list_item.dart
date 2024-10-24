import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/characters/data/remote/character_model.dart';
import 'package:rick_and_morty/shared/data/local/favorite_dao.dart';
import 'package:rick_and_morty/shared/data/local/favorite_model.dart';

class CharacterListItem extends StatefulWidget {
  const CharacterListItem({super.key, required this.character});
  final CharacterModel character;

  @override
  State<CharacterListItem> createState() => _CharacterListItemState();
}

class _CharacterListItemState extends State<CharacterListItem> {
  bool _isFavorite = false;

  void _validate() async {
    bool favorite = await FavoriteDao().isFavorite(widget.character.id);
    setState(() {
      _isFavorite = favorite;
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
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Text(
              widget.character.name,
              maxLines: 1,
            )),
            IconButton(
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
              icon:  Icon(
                Icons.favorite_outline,
                color: _isFavorite?Colors.red: Colors.grey,
              ),
            )
          ],
        ),
        Row(
          children: [
            ClipOval(
                child: Image.network(
              widget.character.image,
              width: 96,
              height: 96,
            )),
            Expanded(
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
            )
          ],
        )
      ],
    ));
  }
}
