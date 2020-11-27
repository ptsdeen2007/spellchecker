import 'package:dictionary/model/DefinitionM.dart';

import 'dictionaryApiClent.dart';

class DictionaryRepository {
  Future<List<String>> getWordSuggestions(String query) {
    return DictionaryApiClient().fetchWordSuggestions(query);
  }

  Future<DefinitionM> getWordDefinition(String query) {
    return DictionaryApiClient().fetchWordDefinition(query);
  }
}