import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../config/palette.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final bool hasBorder;

  const ProfileAvatar({
    Key key,
    @required this.imageUrl,
    this.hasBorder = false,
    this.isActive = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Palette.facebookBlue,
          child: CircleAvatar(
            radius: hasBorder ? 17.0 : 20.0,
            backgroundColor: Colors.grey[200],
            backgroundImage: CachedNetworkImageProvider(
              imageUrl,
            ),
          ),
        ),
        isActive
            ? Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 15.0,
                  height: 15.0,
                  decoration: BoxDecoration(
                    color: Palette.online,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
