import 'package:dictionary/Bloc/typing/typing_bloc.dart';
import 'package:dictionary/model/DefinitionM.dart';
import 'package:dictionary/ui/widget/DefinitionWidget.dart';
import 'package:dictionary/ui/widget/speech_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WordSearchDeligate extends SearchDelegate {
  TypingBloc bloc;

  WordSearchDeligate(this.bloc);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      SpeechButton(
        onTextChange: (text) {
          query = text;
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //passing new query event
    bloc.add(TypingStarted(query));

    return StreamBuilder<TypingState>(
        stream: bloc.asBroadcastStream(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            //for misspelled word suggestions will came here
            if (snapShot.data is TypingResult) {
              List<String> items = (snapShot.data as TypingResult).listItems;
              print("Snap ${items}");
              return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, postion) {
                    var item = items[postion];
                    return ListTile(
                      onTap: () {
                        bloc.add(TypingWordSelected(item));
                      },
                      title: Text(item),
                    );
                  });
            }
            //for correct spelled word, word definition will came here
            else if (snapShot.data is TypingDefinition) {
              DefinitionM definitionM =
                  (snapShot.data as TypingDefinition).definitionM;
              return DefinitionWidget(definitionM: definitionM);
            } else if (snapShot.data is TypingProgress) {
              return Center(
                child: Text("Please Wait"),
              );
            } else if (snapShot.data is TypingError) {
              return Center(
                child: Padding(
                  padding:EdgeInsets.all(8),
                  child: Text((snapShot.data as TypingError).message)
                ),
              );
            }
          }
          return Container();
        });
  }
}
