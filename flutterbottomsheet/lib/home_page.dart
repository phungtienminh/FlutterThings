import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  VoidCallback _showPersBottomSheet;

  @override
  void initState() {
    super.initState();
    _showPersBottomSheet = _showPersistent;
  }

  void _showPersistent() {
    setState(() {
      _showPersBottomSheet = null;
    });

    _scaffoldKey.currentState.showBottomSheet((context) {
      return Container(
        color: Colors.greenAccent,
        child: Center(
          child: Text(
            "Persistent Sheet",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
    }).closed
      .whenComplete(() {
        if (mounted) {
          setState(() {
            _showPersBottomSheet = _showPersistent;
          });
        }
      });
  }

  void _showModal() {
    showModalBottomSheet(
      context: context, 
      builder: (builder) {
        return Container(
          color: Colors.greenAccent,
          height: MediaQuery.of(context).size.height / 2,
          child: Center(
            child: Text(
              "Modal Sheet",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Bottom Sheet"),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                color: Colors.greenAccent,
                child: Text(
                  "Persistent",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: _showPersBottomSheet,
              ),
              RaisedButton(
                color: Colors.blueAccent,
                child: Text(
                  "Modal",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: _showModal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}