// To parse this JSON data, do
//
//     final errorM = errorMFromJson(jsonString);

import 'dart:convert';

ErrorM errorMFromJson(String str) => ErrorM.fromJson(json.decode(str));

String errorMToJson(ErrorM data) => json.encode(data.toJson());

class ErrorM {
  ErrorM({
    this.elements,
    this.spellingErrorCount,
  });

  List<Element> elements;
  int spellingErrorCount;

  factory ErrorM.fromJson(Map<String, dynamic> json) => ErrorM(
    elements: json["elements"] == null ? null : List<Element>.from(json["elements"].map((x) => Element.fromJson(x))),
    spellingErrorCount: json["spellingErrorCount"] == null ? null : json["spellingErrorCount"],
  );

  Map<String, dynamic> toJson() => {
    "elements": elements == null ? null : List<dynamic>.from(elements.map((x) => x.toJson())),
    "spellingErrorCount": spellingErrorCount == null ? null : spellingErrorCount,
  };
}

class Element {
  Element({
    this.id,
    this.errors,
  });

  int id;
  List<Error> errors;

  factory Element.fromJson(Map<String, dynamic> json) => Element(
    id: json["id"] == null ? null : json["id"],
    errors: json["errors"] == null ? null : List<Error>.from(json["errors"].map((x) => Error.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "errors": errors == null ? null : List<dynamic>.from(errors.map((x) => x.toJson())),
  };
}

class Error {
  Error({
    this.word,
    this.position,
    this.suggestions,
  });

  String word;
  int position;
  List<String> suggestions;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    word: json["word"] == null ? null : json["word"],
    position: json["position"] == null ? null : json["position"],
    suggestions: json["suggestions"] == null ? null : List<String>.from(json["suggestions"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "word": word == null ? null : word,
    "position": position == null ? null : position,
    "suggestions": suggestions == null ? null : List<dynamic>.from(suggestions.map((x) => x)),
  };
}
