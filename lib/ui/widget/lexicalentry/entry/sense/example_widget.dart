import 'package:dictionary/model/DefinitionM.dart';
import 'package:flutter/material.dart';

class ExampleWidget extends StatelessWidget {
  List<Example> examples;

  ExampleWidget(this.examples);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: examples?.length??0,
        itemBuilder: (context, postion) {
          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: RichText(
                text: TextSpan(
                  text: "${postion + 1}. ",
                  style: TextStyle(color: Colors.black87),
                  children:[
                    TextSpan(text:"${examples[postion].text}",style: TextStyle(
                      color: Colors.amber[600],
                      fontStyle: FontStyle.italic,
                    ))
                  ]
                ),
              )
              );
        });
  }
}
