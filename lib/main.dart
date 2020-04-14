import 'package:flutter/material.dart';
import 'widget/voting_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Voting App",
      home: VotingApp(),
    );
  }
}