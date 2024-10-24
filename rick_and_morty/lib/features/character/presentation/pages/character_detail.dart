import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/character/data/remote/character_model.dart';

class CharacterDetail extends StatelessWidget {
  const CharacterDetail({super.key, required this.character});
  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: height * 0.35,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Hero(
                    tag: character.id,
                    child: Image.network(character.image,
                        width: double.infinity,
                        height: height * 0.35,
                        fit: BoxFit.cover),
                  ),
                ),
              )
            ];
          },
          body: Column(
            children: [
              Text(character.name),
              Text(character.status),
              Text(character.species),
            ],
          )),
    );
  }
}
