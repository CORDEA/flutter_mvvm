import 'package:flutter/material.dart';
import 'package:flutter_mvvm/api/stackexchange.dart';
import 'package:flutter_mvvm/repository/question.dart';
import 'package:flutter_mvvm/ui/home.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          Provider(create: (_) => StackExchangeApiClient()),
          Provider(create: (context) => QuestionRepository(context.read())),
        ],
        child: Home(),
      ),
    );
  }
}
