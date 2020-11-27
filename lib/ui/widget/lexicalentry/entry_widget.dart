import 'package:dictionary/model/DefinitionM.dart';
import 'package:dictionary/ui/widget/lexicalentry/entry/pronounciation_widget.dart';
import 'package:dictionary/ui/widget/lexicalentry/entry/sense/detail_array.dart';
import 'package:dictionary/ui/widget/lexicalentry/entry/sense_widget.dart';
import 'package:flutter/material.dart';

import 'entry/inflection_widget.dart';

class EntryWidget extends StatelessWidget {
  Entry entry;

  EntryWidget(this.entry);

  @override
  Widget build(BuildContext context) {
    // return Text("Okey");
    return ListView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: entry.pronunciations.length,
          itemBuilder: (context, position) {
            return  PronounciationWidget(entry.pronunciations[position]);
            // return Text("Pro count");
          },
        ),
        DetailArray(
          entry.etymologies,
          textStyle: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 12
          ),
        ),
        ListView.builder(
          itemBuilder: (context, position) {
            return SenseWidget(entry.senses[position]);
            // return Text("hello");
          },
          itemCount: entry.senses.length,
          shrinkWrap: true,
          physics: ScrollPhysics(),
        ),
        entry.inflections != null
            ? ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: entry.inflections.length,
                itemBuilder: (context, position) {
                  return InflectionWidget(entry.inflections[position]);
                })
            : Container()
      ],
    );
  }
}
