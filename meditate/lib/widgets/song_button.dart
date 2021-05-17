import 'package:flutter/material.dart';
import 'package:meditate/utils/utils.dart';

class SongButton extends StatelessWidget {
  final String imageName;
  final Color color, splashColor;
  final VoidCallback onPressed;

  SongButton({
    this.imageName,
    this.color,
    this.splashColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: color,
        image: DecorationImage(
          image: AssetImage(Utils.assetPath(imageName)),
          fit: BoxFit.cover,
        ),
      ),
      child: Opacity(
        opacity: 0.1,
        child: RaisedButton(
          elevation: 0.0,
          splashColor: splashColor,
          onPressed: onPressed,
        ),
      ),
    );
  }
}