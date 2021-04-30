import 'package:calculator/calculator_key.dart';
import 'package:calculator/http_client.dart';
import 'package:calculator/stream_client.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String expression = "0";
  bool justCalculated = false;

  void addCharacter(String character) {
    if (expression.length >= 15) return;

    setState(() {
      if (expression == "0" || expression == "Error!" || justCalculated) expression = "";
      expression += character;
      justCalculated = false;
    });
  }

  void delCharacter() {
    if (expression == null || expression.length == 0 || expression == "0") return;

    setState(() {
      if (expression == "Error!" || justCalculated) {
        expression = "0";
      } else {
        expression = expression.substring(0, expression.length - 1);
      }
      justCalculated = false;
    });
  }

  void clearText() {
    setState(() {
      expression = "0";
      justCalculated = false;
    });
  }

  Future<void> fetchResult() async {
    // perform a http request to get the answer
    String properExpression = expression.replaceAll("x", "*")
                                        .replaceAll("+", "%2B");
    var url = Uri.parse(HTTPClient.sharedInstance.baseURL + "?expr=$properExpression");

    StreamClient.sharedInstance.addValue(null);
    var response = await HTTPClient.sharedInstance.getRequest(url);
    
    StreamClient.sharedInstance.addValue(response);

    if (response == null) {
      setState(() {
        expression = "Error!";
      });

      return;
    }

    if (response.statusCode == 200) {
      var result = response.body;
      setState(() {
        expression = "$result";
      });

      justCalculated = true;
    } else {
      setState(() {
        expression = "Error!";
      });
    }
  }

  // For displaying circular progress indicator or expression
  Widget activityWidget(AsyncSnapshot snapshot) {
    if (snapshot.data != null) {
      return Align(
        alignment: Alignment.bottomRight,
        child: Text(
          expression,
          textDirection: TextDirection.ltr,
          style: TextStyle(
            color: Colors.white,
            fontSize: 35.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    } else {
      return Align(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: StreamClient.sharedInstance.stream,
      initialData: 0,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Calculator",
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0), // why did I code this? lol
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(2.0),
                        border: Border.all(
                          color: Colors.black12,
                          width: 1.0,
                        ),
                      ),
                      child: activityWidget(snapshot),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: CalculatorKey(
                          text: "7",
                          callback: () => addCharacter("7"),
                        ),
                      ),
                      Expanded(
                        child: CalculatorKey(
                          text: "8",
                          callback: () => addCharacter("8"),
                        ),
                      ),
                      Expanded(
                        child: CalculatorKey(
                          text: "9",
                          callback: () => addCharacter("9"),
                        ),
                      ),
                      Expanded(
                        child: CalculatorKey(
                          text: "DEL",
                          callback: () => delCharacter(),
                        ),
                      ),
                      Expanded(
                        child: CalculatorKey(
                          text: "AC",
                          keyColor: Colors.red,
                          textColor: Colors.white,
                          splashColor: Color.fromRGBO(186, 11, 2, 1.0),
                          callback: () => clearText(),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: CalculatorKey(
                          text: "4",
                          callback: () => addCharacter("4"),
                        ),
                      ),
                      Expanded(
                        child: CalculatorKey(
                          text: "5",
                          callback: () => addCharacter("5"),
                        ),
                      ),
                      Expanded(
                        child: CalculatorKey(
                          text: "6",
                          callback: () => addCharacter("6"),
                        ),
                      ),
                      Expanded(
                        child: CalculatorKey(
                          text: "+",
                          callback: () => addCharacter("+"),
                        ),
                      ),
                      Expanded(
                        child: CalculatorKey(
                          text: "-",
                          callback: () => addCharacter("-"),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: CalculatorKey(
                          text: "1",
                          callback: () => addCharacter("1"),
                        ),
                      ),
                      Expanded(
                        child: CalculatorKey(
                          text: "2",
                          callback: () => addCharacter("2"),
                        ),
                      ),
                      Expanded(
                        child: CalculatorKey(
                          text: "3",
                          callback: () => addCharacter("3"),
                        ),
                      ),
                      Expanded(
                        child: CalculatorKey(
                          text: "x",
                          callback: () => addCharacter("x"),
                        ),
                      ),
                      Expanded(
                        child: CalculatorKey(
                          text: "/",
                          callback: () => addCharacter("/"),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: CalculatorKey(
                          text: "0",
                          callback: () => addCharacter("0"),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: CalculatorKey(
                          text: ".",
                          callback: () => addCharacter("."),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: CalculatorKey(
                          text: "=",
                          keyColor: Colors.blue,
                          textColor: Colors.white,
                          splashColor: Color.fromRGBO(2, 112, 186, 1.0),
                          callback: () => fetchResult(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}