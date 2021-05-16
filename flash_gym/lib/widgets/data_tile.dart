import 'package:flash_gym/constants/app_constants.dart';
import 'package:flutter/material.dart';

class DataTile extends StatefulWidget {
  String assetPath, title, highlightedSub, normalSub;

  DataTile({
    this.assetPath: "${PREFIX_IMAGE_PATH}walking.png",
    this.title: "Running",
    this.highlightedSub: "30",
    this.normalSub: "min",
  });

  @override
  _DataTileState createState() => _DataTileState();
}

class _DataTileState extends State<DataTile> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: screenSize.height * 0.098,
          width: screenSize.width * 0.2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1.0,
                blurRadius: 1.0,
              ),
            ],
          ),
          child: Transform.scale(
            scale: 1.25,
            child: Image.asset(
              widget.assetPath,
            ),
          ),
        ),
        SizedBox(width: 15.0),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "${widget.title}",
                style: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontFamily: "Barlow",
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: widget.highlightedSub,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontFamily: "Barlow",
                        fontWeight: FontWeight.w500,
                        fontSize: 35.0,
                      ),
                    ),
                    TextSpan(
                      text: widget.normalSub,
                      style: TextStyle(
                        color: Theme.of(context).secondaryHeaderColor,
                        fontFamily: "Barlow",
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 20.0),
        Icon(
          Icons.timer,
          color: Theme.of(context).secondaryHeaderColor,
        ),
        SizedBox(width: 15.0),
        Icon(
          Icons.bookmark,
          color: Theme.of(context).secondaryHeaderColor,
        ),
        SizedBox(width: 15.0),
        Icon(
          Icons.star,
          color: Theme.of(context).secondaryHeaderColor,
        ),
      ],
    );
  }
}