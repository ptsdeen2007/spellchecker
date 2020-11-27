import 'package:dictionary/Bloc/search/search_bloc.dart';
import 'package:dictionary/ui/widget/speech_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ui/land_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          )
      ),
     /* home: BlocProvider(
       create: (_)=>SearchBloc(),
        child: LandScreen(),
      ),*/
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>SearchBloc())
        ],
        child: LandScreen(),
      ),
      // home: SpeechButton(),
    );
  }
}
