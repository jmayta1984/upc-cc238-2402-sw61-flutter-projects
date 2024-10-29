import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty/core/constants/app_constants.dart';
import 'package:rick_and_morty/features/characters/data/remote/character_model.dart';
import 'package:rick_and_morty/features/characters/domain/character.dart';

class CharacterService {
  Future<List<Character>> getCharacters(int page) async {
    final Uri url = Uri.parse(
        '${AppConstants.baseUrl}${AppConstants.characterEndpoint}?page=$page');
    final http.Response response = await http.get(url);
    if (response.statusCode == HttpStatus.ok) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      List maps = json['results'];
      List<Character> characters =
          maps.map((e) => CharacterModel.fromJson(e).toCharacter()).toList();
      return characters;
    }
    return [];
  }
}
