
import 'package:flutter/material.dart';
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
      home: LandScreen(),
      // home: SpeechButton(),
    );
  }
}
