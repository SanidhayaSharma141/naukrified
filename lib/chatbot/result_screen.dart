// ignore_for_file: unnecessary_string_escapes, prefer_const_constructors

import 'dart:convert';
import 'dart:math';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

import 'question_data.dart';

class ResultScreen extends StatefulWidget {
  final QuestionData answers;

  const ResultScreen({super.key, required this.answers});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen>
    with TickerProviderStateMixin {
  late Future<ResultData> futureResult;
  late String systemString, userString;
  List<String> loadingPhrases = [
    'Working on it, one sec.',
    'I\'ll get back to you on that.',
    'Just a moment, please.',
    'Let me check on that.',
    'I\'m almost there.',
    'Hang tight.',
    'Coming right up.',
    'Well.. well that\'s interesting.',
    'I\'m on it.',
    'Be right back.',
    'Just a sec, I\'m buffering.'
  ];

  @override
  Widget build(BuildContext context) {
    final clrSchm = Theme.of(context).colorScheme; // color scheme

    return Scaffold(
      appBar: AppBar(
        title: const Text('Result Screen'),
      ),
      body: Center(
        child: FutureBuilder<ResultData>(
          future: futureResult,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  [
                    SpinKitPouringHourGlassRefined(
                        color: clrSchm.primary, size: 120),
                    SpinKitDancingSquare(color: clrSchm.primary, size: 120),
                    SpinKitSpinningLines(color: clrSchm.primary, size: 120),
                    SpinKitPulsingGrid(color: clrSchm.primary, size: 120)
                  ][Random().nextInt(4)],
                  const SizedBox(height: 10),
                  StreamBuilder<String>(
                    stream: Stream.periodic(
                        const Duration(seconds: 3),
                        (i) => loadingPhrases[
                            Random().nextInt(loadingPhrases.length)]),
                    builder: (context, snapshot) {
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: SizeTransition(
                                sizeFactor: animation,
                                axis: Axis.horizontal,
                                axisAlignment: -1,
                                child: child),
                          );
                        },
                        child: Text(
                          snapshot.data ??
                              loadingPhrases[
                                  Random().nextInt(loadingPhrases.length)],
                          key: ValueKey<String>(snapshot.data ??
                              loadingPhrases[
                                  Random().nextInt(loadingPhrases.length)]),
                          style: TextStyle(fontSize: 20),
                        ),
                      );
                    },
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Text("hello");
            }
          },
        ),
      ),
    );
  }
}

class ResultData {
  final Map<String, List<String>> result;

  ResultData({required this.result});

  factory ResultData.fromJson(String jsonString) {
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    Map<String, List<String>> resultMap = {};

    debugPrint('JsonMap: $jsonMap');

    jsonMap.forEach((key, value) {
      var splitValues = value.toString().split(',');
      var firstPart = splitValues[0].replaceAll('[', '');
      var secondPart =
          splitValues.sublist(1).join(',').trim().replaceAll(']', '');
      resultMap[key] = [firstPart, secondPart];
    });

    debugPrint('ResultMap: $resultMap');

    return ResultData(result: resultMap);
  }
}
