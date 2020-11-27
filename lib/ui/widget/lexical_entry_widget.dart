import 'package:dictionary/model/DefinitionM.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'lexicalentry/entry_widget.dart';

class LexicalEntryWidget extends StatelessWidget {
  LexicalEntry lexicalEntry;
  int position;

  LexicalEntryWidget(this.lexicalEntry, this.position);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Text(
                lexicalEntry.text,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: Colors.black),
              ),
              Align(
                child: Text("${position + 1}"),
              ),
              SizedBox(
                width: 10,
              ),
              Text("(${lexicalEntry.lexicalCategory.text})")
            ],
          ),
        ),
        ListView.builder(
          itemCount: lexicalEntry.entries.length,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, position) {
            return EntryWidget(lexicalEntry.entries[position]);
            // return Text("Done");
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "Phrases",
            style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 18),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemBuilder: (context, position) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: RichText(
                text: TextSpan(
                  text: "${position + 1}. ",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: lexicalEntry.phrases[position].text,
                      style: TextStyle(color: Colors.lightBlue),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: lexicalEntry.phrases?.length??0,
        )
      ],
    );
  }
}
