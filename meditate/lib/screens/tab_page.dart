import 'package:flutter/material.dart';
import 'package:meditate/screens/home_page.dart';
import 'package:meditate/screens/playlist_page.dart';

import 'package:meditate/utils/utils.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          HomePage(),
          PlaylistPage(),
          PlaylistPage(),
          PlaylistPage(),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.orange,
        child: TabBar(
          controller: tabController,
          tabs: <Widget>[
            Tab(
              icon: Transform.rotate(
                angle: Utils.toRadian(degree: 30.0),
                child: Icon(Icons.music_note),
              ),
            ),
            Tab(
              icon: Icon(Icons.video_library),
            ),
            Tab(
              icon: Icon(Icons.favorite),
            ),
            Tab(
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}