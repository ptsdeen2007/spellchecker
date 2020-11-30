import 'dart:convert';

import 'package:dictionary/model/DefinitionM.dart';
import 'package:dictionary/model/ErrorM.dart';
import 'package:http/http.dart' as http;

class DictionaryApiClient {
  Future<List<String>> fetchWordSuggestions(String query) async {
   var body2 = {
        "language": "enUS",
        "fieldvalues": query,
        "config": {
          "forceUpperCase": false,
          "ignoreIrregularCaps": false,
          "ignoreFirstCaps": true,
          "ignoreNumbers": true,
          "ignoreUpper": false,
          "ignoreDouble": false,
          "ignoreWordsWithNumbers": true
        }
      };
   print(json.encode(body2));
   var response =await  http.post(
      "https://jspell-checker.p.rapidapi.com/check",
      body:jsonEncode(body2) ,
      headers: {
        // "x-rapidapi-key": "2fbb3660eamsh6f7c900cb6060aap1d2eb6jsna112a647b126",//from 2007
        "x-rapidapi-key": "dfd48a200dmsh75d014c176aa9ecp199051jsn94b6d5b7b787",//from 2009
        // "x-rapidapi-key": "2c6f4196b8msh9b8c9fd6664925fp177cdcjsn293edc67887c",//from dev
        "x-rapidapi-host": "jspell-checker.p.rapidapi.com",
        "useQueryString": "true"
      }

    );
   // print("response from server ${response.body}");
   if(response.statusCode!=200){
     print(response.body);
     throw Exception(response.body);
   }else{
    ErrorM errorM= errorMFromJson(response.body);
    if(errorM.spellingErrorCount==0){
      return List();
    }else{
      var suggestions = errorM.elements.first.errors.first.suggestions;
      if(suggestions.isEmpty){
        return [query];
      }else{
        return suggestions;
      }


    }
   }
  }


  Future<DefinitionM> fetchWordDefinition(String word) async {
    String url="https://od-api.oxforddictionaries.com/api/v2/entries/en-gb/${word.toLowerCase()}";
   var response=await http.get(url,headers: {
      "app_id":"401c9bb9",
      "app_key":"faecb5877dbaaaf8fb3f837fd8533495"
    });
    return definitionMFromJson(response.body);
  }
}
