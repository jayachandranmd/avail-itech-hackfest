import 'package:avail_itech_hackfest/screens/home/mainhomepage.dart';
import 'package:avail_itech_hackfest/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({Key? key}) : super(key: key);

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> pages = [];

  @override
  void initState() {
    super.initState();

    pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'Homepage',
              selectedStyle: const TextStyle(),
              baseStyle: const TextStyle()),
          const MainHomePage()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
        initPositionSelected: 0,
        screens: pages,
        slidePercent: 30,
        backgroundColorMenu: yellow);
  }
}
