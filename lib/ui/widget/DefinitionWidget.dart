
import 'package:dictionary/model/DefinitionM.dart';
import 'package:flutter/material.dart';

import 'lexical_entry_widget.dart';

class DefinitionWidget extends StatelessWidget {
  const DefinitionWidget({
    Key key,
    @required this.definitionM,
  }) : super(key: key);

  final DefinitionM definitionM;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (context, position) {
            LexicalEntry lexicalEntry=definitionM.results.first.lexicalEntries[position];

            //to display all word definition by extracting json
            return LexicalEntryWidget(lexicalEntry,position);
          },
          itemCount: definitionM.results.first.lexicalEntries.length,
        )
    );
  }
}