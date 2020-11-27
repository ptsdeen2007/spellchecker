import 'package:dictionary/Bloc/typing/typing_bloc.dart';
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
      IconButton(icon: Icon(Icons.search), onPressed: () {
        Navigator.pop(context,query);
      }),
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
    print(query);
    bloc.add(TypingStarted(query));
    return StreamBuilder<TypingState>(
        stream: bloc.asBroadcastStream(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            List<String> items = (snapShot.data as TypingResult).listItems;
            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, postion) {
                  var item = items[postion];
                  return ListTile(
                    onTap: (){
                      Navigator.pop(context,item);
                    },
                    title: Text(item),
                  );
                });
          }
          return Container();
        });
  }
}
