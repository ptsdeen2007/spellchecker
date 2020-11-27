import 'dart:convert';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:dictionary/Bloc/definition/definition_bloc.dart';
import 'package:dictionary/model/DefinitionM.dart';
import 'package:dictionary/ui/widget/lexical_entry_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefinitionScreen extends StatefulWidget {
  String word;

  DefinitionScreen({Key key, this.word}) : super(key: key);

  @override
  _DefinitionScreenState createState() => _DefinitionScreenState();
}

class _DefinitionScreenState extends State<DefinitionScreen> {
  DefinitionBloc definitionBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    definitionBloc = BlocProvider.of<DefinitionBloc>(context);
    definitionBloc.add(DefinitionFind(widget.word));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Definition"),
        centerTitle: true,
      ),
      body: BlocBuilder<DefinitionBloc, DefinitionState>(
        builder: (context, state) {
          if (state is DefinitionProgress) {
            return Center(child: CupertinoActivityIndicator());
          } else if (state is DefinitionSuccess) {
            DefinitionM definitionM = state.definitionM;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemBuilder: (context, position) {
                  LexicalEntry lexicalEntry=definitionM.results.first.lexicalEntries[position];
                  return LexicalEntryWidget(lexicalEntry,position);
                  // return Text("Lexical Entry");
                },
                itemCount: definitionM.results.first.lexicalEntries.length,
                // itemCount: 1,
              )

            );
          } else if (state is DefinitionError) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text("Un known state"));
          }
        },
      ),
    );
  }
}



class WordDetail extends StatelessWidget {
  LexicalEntry e;
  int position;

  WordDetail(
    this.e,
    this.position, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(e.entries.first.etymologies?.first ?? ""),
        // SizedBox(height: 10),
        // Text("Definition :",style: Theme.of(context).textTheme.subtitle2,),
        SizedBox(height: 10),
        Text(
            "${position + 1}. ${e.entries.first.senses.first.definitions.first}"),
        /* Text("Examples :",style: Theme.of(context).textTheme.subtitle2,),
        ListView.builder(itemBuilder: (context,position){
         var item= e.entries.first.senses[position];
          return Text("${item.id}");
        },itemCount: e.entries.first.senses.length,)*/
      ],
    );
  }
}
