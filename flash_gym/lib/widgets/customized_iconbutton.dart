import 'package:flutter/material.dart';

class CustomizedIconButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback onPressed;

  CustomizedIconButton({
    @required this.icon,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: onPressed,
      color: Theme.of(context).secondaryHeaderColor,
    );
  }
}