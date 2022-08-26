import 'package:avail_itech_hackfest/screens/about.dart';
import 'package:avail_itech_hackfest/screens/home/mainhomepage.dart';
import 'package:avail_itech_hackfest/screens/user_profile.dart';
import 'package:avail_itech_hackfest/utils/colors.dart';
import 'package:avail_itech_hackfest/utils/textstyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

import '../../utils/constants.dart';
import '../post_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ScreenHiddenDrawer> pages = [];
  bool isHome = true;

  @override
  void initState() {
    super.initState();

    pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              onTap: () {
                setState(() {
                  isHome = true;
                });
              },
              colorLineSelected: black,
              name: 'Homepage',
              selectedStyle: selectedText,
              baseStyle: textFieldTitle),
          const MainHomePage()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              colorLineSelected: black,
              onTap: () {
                setState(() {
                  isHome = false;
                });
              },
              name: 'Profile',
              selectedStyle: selectedText,
              baseStyle: textFieldTitle),
          const UserProfile()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              colorLineSelected: black,
              onTap: () {
                setState(() {
                  isHome = false;
                });
              },
              name: 'About',
              selectedStyle: selectedText,
              baseStyle: textFieldTitle),
          const Aboutpage()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
        initPositionSelected: 0,
        screens: pages,
        slidePercent: 40,
        actionsAppBar: [
          isHome
              ? Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PostForm()));
                    },
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://firebasestorage.googleapis.com/v0/b/avail-38482.appspot.com/o/add_post.png?alt=media&token=949efad9-626e-41eb-a3e9-addc663d200a",
                      height: 25,
                    ),
                  ),
                )
              : Container()
        ],
        backgroundColorAppBar: black,
        backgroundColorMenu: yellow);
  }
}
