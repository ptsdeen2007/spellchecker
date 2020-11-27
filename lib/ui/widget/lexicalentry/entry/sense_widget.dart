import 'package:dictionary/model/DefinitionM.dart';
import 'package:dictionary/ui/widget/lexicalentry/entry/sense/detail_array.dart';
import 'package:dictionary/ui/widget/lexicalentry/entry/sense/example_widget.dart';
import 'package:dictionary/ui/widget/lexicalentry/entry/sense/sub_sense_widget.dart';

import 'package:flutter/material.dart';

class SenseWidget extends StatelessWidget {
  var sense;

  SenseWidget(this.sense);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: [
        DetailArray(sense.definitions,textStyle: TextStyle(fontWeight: FontWeight.bold),),
        ExampleWidget(sense.examples),
        sense is Sense? SubSenseWidget(sense.subsenses):Container(),
      ],
    );
  }
}
