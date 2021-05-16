import 'package:flash_gym/constants/app_constants.dart';
import 'package:flash_gym/widgets/data_tile.dart';
import 'package:flash_gym/widgets/date_widget.dart';
import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 3000));
    animation = Tween<double>(begin: 0.0, end: 0.89).animate(animationController)
    ..addListener(() => this.setState(() {}));
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: screenSize.height,
            width: screenSize.width,
            decoration: BoxDecoration(
              color: Color.fromRGBO(97, 46, 89, 1.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(kOtherPadding, kTopPadding, kOtherPadding, kOtherPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "Weekly Activity",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: "Barlow",
                    fontSize: 29.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    DateWidget(
                      weekday: "Mon",
                      date: 8,
                    ),
                    DateWidget(
                      weekday: "Tue",
                      date: 9,
                    ),
                    DateWidget(
                      weekday: "Wed",
                      date: 10,
                    ),
                    DateWidget(
                      weekday: "Thu",
                      date: 11,
                    ),
                    DateWidget(
                      weekday: "Fri",
                      date: 12,
                      isSelected: true,
                    ),
                    DateWidget(
                      weekday: "Sat",
                      date: 13,
                    ),
                    DateWidget(
                      weekday: "Sun",
                      date: 14,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                Text(
                  "Weekly Points",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: "Barlow",
                    fontSize: 28.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      height: 10.0,
                      decoration: BoxDecoration(
                        color: Theme.of(context).secondaryHeaderColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    Container(
                      height: 10.0,
                      width: (screenSize.width - kOtherPadding * 2) * animation.value,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "${(animation.value * 2000).toStringAsFixed(0)} pts",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontFamily: "Barlow",
                        fontWeight: FontWeight.w600,
                        fontSize: 17.0,
                      ),
                    ),
                    Text(
                      "2000 pts",
                      style: TextStyle(
                        color: Theme.of(context).secondaryHeaderColor,
                        fontFamily: "Barlow",
                        fontWeight: FontWeight.w600,
                        fontSize: 17.0,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                ),
                DataTile(),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                ),
                DataTile(
                  assetPath: "${PREFIX_IMAGE_PATH}playingball.png",
                  title: "Ball Exercise",
                  highlightedSub: "15 x",
                  normalSub: "",
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                ),
                DataTile(
                  assetPath: "${PREFIX_IMAGE_PATH}plumbing.png",
                  title: "Planking",
                  highlightedSub: "5",
                  normalSub: "min",
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                ),
                DataTile(
                  assetPath: "${PREFIX_IMAGE_PATH}pushingup.png",
                  title: "Push up",
                  highlightedSub: "20 x",
                  normalSub: "",
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FloatingActionButton(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Transform.scale(
                      scale: 1.5,
                      child: Icon(Icons.add),
                    ),
                    onPressed: () {},
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