import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

//import 'original_chat.dart';
import 'chat_screen.dart';
import 'contact_row.dart';

ThemeData iosTheme = ThemeData(
    primarySwatch: Colors.orange,
    primaryColorDark: Colors.grey[100],
    primaryColorBrightness: Brightness.light);
ThemeData androidTheme = ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400],
);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: defaultTargetPlatform == TargetPlatform.iOS ? iosTheme:androidTheme  ,
      home: ChatScreen(),
    );
  }
}
