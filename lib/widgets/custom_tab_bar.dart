import 'package:flutter/material.dart';

import '../config/palette.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isBottomIndication;

  const CustomTabBar({
    Key key,
    @required this.icons,
    @required this.selectedIndex,
    @required this.onTap,
    this.isBottomIndication = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
          border: isBottomIndication
              ? Border(
                  top: BorderSide(
                    color: Palette.facebookBlue,
                    width: 3.0,
                  ),
                )
              : Border(
                  bottom: BorderSide(
                    color: Palette.facebookBlue,
                    width: 3.0,
                  ),
                )),
      tabs: icons
          .asMap()
          .map((i, e) => MapEntry(
              i,
              Tab(
                icon: Icon(
                  e,
                  color: i == selectedIndex
                      ? Palette.facebookBlue
                      : Colors.black45,
                  size: 30.0,
                ),
              )))
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
