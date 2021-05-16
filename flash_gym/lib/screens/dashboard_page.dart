import 'package:flash_gym/constants/app_constants.dart';
import 'package:flash_gym/screens/activity_page.dart';
import 'package:flash_gym/widgets/chart_card.dart';
import 'package:flash_gym/widgets/customized_iconbutton.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("${PREFIX_IMAGE_PATH}background2.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(kOtherPadding, kTopPadding, kOtherPadding, kOtherPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "Hello",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Barlow",
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Minh",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Barlow",
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                Text(
                  "How are you doing?",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: "Barlow",
                    fontSize: 29.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                ),
                Text(
                  "Daily activity",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Barlow",
                    fontSize: 24.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                ),
                CustomizedCard(
                  title: 3680,
                  subtitle: "steps",
                  chartPath: "${PREFIX_IMAGE_PATH}bar.png",
                  activityPath: "${PREFIX_IMAGE_PATH}foot.png",
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                ),
                CustomizedCard(
                  title: 90,
                  subtitle: "bpm",
                  chartPath: "${PREFIX_IMAGE_PATH}wave.png",
                  activityPath: "${PREFIX_IMAGE_PATH}heart.png",
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                ),
                CustomizedCard(
                  title: 960,
                  subtitle: "calories",
                  chartPath: "${PREFIX_IMAGE_PATH}bar.png",
                  activityPath: "${PREFIX_IMAGE_PATH}fire.png",
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "GOOD",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontFamily: "Barlow",
                              fontSize: 45.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Performance",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Barlow",
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      VerticalDivider(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Theme.of(context).primaryColor,
                          ),
                          Icon(
                            Icons.star,
                            color: Theme.of(context).primaryColor,
                          ),
                          Icon(
                            Icons.star,
                            color: Theme.of(context).primaryColor,
                          ),
                          Icon(
                            Icons.star,
                            color: Theme.of(context).primaryColor,
                          ),
                          Icon(
                            Icons.star,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(screenSize.height * 0.05),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CustomizedIconButton(
                      icon: Icon(Icons.home), 
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ActivityPage(),
                        ));
                      },
                    ),
                    CustomizedIconButton(
                      icon: Icon(Icons.person),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ActivityPage(),
                        ));
                      },
                    ),
                    CustomizedIconButton(
                      icon: Icon(Icons.timer),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ActivityPage(),
                        ));
                      },
                    ),
                    CustomizedIconButton(
                      icon: Icon(Icons.notification_important),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ActivityPage(),
                        ));
                      },
                    ),
                    CustomizedIconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ActivityPage(),
                        ));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}