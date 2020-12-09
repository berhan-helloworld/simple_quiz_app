import 'package:flutter/material.dart';
import 'package:flutter_quiz/provider/quiz_state.dart';
import 'package:flutter_quiz/provider/score_provider.dart';
import 'package:flutter_quiz/screens/home/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScoreProvider()),
        //ChangeNotifierProvider(create: (_) => QuizState()),
      ],
      child: MaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.white,
            scaffoldBackgroundColor: Colors.white70),
      ),
    );
  }
}
