import 'package:dictionary/model/DefinitionM.dart';

import 'dictionaryApiClent.dart';

class DictionaryRepository {

  //to get suggestion from https://developer.oxforddictionaries.com/
  Future<List<String>> getWordSuggestions(String query) {
    return DictionaryApiClient().fetchWordSuggestions(query);
  }

  //to get definition from https://rapidapi.com/jspell/api/jspell-checker
  Future<DefinitionM> getWordDefinition(String query) {
    var fetchWordDefinition;
    try {
       fetchWordDefinition = DictionaryApiClient().fetchWordDefinition(query);
       return fetchWordDefinition;
    } catch (e) {
     throw Exception("Something went wrong $query");
    }

  }
}