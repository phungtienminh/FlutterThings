import 'package:flutter/material.dart';
import 'package:meditate/utils/objects/song.dart';
import 'package:meditate/utils/utils.dart';
import 'package:meditate/widgets/song_button.dart';
import 'package:meditate/widgets/song_tile.dart';

//ignore: must_be_immutable
class PlaylistPage extends StatefulWidget {
  @override
  _PlaylistPageState createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  List<Song> songs = List<Song>();

  @override
  void initState() {
    songs.add(Song(name: "Summer Romance", author: "Ezra Queens", songLength: "18:42"));
    songs.add(Song(name: "Moonlight Sonata", author: "Sherina Landorf", songLength: "22:16"));
    songs.add(Song(name: "Intergalacting Song", author: "Kayleigh Coleman", songLength: "36:21"));
    songs.add(Song(name: "Hymn of the Forest", author: "Ultimusica Studio", songLength: "42:38"));
    super.initState();
  }

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
                  height: screenSize.height * 0.45,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Utils.assetPath("bg3.png")),
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
          Container(
            /*
            the column will not center horizontally without this container expanding the entire screen
            maybe the TabBarView harms the integrity of the whole design and indentation?
            */
            height: screenSize.height,
            width: screenSize.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 50.0),
                Text(
                  "NOW PLAYING",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 30.0),
                Text(
                  "Heartfelt Melody",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 22.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  "Orchestra Studio",
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "09:45",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                      ),
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.orange,
                        inactiveTrackColor: Colors.black,
                        thumbColor: Colors.orange,
                      ),
                      child: Container(
                        width: screenSize.width * 0.67,
                        child: Slider(
                          min: 0.0,
                          max: 1.0,
                          value: 0.45,
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    Text(
                      "21:07",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenSize.height * 0.16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SongButton(
                      imageName: "backward.png",
                      color: Colors.green,
                      splashColor: Colors.red,
                      onPressed: () {}, // opposite color of green
                    ),
                    SongButton(
                      imageName: "pause.png",
                      color: Colors.orange,
                      splashColor: Colors.blue,
                      onPressed: () {}, // opposite color of orange
                    ),
                    SongButton(
                      imageName: "forward.png",
                      color: Colors.green,
                      splashColor: Colors.red,
                      onPressed: () => print(songs.length),
                    ),
                  ],
                ),
                SizedBox(height: 30.0),
                Text(
                  "Other Audio in the Playlist",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 22.0,
                  ),
                ),
                SizedBox(height: 20.0),
                Divider(height: 1.0),
                Flexible(
                  child: ListView.separated(
                    itemBuilder: (context, index) => SongTile(
                      title: songs[index].name,
                      subtitle: "${songs[index].author} | ${songs[index].songLength}",
                    ), 
                    separatorBuilder: (context, index) => Divider(height: 1.0), 
                    itemCount: songs.length,
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