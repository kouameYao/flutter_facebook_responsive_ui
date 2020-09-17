import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/widgets/post_container.dart';
import 'package:flutter_facebook_responsive_ui/widgets/rooms.dart';
import 'package:flutter_facebook_responsive_ui/widgets/stories.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/palette.dart';
import '../data/data.dart';
import '../models/models.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Text(
              "facebook",
              style: TextStyle(
                  color: Palette.facebookBlue,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2),
            ),
            centerTitle: false,
            floating: true,
            actions: <Widget>[
              CircleButton(
                icon: Icons.search,
                iconSize: 30.0,
                onPressed: () => print("search"),
              ),
              CircleButton(
                icon: MdiIcons.facebookMessenger,
                iconSize: 30.0,
                onPressed: () => print("Massenger"),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: CreatePostContainer(currentUser: currentUser),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Rooms(onlineUsers: onlineUsers),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Stories(
                currentUser: currentUser,
                stories: stories,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              final Post post = posts[index];
              return PostContainer(post: post);
            },
            childCount: posts.length,
          ))
        ],
      ),
    );
  }
}
