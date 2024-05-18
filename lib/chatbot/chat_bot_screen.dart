// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:naukrified/chatbot/question_screen.dart';

class ChatBotScreen extends StatelessWidget {
  const ChatBotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorScheme.fromSeed(seedColor: Colors.greenAccent)
          .onPrimaryContainer
          .withOpacity(0.3),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          width: min(720, screenSize.width),
          child: QuestionScreen(),
        ),
      ),
    );
  }
}
