import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/question.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var sco = 0;
  var n = 0;
  List ques = [
    question(
        que: "There are two parts of the body that can't heal themselves?",
        ans: false),
    question(
        que:
            "Serena Williams has one more singles tennis Grand Slam titles than sister Venus?",
        ans: true),
    question(que: "Alexander Fleming discovered penicillin", ans: true),
    question(
        que: "A lion's roar can be heard up to eight kilometres away",
        ans: true),
    question(que: "There are five different blood groups", ans: false),
  ];
  void che(bool choice, BuildContext cntx) {
    if (choice == ques[n].ans) {
      sco += 1;
      Scaffold.of(cntx).showSnackBar(SnackBar(
          content: Text("Correct Answer..."),
          duration: Duration(milliseconds: 500),
          backgroundColor: Colors.green));
    } else {
      Scaffold.of(cntx).showSnackBar(SnackBar(
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          child: Text("Wrong Answer..."),
        ),
        backgroundColor: Colors.red,
        duration: Duration(milliseconds: 500),
      ));
    }
    setState(() {
      if (n < ques.length - 1) {
        n = n + 1;
      } else {
        Scaffold.of(cntx)
            .showSnackBar(SnackBar(content: Text('quiz completed $sco/4')));
        reset();
      }
    });
  }

  void reset() {
    setState(() {
      n = 0;
      sco = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'quiz_app',
          style: TextStyle(
              color: Colors.black,
              wordSpacing: 2.0,
              fontSize: 25.0,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 10.0,
        backgroundColor: Colors.tealAccent,
        actions: [
          IconButton(
              icon: Icon(Icons.more_vert, color: Colors.black),
              onPressed: () {})
        ],
      ),
      body: Builder(
        builder: (cntx) => Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Score:$sco/4",
                    style: TextStyle(
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      reset();
                    },
                    child: Text(
                      "Reset",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 75.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Colors.brown,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ques[n].que,
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    elevation: 15.0,
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () => che(true, cntx),
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Text(
                      'True',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0),
                    ),
                  ),
                  RaisedButton(
                    elevation: 15.0,
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () => che(false, cntx),
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Text(
                      'False',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
