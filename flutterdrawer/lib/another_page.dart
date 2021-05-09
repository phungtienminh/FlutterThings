import 'dart:io';
import 'package:flutter/material.dart';

class AnotherPage extends StatelessWidget {
  final String title;
  AnotherPage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        elevation: Platform.isAndroid ? 5.0 : 0.0,
      ),
      body: PageBody(title: title),
    );
  }
}

class PageBody extends StatelessWidget {
  final String title;
  PageBody({this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          RaisedButton(
            color: Colors.redAccent,
            child: Text(
              "$title",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () => Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text("You pressed a button"),
              ),
            ),
          ),
          RaisedButton(
            color: Colors.blueAccent,
            child: Text(
              "Show alert dialog",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () => showDialog(
              context: context,
              child: AlertDialog(content: Text("You pressed a blue button")),
            ),
          ),
          Stepper(
            steps: <Step>[
              Step(
                title: Text("Step 1"),
                content: Text("Step 1 content"),
                subtitle: Text("Step 1 subtitle"),
                isActive: true,
                state: StepState.complete,
              ),
              Step(
                title: Text("Step 2"),
                content: Text("Step 2 content"),
                isActive: false,
                state: StepState.error,
              ),
              Step(
                title: Text("Step 3"),
                content: Text("Step 3 content"),
                subtitle: Text("Step 3 subtitle"),
                isActive: false,
              ),
            ],
          ),
        ],
      ),
    );  
  }
}