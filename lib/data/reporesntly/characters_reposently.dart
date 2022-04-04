import '../model/characters_model.dart';
import '../model/quote.dart';
import '../web_services/characters_web_serves.dart';

class CharactersReposently {
  final CharactaesticWebServices charactaesticWebServices;

  CharactersReposently(this.charactaesticWebServices);
  Future<List<Character>> getAllCharacters() async {
    final characters = await charactaesticWebServices.getAllCharecters();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
   Future<List<Quote>> getCharacterQuotes(String charName) async {
    final quotes = await charactaesticWebServices.getCharacterQuotes(charName);
    return quotes.map((charQuotes) => Quote.fromJson(charQuotes)).toList();
  }

}
