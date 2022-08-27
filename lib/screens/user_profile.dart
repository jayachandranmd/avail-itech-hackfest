import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/textstyle.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .get(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      'assets/images/shape.png',
                      width: double.infinity,
                    ),
                    Positioned(
                      top: 50,
                      left: MediaQuery.of(context).size.width / 2 - 50,
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/avail-38482.appspot.com/o/profile.png?alt=media&token=6bb09fcb-2e37-42f6-90e5-a8651a2f1b71',
                        height: 110,
                      ),
                    ),
                    Positioned(
                        top: 130,
                        left: MediaQuery.of(context).size.width / 1.7,
                        child: Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: yellow),
                            child: Icon(
                              Icons.camera_alt,
                              color: black,
                              size: 20,
                            ))),
                  ],
                ),
                sBoxH60,
                sBoxH20,
                Center(
                  child: Text(
                    snapshot.data['firstName'],
                    style: username,
                  ),
                ),
                sBoxH30,
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 3.5,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: white,
                    border: Border.all(color: yellow),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/avail-38482.appspot.com/o/NGO_Tag.png?alt=media&token=3a0ca98d-c0f1-423f-9a2a-89e2a552f551',
                        height: 25,
                      ),
                      sBoxW10,
                      const Text('NGO',
                          style: TextStyle(
                            fontSize: 13,
                          )),
                    ],
                  ),
                ),
                sBoxH10,
                Center(
                  child: Text('Verification process pending...',
                  style: TextStyle(
                    fontSize:17,
                    color: red
                  ),
                    textAlign: TextAlign.center,
                  ),
                ),
                sBoxH20,
                Divider(
                  color: lightgray,
                  thickness: 1,
                ),
                sBoxH5,
                Padding(
                  padding: hpad12 + hpad4,
                  child: Row(
                    children: [
                      Icon(
                        Icons.mode_edit_outlined,
                        color: black,
                        size: 25,
                      ),
                      sBoxW10,
                      sBoxW5,
                      Text('Edit', style: username),
                    ],
                  ),
                ),
                sBoxH5,
                Divider(
                  color: lightgray,
                  thickness: 1,
                ),
                sBoxH5,
                Padding(
                  padding: hpad12 + hpad4,
                  child: Row(
                    children: [
                      Icon(
                        Icons.mail_outline,
                        color: black,
                        size: 25,
                      ),
                      sBoxW10,
                      sBoxW5,
                      Text(snapshot.data['email'], style: username),
                    ],
                  ),
                ),
                sBoxH5,
                Divider(
                  color: lightgray,
                  thickness: 1,
                ),
                sBoxH5,
                Padding(
                  padding: hpad12 + hpad4,
                  child: Row(
                    children: [
                      Icon(
                        Icons.call_outlined,
                        color: black,
                        size: 25,
                      ),
                      sBoxW10,
                      sBoxW5,
                      Text(snapshot.data['phnNum'], style: username),
                    ],
                  ),
                ),
                sBoxH5,
                Divider(
                  color: lightgray,
                  thickness: 1,
                ),
                sBoxH5,
                Padding(
                  padding: hpad12 + hpad4,
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: black,
                        size: 25,
                      ),
                      sBoxW10,
                      sBoxW5,
                      Text('Logout', style: username),
                    ],
                  ),
                ),
                sBoxH5,
                Divider(
                  color: lightgray,
                  thickness: 1,
                ),
              ],
            );
          }),
    ));
  }
}
