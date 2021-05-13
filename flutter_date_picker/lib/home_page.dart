import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  double age = 0.0;
  int selectedYear;

  AnimationController animationController;
  Animation animation;

  void _showPicker() {
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(1900), 
      lastDate: DateTime.now(),
    ).then((dt) {
      setState(() {
        selectedYear = dt.year;
        age = (DateTime.now().year - selectedYear).toDouble();

        animationController.reset();

        animation = Tween<double>(begin: animation.value, end: age).animate(CurvedAnimation(
          parent: animationController, 
          curve: Curves.fastOutSlowIn,
        ));

        animationController.forward();
      });
    });
  }

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1500));
    animation = animationController;
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date Picker"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlineButton(
              child: Text(
                selectedYear == null ? "Choose your date of birth" : "$selectedYear",
                style: TextStyle(
                  color: Colors.brown,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: Colors.white,
              borderSide: BorderSide(
                color: Colors.brown,
                width: 3.0,
              ),
              onPressed: _showPicker,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
            ),
            AnimatedBuilder(
              animation: animation, 
              builder: (context, _) {
                return Text(
                  "Your age is ${animation.value.toStringAsFixed(0)}",
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}