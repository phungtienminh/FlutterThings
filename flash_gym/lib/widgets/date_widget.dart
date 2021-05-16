import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  final String weekday;
  final int date;
  final bool isSelected;

  DateWidget({
    this.weekday,
    this.date,
    this.isSelected: false,
  });

  Widget columnWidget(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "$weekday",
          style: TextStyle(
            color: !isSelected ? Theme.of(context).secondaryHeaderColor : Colors.white,
            fontFamily: "Barlow",
            fontSize: 14.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
        ),
        Text(
          "$date",
          style: TextStyle(
            color: !isSelected ? Theme.of(context).secondaryHeaderColor : Colors.white,
            fontFamily: "Barlow",
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return !isSelected 
      ? columnWidget(context) 
      : Container(
          padding: const EdgeInsets.all(8.0),
          child: columnWidget(context),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 3.0,
                blurRadius: 3.0,
              ),
            ],
          ),
        );
  }
}