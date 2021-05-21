import 'package:flutter/material.dart';
import 'package:quizzler/questions.dart';
import 'package:quizzler/solutions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Quiz App',
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Icon> count = [];
  int current = 0;
  int score = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      questions[current],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              // TRUE

              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: Text(
                      'True',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      debugPrint('true');
                      debugPrint('$current');
                      setState(() {
                        if (current < 6) {
                          // current = current + 1;
                          current++;
                        } else {
                          Alert(
                            context: context,
                            type: AlertType.success,
                            title: "Total score is $score",
                            // desc: "",
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "COOL.",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () {
                                  setState(() {
                                    current = 0;
                                    count = [];
                                    score = 0;
                                  });
                                  Navigator.pop(context);
                                },
                                width: 220,
                              ),
                            ],
                          ).show();
                        }
                        if (solutions[current]) {
                          setState(() {
                            score = score + 1;
                          });
                          count.add(trueWidget());
                        } else {
                          count.add(wrongWidget());
                        }
                      });
                      // User picked true.
                    },
                  ),
                ),
              ),

              // FALSE

              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: Text(
                      'False',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      debugPrint('false');
                      debugPrint('$current');
                      setState(() {
                        if (current < 6) {
                          // current = current + 1;
                          current++;
                        } else {
                          Alert(
                            context: context,
                            type: AlertType.success,
                            title: "Total score is $score",
                            // desc: "",
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "COOL.",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () {
                                  setState(() {
                                    current = 0;
                                    count = [];
                                    score = 0;
                                  });
                                  Navigator.pop(context);
                                },
                                width: 120,
                              )
                            ],
                          ).show();
                        }
                        if (solutions[current]) {
                          count.add(wrongWidget());
                        } else {
                          setState(() {
                            score = score + 1;
                          });
                          count.add(trueWidget());
                        }
                      });
                      // User picked false.
                    },
                  ),
                ),
              ),
              Row(
                children: count,
              ),
              // Add a Row here as your score keeper
            ],
          ),
/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
        ),
      ),
    );
  }
}
