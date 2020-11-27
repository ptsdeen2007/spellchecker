import 'package:dictionary/model/DefinitionM.dart';
import 'package:dictionary/ui/widget/lexicalentry/entry/pronounciation_widget.dart';
import 'package:flutter/material.dart';

class InflectionWidget extends StatelessWidget {
  Inflection inflections;


  InflectionWidget(this.inflections);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          inflections.grammaticalFeatures!=null?RichText(text: TextSpan(
            text: "${inflections.grammaticalFeatures.first.text} ",
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(text: "(${inflections.grammaticalFeatures.first.type}) : "),
              TextSpan(text: inflections.inflectedForm,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            ]
          )):Container(),
          ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, position) {
              return PronounciationWidget(inflections.pronunciations[position]);
            },
            itemCount: inflections.pronunciations?.length??0,
          )
        ],
      ),
    );
  }
}
