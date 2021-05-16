import 'package:flash_gym/constants/app_constants.dart';
import 'package:flash_gym/screens/dashboard_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("${PREFIX_IMAGE_PATH}background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(screenSize.height * 0.125),
                ),
                Image.asset(
                  "${PREFIX_IMAGE_PATH}lightning.png",
                  scale: 2.0,
                ),
                Text(
                  "FLASH",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "JungleFever",
                    fontSize: 35.0,
                  ),
                ),
                Text(
                  "GYM",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: "JungleFever",
                    fontSize: 45.0,
                  ),
                ),
                Text(
                  "Get in shape quickly",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Barlow",
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(screenSize.height * 0.1),
                ),
                Container(
                  width: screenSize.width * BUTTON_WIDTH_RATIO,
                  height: screenSize.height * BUTTON_HEIGHT_RATIO,
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(BUTTON_BORDER_RADIUS),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Barlow",
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                Container(
                  width: screenSize.width * BUTTON_WIDTH_RATIO,
                  height: screenSize.height * BUTTON_HEIGHT_RATIO,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).secondaryHeaderColor,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(BUTTON_BORDER_RADIUS),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Barlow",
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onPressed: () { 
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DashboardPage(),
                      ));
                    }
                  ),
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}