import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:dictionary/Bloc/definition/definition_bloc.dart';
import 'package:dictionary/Bloc/search/search_bloc.dart';
import 'package:dictionary/Bloc/search/search_event.dart';
import 'package:dictionary/Bloc/typing/typing_bloc.dart';
import 'package:dictionary/ui/widget/speech_button.dart';
import 'package:dictionary/repositories/dictionaryApiClent.dart';
import 'package:dictionary/ui/definition_screen.dart';
import 'package:dictionary/ui/widget/WordSearchDeligate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LandScreen extends StatefulWidget {
  LandScreen({Key key}) : super(key: key);

  @override
  _LandScreenState createState() => _LandScreenState();
}

class _LandScreenState extends State<LandScreen> {
  // SearchBloc searchBloc;
  var tecSearchQuery = TextEditingController();

  var formKey = GlobalKey<FormState>();

  SearchBloc searchBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchBloc = BlocProvider.of<SearchBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    // final searchBloc = BlocProvider.of<SearchBloc>(context);
    return BlocListener<SearchBloc, SearchState>(
      listener: (context, state) {
        if (state is SearchSuccess) {
          openDefintionPage(tecSearchQuery.text);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: InkWell(
            child: Text("Dictionary"),
            onTap: () {
              openDefintionPage("this");
            },
          ),
          centerTitle: true,
        ),
        /*  floatingActionButton: FloatingActionButton(
          child: Text("Test"),
          onPressed: () {

            showSearch(context: context, delegate: WordSearchDeligate(bloc));
          },
        ),*/
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return Column(
                children: [
               /*   SizedBox(height: 50),
                  Form(
                    key: formKey,
                    child: TextFormField(
                      controller: tecSearchQuery,
                      autovalidateMode: AutovalidateMode.always,
                      decoration: InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.search),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.keyboard_voice_outlined),
                          onPressed: () {
                            print("Done");
                          },
                        ),
                        labelText: 'Write your words here',
                        filled: true,
                        contentPadding: EdgeInsets.all(4),
                        fillColor: Color(0xFFDBEDFF),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                      onFieldSubmitted: (text) {
                        print(text);
                      },
                      validator: (text) {
                        if (state is SearchError) {
                          return state.message;
                        } else if (state is SearchWrongText) {
                          return "Word not found";
                        }
                        return null;
                      },
                    ),
                  ),*/
                 SizedBox(height: 20,),
                 InkWell(
                   onTap: (){
                     TypingBloc bloc = TypingBloc();
                     showSearch(
                         context: context, delegate: WordSearchDeligate(bloc)).then((query){
                       if(query!=null && query.length>0){
                         openDefintionPage(query);
                       }
                     });
                   },
                   child: Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(25)),
                       color: Colors.lightBlue[50],
                       border: Border.all(color: Colors.black26,width: 1)
                     ),
                     child: Row(
                       children: [
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 12),
                           child: Icon(Icons.search),
                         ),
                         Text("Find word")
                       ],
                     ),
                   ),
                 ),
                  SizedBox(height: 20),
                /*  Align(
                    child: RaisedButton(
                      onPressed: state is SearchProgress
                          ? null
                          : () {
                              print(tecSearchQuery.text);
                              searchBloc.add(SearchNow(tecSearchQuery.text));
                            },
                      child: Text(state is SearchProgress
                          ? "Searching"
                          : "Search Word"),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),*/
                  state is SearchWrongText
                      ? Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Choose your words from the suggestions",
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                    itemCount: state.suggestions.length,
                                    itemBuilder: (context, postion) {
                                      var item = state.suggestions[postion];
                                      return InkWell(
                                        onTap: () {
                                          openDefintionPage(item);
                                        },
                                        child: Card(
                                          margin: EdgeInsets.all(2),
                                          child: ListTile(
                                            title: Text(item),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                        )
                      : Container()
                ],
              );
              /* return Center(
              child: Text("Done")
            );*/
            },
          ),
        ),
      ),
    );
  }

  void openDefintionPage(String text) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => DefinitionBloc(),
            child: DefinitionScreen(word: text),
          ),
        ));
  }
}
