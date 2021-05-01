import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String message;
  ChatMessage({
    @required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric( 
        vertical: 10.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: Flexible(
              child: CircleAvatar(
                child: Text("M"),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Minh",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(
                  message,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}