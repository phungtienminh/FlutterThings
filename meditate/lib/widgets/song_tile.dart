import 'package:flutter/material.dart';
import 'package:meditate/widgets/song_button.dart';

class SongTile extends StatelessWidget {
  final String title, subtitle;
  SongTile({
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: ListTile(
        leading: SongButton(
          imageName: "play.png",
          color: Colors.orange,
          splashColor: Colors.blue,
          onPressed: () {},
        ),
        title: Text(
          "$title",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 20.0,
          ),
        ),
        subtitle: Text(
          "$subtitle",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}