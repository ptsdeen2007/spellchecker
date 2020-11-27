import 'package:dictionary/model/DefinitionM.dart';
import 'package:flutter/material.dart';

import '../sense_widget.dart';

class SubSenseWidget extends StatelessWidget {
  List<Subsense> subsenses;

  SubSenseWidget(this.subsenses);

  @override
  Widget build(BuildContext context) {
    return subsenses!=null?ListView.builder(
      shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: subsenses.length,
        itemBuilder: (context, posistion) {
          // return Text("Subsense ***************************");
      return SenseWidget(subsenses[posistion]);
    }):Container();
  }
}
