import 'package:flash_gym/constants/app_constants.dart';
import 'package:flutter/material.dart';

class CustomizedCard extends StatefulWidget {
  int title = 0;
  String subtitle = "";
  String chartPath = "";
  String activityPath = "";
  AnimationController animationController;
  Animation animation;

  CustomizedCard({
    this.title: 3680,
    this.subtitle: "steps",
    this.chartPath: "${PREFIX_IMAGE_PATH}bar.png",
    this.activityPath: "${PREFIX_IMAGE_PATH}foot.png",
  });

  @override
  _CustomizedCardState createState() => _CustomizedCardState();
}

class _CustomizedCardState extends State<CustomizedCard> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    widget.animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 3000));
    widget.animation = IntTween(begin: 0, end: widget.title).animate(CurvedAnimation(
      parent: widget.animationController,
      curve: Curves.fastOutSlowIn,
    ))
    ..addListener(() => this.setState(() {}));

    widget.animationController.forward();
  }

  @override
  void dispose() {
    widget.animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * CARD_HEIGHT_RATIO,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(CARD_BORDER_RADIUS),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2.0,
            spreadRadius: 5.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  "${widget.animation.value}",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: "Barlow",
                    fontSize: 35.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "${widget.subtitle}",
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: "Barlow",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            flex: 35,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  widget.chartPath,
                  scale: 2.5,
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            flex: 15,
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  Image.asset(
                    widget.activityPath,
                    scale: 8.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}