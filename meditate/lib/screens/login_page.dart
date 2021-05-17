import 'package:flutter/material.dart';
import 'package:meditate/constants/app_constants.dart';
import 'package:meditate/screens/tab_page.dart';
import 'package:meditate/utils/utils.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  AnimationController animationController, animationController2, animationController3, animationController4;
  Animation animation, animation2, animation3, animation4;
  bool completedAnimation = false;

  Future<void> prepareAnimation() async {
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    animationController2 = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    animationController3 = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    animationController4 = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));

    animation = Tween<double>(begin: 0.0, end: 1.0).animate(animationController)
    ..addListener(() => this.setState(() {}));

    animationController.forward();
    
    // Wait for 1.5 seconds
    await Future.delayed(
      const Duration(milliseconds: 1500),
    ).then((value) {
      animation2 = Tween<double>(begin: 0.0, end: 1.0).animate(animationController2)
      ..addListener(() => this.setState(() {}));

      animationController2.forward();
    });

    await Future.delayed(
      const Duration(milliseconds: 1500),
    ).then((value) {
      animation3 = Tween<double>(begin: 0.0, end: 1.0).animate(animationController3)
      ..addListener(() => this.setState(() {}));

      animationController3.forward();
    });

    await Future.delayed(
      const Duration(milliseconds: 1500),
    ).then((value) {
      animation4 = Tween<double>(begin: 0.0, end: 1.0).animate(animationController4)
      ..addListener(() => this.setState(() {}));

      animationController4.forward();
    });

    setState(() {
      completedAnimation = true;  
    });
  }

  @override
  void initState() {
    super.initState();
    prepareAnimation();
  }

  @override
  void dispose() {
    animationController.dispose();
    animationController2.dispose();
    animationController3.dispose();
    super.dispose();
  }

  Widget loginForm(Size screenSize) {
    return Container(
      height: screenSize.height * 0.38,
      padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Opacity(
        opacity: animation4 != null ? animation4.value : 0.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: "Email",
                contentPadding: const EdgeInsets.all(20.0),
                suffixIcon: Icon(Icons.mail),
                fillColor: Colors.grey[300],
                filled: true,
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: Colors.grey[300],
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                contentPadding: const EdgeInsets.all(20.0),
                suffixIcon: Icon(Icons.lock),
                fillColor: Colors.grey[300],
                filled: true,
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: Colors.grey[300],
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Container(
              height: 60.0,
              child: RaisedButton(
                elevation: 0.0,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                color: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                onPressed: () {
                  if (completedAnimation) {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TabPage(),
                    ));
                  }
                },
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              "Don't have an account yet?",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: 18.0,
              ),
            ),
            FlatButton(
              child: Text(
                "Create an account",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = Utils.getScreenSize(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Transform.scale(
                scale: 1.1,
                child: Container(
                  height: screenSize.height * 0.7,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Utils.assetPath("bg.png")),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                height: screenSize.height * 0.04,
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: screenSize.height * 0.28),
                Opacity(
                  opacity: animation != null ? animation.value : 0.0,
                  child: Text(
                    "MEDITATE",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 62.0,
                    ),
                  ),
                ),
                Opacity(
                  opacity: animation2 != null ? animation2.value : 0.0,
                  child: Text(
                    "Meditation App",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 35.0,
                    ),
                  ),
                ),
                Opacity(
                  opacity: animation3 != null ? animation3.value : 0.0,
                  child: Text(
                    "$DUMMY_TEXT",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                loginForm(screenSize),
              ],
            ),
          ),
        ],
      ),
    );
  }
}