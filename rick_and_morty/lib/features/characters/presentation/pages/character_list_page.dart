import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/characters/data/remote/character_model.dart';
import 'package:rick_and_morty/features/characters/data/remote/character_service.dart';

class CharacterListPage extends StatefulWidget {
  const CharacterListPage({super.key});

  @override
  State<CharacterListPage> createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  List<CharacterModel> _characters = [];

  Future<void> loadData() async {
    List<CharacterModel> characters = await CharacterService().getCharacters();
    setState(() {
      _characters = characters;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: _characters.length,
      itemBuilder: (context, index) {
        return Card(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(_characters[index].name , maxLines: 1,)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.favorite_outline))
              ],
            ),
            Row(
              children: [
                ClipOval(
                    child: Image.network(
                  _characters[index].image,
                  width: 96,
                  height: 96,
                )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(_characters[index].species),
                  Text(_characters[index].gender),
                ],)
              ],
            )
          ],
        ));
      },
    );
  }
}
