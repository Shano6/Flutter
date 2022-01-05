import 'package:dio/dio.dart';
import 'package:rest_api_ex/data/models/character.dart';

class CharacterRepository {
  List<Character>? characterList = [];
  Dio dio = Dio();

  Future<List<Character>?>? fetchCharacters() async {
    final response = await dio.get('https://swapi.dev/api/people/');
    if (response.statusCode == 200) {
      var loadedCharacters = <Character>[];
      response.data['results'].forEach((character) {
        Character characterModel = Character.fromJson(character);
        loadedCharacters.add(characterModel);
        characterList = loadedCharacters;
        return characterList;
      });
    }
    return characterList;
  }
}
