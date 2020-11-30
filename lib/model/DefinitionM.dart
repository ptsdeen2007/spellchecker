// To parse this JSON data, do
//
//     final definitionM = definitionMFromJson(jsonString);

import 'dart:convert';

DefinitionM definitionMFromJson(String str) => DefinitionM.fromJson(json.decode(str));

String definitionMToJson(DefinitionM data) => json.encode(data.toJson());

class DefinitionM {
  DefinitionM({
    this.id,
    this.metadata,
    this.results,
    this.word,
    this.error
  });

  String id;
  Metadata metadata;
  List<Result> results;
  String word;
  String error;

  factory DefinitionM.fromJson(Map<String, dynamic> json) => DefinitionM(
    id: json["id"] == null ? null : json["id"],
    metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
    results: json["results"] == null ? null : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    word: json["word"] == null ? null : json["word"],
    error: json["error"] == null ? null : json["error"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "metadata": metadata == null ? null : metadata.toJson(),
    "results": results == null ? null : List<dynamic>.from(results.map((x) => x.toJson())),
    "word": word == null ? null : word,
    "error": error == null ? null : error,
  };
}

class Metadata {
  Metadata({
    this.operation,
    this.provider,
    this.schema,
  });

  String operation;
  String provider;
  String schema;

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    operation: json["operation"] == null ? null : json["operation"],
    provider: json["provider"] == null ? null : json["provider"],
    schema: json["schema"] == null ? null : json["schema"],
  );

  Map<String, dynamic> toJson() => {
    "operation": operation == null ? null : operation,
    "provider": provider == null ? null : provider,
    "schema": schema == null ? null : schema,
  };
}

class Result {
  Result({
    this.id,
    this.language,
    this.lexicalEntries,
    this.type,
    this.word,
  });

  String id;
  String language;
  List<LexicalEntry> lexicalEntries;
  String type;
  String word;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"] == null ? null : json["id"],
    language: json["language"] == null ? null : json["language"],
    lexicalEntries: json["lexicalEntries"] == null ? null : List<LexicalEntry>.from(json["lexicalEntries"].map((x) => LexicalEntry.fromJson(x))),
    type: json["type"] == null ? null : json["type"],
    word: json["word"] == null ? null : json["word"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "language": language == null ? null : language,
    "lexicalEntries": lexicalEntries == null ? null : List<dynamic>.from(lexicalEntries.map((x) => x.toJson())),
    "type": type == null ? null : type,
    "word": word == null ? null : word,
  };
}

class LexicalEntry {
  LexicalEntry({
    this.entries,
    this.language,
    this.lexicalCategory,
    this.phrases,
    this.text,
  });

  List<Entry> entries;
  String language;
  LexicalCategory lexicalCategory;
  List<LexicalCategory> phrases;
  String text;

  factory LexicalEntry.fromJson(Map<String, dynamic> json) => LexicalEntry(
    entries: json["entries"] == null ? null : List<Entry>.from(json["entries"].map((x) => Entry.fromJson(x))),
    language: json["language"] == null ? null : json["language"],
    lexicalCategory: json["lexicalCategory"] == null ? null : LexicalCategory.fromJson(json["lexicalCategory"]),
    phrases: json["phrases"] == null ? null : List<LexicalCategory>.from(json["phrases"].map((x) => LexicalCategory.fromJson(x))),
    text: json["text"] == null ? null : json["text"],
  );

  Map<String, dynamic> toJson() => {
    "entries": entries == null ? null : List<dynamic>.from(entries.map((x) => x.toJson())),
    "language": language == null ? null : language,
    "lexicalCategory": lexicalCategory == null ? null : lexicalCategory.toJson(),
    "phrases": phrases == null ? null : List<dynamic>.from(phrases.map((x) => x.toJson())),
    "text": text == null ? null : text,
  };
}

class Entry {
  Entry({
    this.etymologies,
    this.inflections,
    this.pronunciations,
    this.senses,
    this.notes,
  });

  List<String> etymologies;
  List<Inflection> inflections;
  List<Pronunciation> pronunciations;
  List<Sense> senses;
  List<Note> notes;

  factory Entry.fromJson(Map<String, dynamic> json) => Entry(
    etymologies: json["etymologies"] == null ? null : List<String>.from(json["etymologies"].map((x) => x)),
    inflections: json["inflections"] == null ? null : List<Inflection>.from(json["inflections"].map((x) => Inflection.fromJson(x))),
    pronunciations: json["pronunciations"] == null ? null : List<Pronunciation>.from(json["pronunciations"].map((x) => Pronunciation.fromJson(x))),
    senses: json["senses"] == null ? null : List<Sense>.from(json["senses"].map((x) => Sense.fromJson(x))),
    notes: json["notes"] == null ? null : List<Note>.from(json["notes"].map((x) => Note.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "etymologies": etymologies == null ? null : List<dynamic>.from(etymologies.map((x) => x)),
    "inflections": inflections == null ? null : List<dynamic>.from(inflections.map((x) => x.toJson())),
    "pronunciations": pronunciations == null ? null : List<dynamic>.from(pronunciations.map((x) => x.toJson())),
    "senses": senses == null ? null : List<dynamic>.from(senses.map((x) => x.toJson())),
    "notes": notes == null ? null : List<dynamic>.from(notes.map((x) => x.toJson())),
  };
}

class Inflection {
  Inflection({
    this.grammaticalFeatures,
    this.inflectedForm,
    this.pronunciations,
  });

  List<GrammaticalFeature> grammaticalFeatures;
  String inflectedForm;
  List<Pronunciation> pronunciations;

  factory Inflection.fromJson(Map<String, dynamic> json) => Inflection(
    grammaticalFeatures: json["grammaticalFeatures"] == null ? null : List<GrammaticalFeature>.from(json["grammaticalFeatures"].map((x) => GrammaticalFeature.fromJson(x))),
    inflectedForm: json["inflectedForm"] == null ? null : json["inflectedForm"],
    pronunciations: json["pronunciations"] == null ? null : List<Pronunciation>.from(json["pronunciations"].map((x) => Pronunciation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "grammaticalFeatures": grammaticalFeatures == null ? null : List<dynamic>.from(grammaticalFeatures.map((x) => x.toJson())),
    "inflectedForm": inflectedForm == null ? null : inflectedForm,
    "pronunciations": pronunciations == null ? null : List<dynamic>.from(pronunciations.map((x) => x.toJson())),
  };
}

class GrammaticalFeature {
  GrammaticalFeature({
    this.id,
    this.text,
    this.type,
  });

  String id;
  String text;
  String type;

  factory GrammaticalFeature.fromJson(Map<String, dynamic> json) => GrammaticalFeature(
    id: json["id"] == null ? null : json["id"],
    text: json["text"] == null ? null : json["text"],
    type: json["type"] == null ? null : json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "text": text == null ? null : text,
    "type": type == null ? null : type,
  };
}

class Pronunciation {
  Pronunciation({
    this.dialects,
    this.phoneticNotation,
    this.phoneticSpelling,
    this.audioFile,
  });

  List<String> dialects;
  String phoneticNotation;
  String phoneticSpelling;
  String audioFile;

  factory Pronunciation.fromJson(Map<String, dynamic> json) => Pronunciation(
    dialects: json["dialects"] == null ? null : List<String>.from(json["dialects"].map((x) => x)),
    phoneticNotation: json["phoneticNotation"] == null ? null : json["phoneticNotation"],
    phoneticSpelling: json["phoneticSpelling"] == null ? null : json["phoneticSpelling"],
    audioFile: json["audioFile"] == null ? null : json["audioFile"],
  );

  Map<String, dynamic> toJson() => {
    "dialects": dialects == null ? null : List<dynamic>.from(dialects.map((x) => x)),
    "phoneticNotation": phoneticNotation == null ? null : phoneticNotation,
    "phoneticSpelling": phoneticSpelling == null ? null : phoneticSpelling,
    "audioFile": audioFile == null ? null : audioFile,
  };
}

class Note {
  Note({
    this.text,
    this.type,
  });

  String text;
  String type;

  factory Note.fromJson(Map<String, dynamic> json) => Note(
    text: json["text"] == null ? null : json["text"],
    type: json["type"] == null ? null : json["type"],
  );

  Map<String, dynamic> toJson() => {
    "text": text == null ? null : text,
    "type": type == null ? null : type,
  };
}

class Sense {
  Sense({
    this.definitions,
    this.examples,
    this.id,
    this.shortDefinitions,
    this.subsenses,
    this.synonyms,
    this.thesaurusLinks,
    this.registers,
  });

  List<String> definitions;
  List<Example> examples;
  String id;
  List<String> shortDefinitions;
  List<Subsense> subsenses;
  List<Synonym> synonyms;
  List<ThesaurusLink> thesaurusLinks;
  List<LexicalCategory> registers;

  factory Sense.fromJson(Map<String, dynamic> json) => Sense(
    definitions: json["definitions"] == null ? null : List<String>.from(json["definitions"].map((x) => x)),
    examples: json["examples"] == null ? null : List<Example>.from(json["examples"].map((x) => Example.fromJson(x))),
    id: json["id"] == null ? null : json["id"],
    shortDefinitions: json["shortDefinitions"] == null ? null : List<String>.from(json["shortDefinitions"].map((x) => x)),
    subsenses: json["subsenses"] == null ? null : List<Subsense>.from(json["subsenses"].map((x) => Subsense.fromJson(x))),
    synonyms: json["synonyms"] == null ? null : List<Synonym>.from(json["synonyms"].map((x) => Synonym.fromJson(x))),
    thesaurusLinks: json["thesaurusLinks"] == null ? null : List<ThesaurusLink>.from(json["thesaurusLinks"].map((x) => ThesaurusLink.fromJson(x))),
    registers: json["registers"] == null ? null : List<LexicalCategory>.from(json["registers"].map((x) => LexicalCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "definitions": definitions == null ? null : List<dynamic>.from(definitions.map((x) => x)),
    "examples": examples == null ? null : List<dynamic>.from(examples.map((x) => x.toJson())),
    "id": id == null ? null : id,
    "shortDefinitions": shortDefinitions == null ? null : List<dynamic>.from(shortDefinitions.map((x) => x)),
    "subsenses": subsenses == null ? null : List<dynamic>.from(subsenses.map((x) => x.toJson())),
    "synonyms": synonyms == null ? null : List<dynamic>.from(synonyms.map((x) => x.toJson())),
    "thesaurusLinks": thesaurusLinks == null ? null : List<dynamic>.from(thesaurusLinks.map((x) => x.toJson())),
    "registers": registers == null ? null : List<dynamic>.from(registers.map((x) => x.toJson())),
  };
}

class Example {
  Example({
    this.text,
  });

  String text;

  factory Example.fromJson(Map<String, dynamic> json) => Example(
    text: json["text"] == null ? null : json["text"],
  );

  Map<String, dynamic> toJson() => {
    "text": text == null ? null : text,
  };
}

class LexicalCategory {
  LexicalCategory({
    this.id,
    this.text,
  });

  String id;
  String text;

  factory LexicalCategory.fromJson(Map<String, dynamic> json) => LexicalCategory(
    id: json["id"] == null ? null : json["id"],
    text: json["text"] == null ? null : json["text"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "text": text == null ? null : text,
  };
}

class Subsense {
  Subsense({
    this.definitions,
    this.examples,
    this.id,
    this.shortDefinitions,
  });

  List<String> definitions;
  List<Example> examples;
  String id;
  List<String> shortDefinitions;

  factory Subsense.fromJson(Map<String, dynamic> json) => Subsense(
    definitions: json["definitions"] == null ? null : List<String>.from(json["definitions"].map((x) => x)),
    examples: json["examples"] == null ? null : List<Example>.from(json["examples"].map((x) => Example.fromJson(x))),
    id: json["id"] == null ? null : json["id"],
    shortDefinitions: json["shortDefinitions"] == null ? null : List<String>.from(json["shortDefinitions"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "definitions": definitions == null ? null : List<dynamic>.from(definitions.map((x) => x)),
    "examples": examples == null ? null : List<dynamic>.from(examples.map((x) => x.toJson())),
    "id": id == null ? null : id,
    "shortDefinitions": shortDefinitions == null ? null : List<dynamic>.from(shortDefinitions.map((x) => x)),
  };
}

class Synonym {
  Synonym({
    this.language,
    this.text,
  });

  Language language;
  String text;

  factory Synonym.fromJson(Map<String, dynamic> json) => Synonym(
    language: json["language"] == null ? null : languageValues.map[json["language"]],
    text: json["text"] == null ? null : json["text"],
  );

  Map<String, dynamic> toJson() => {
    "language": language == null ? null : languageValues.reverse[language],
    "text": text == null ? null : text,
  };
}

enum Language { EN }

final languageValues = EnumValues({
  "en": Language.EN
});

class ThesaurusLink {
  ThesaurusLink({
    this.entryId,
    this.senseId,
  });

  String entryId;
  String senseId;

  factory ThesaurusLink.fromJson(Map<String, dynamic> json) => ThesaurusLink(
    entryId: json["entry_id"] == null ? null : json["entry_id"],
    senseId: json["sense_id"] == null ? null : json["sense_id"],
  );

  Map<String, dynamic> toJson() => {
    "entry_id": entryId == null ? null : entryId,
    "sense_id": senseId == null ? null : senseId,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
