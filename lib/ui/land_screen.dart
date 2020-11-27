
import 'package:dictionary/Bloc/typing/typing_bloc.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final searchBloc = BlocProvider.of<SearchBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Spell Checker"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                TypingBloc bloc = TypingBloc();
                //to open word entry screen
                showSearch(context: context, delegate: WordSearchDeligate(bloc));
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
                    Text("Type your word here")
                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }

}
