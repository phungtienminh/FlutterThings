import 'package:flutter/material.dart';
import 'package:meditate/constants/app_constants.dart';
import 'package:meditate/utils/utils.dart';

class HomePage extends StatelessWidget {
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
                  height: screenSize.height * 0.28,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Utils.assetPath("bg2.png")),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15.0,
              left: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 50.0),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "MEDITATION",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.only(
                    right: 30.0,
                  ),
                  child: Text(
                    "$DUMMY_TEXT",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 17.0,
                    ),
                  ),
                ),
                SizedBox(height: 100.0),
                Text(
                  " Recommended Playlist",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: screenSize.height * 0.27,
                      width: screenSize.width * 0.34,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Utils.assetPath("card2.png")),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 15.0),
                    Container(
                      height: screenSize.height * 0.27,
                      width: screenSize.width * 0.34,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Utils.assetPath("card3.png")),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Expanded(
                      child: Container(
                        height: screenSize.height * 0.27,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(Utils.assetPath("card4.png")),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Text(
                  " Top Creator",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  height: screenSize.height * 0.16,
                  width: screenSize.width * 0.7,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Utils.assetPath("card.png")),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}