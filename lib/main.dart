import 'dart:math';

import 'package:flutter/material.dart';
import 'package:marth_game_v1/start_game_page.dart';
void main() {
  runApp( MainPage() );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartGamePage(),
    );
  }
}