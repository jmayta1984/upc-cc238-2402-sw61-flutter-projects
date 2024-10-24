import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty/core/constants/app_constants.dart';
import 'package:rick_and_morty/features/characters/data/remote/character_model.dart';

class CharacterService {
  Future<List<CharacterModel>> getCharacters() async {
    final Uri url =
        Uri.parse('${AppConstants.baseUrl}${AppConstants.characterEndpoint}');
    final http.Response response = await http.get(url);
    if (response.statusCode == HttpStatus.ok) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      List maps = json['results'];
      List<CharacterModel> characters =
          maps.map((e) => CharacterModel.fromJson(e)).toList();
      return characters;
    }
    return [];
  }
}
