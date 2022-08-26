import 'package:avail_itech_hackfest/utils/constants.dart';
import 'package:avail_itech_hackfest/utils/textstyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../utils/colors.dart';

class PostForm extends StatefulWidget {
  const PostForm({Key? key}) : super(key: key);

  @override
  State<PostForm> createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  final uid = FirebaseAuth.instance.currentUser?.uid;
  final TextEditingController postdetail = TextEditingController();
  List<bool> values = [false, false, false];
  List tags = ['Clothes', 'Food', 'Volunteering'];
  List image = [
    'https://firebasestorage.googleapis.com/v0/b/avail-38482.appspot.com/o/clothes_Tag.png?alt=media&token=09e3f3d0-012c-4fb8-92e7-5a739f56fcea',
    'https://firebasestorage.googleapis.com/v0/b/avail-38482.appspot.com/o/clothes_Tag.png?alt=media&token=09e3f3d0-012c-4fb8-92e7-5a739f56fcea',
    'https://firebasestorage.googleapis.com/v0/b/avail-38482.appspot.com/o/clothes_Tag.png?alt=media&token=09e3f3d0-012c-4fb8-92e7-5a739f56fcea'
  ];

  Map<String, bool> postTag = {
    'Clothes': false,
    'Food': false,
    'Volunteering': false,
  };
  var updated;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          toolbarHeight: 80,
          elevation: 2,
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.close,
                size: 30,
                color: black,
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: 120,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      updated = postTag.keys
                          .where((element) => postTag[element] == true);
                      if (kDebugMode) {
                        print(updated);
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: HexColor('#FEED5F'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                  child: const Text('Post',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black)),
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: vpad8 + hpad8,
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: HexColor('#FEED5F'),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    shadowColor: HexColor('#FEED5F'),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //User name
                        Padding(
                          padding: vpad8,
                          child: ListTile(
                            leading: const CircleAvatar(
                              maxRadius: 30,
                            ),
                            title: Text(
                              'Name',
                              style: textFieldTitle,
                            ),
                            subtitle: const Text(
                              'username',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        //Content
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: SingleChildScrollView(
                            child: SizedBox(
                              height: 200,
                              child: TextFormField(
                                maxLines: 30,
                                minLines: 7,
                                textInputAction: TextInputAction.newline,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  filled: true,
                                  contentPadding: const EdgeInsets.all(15),
                                  hintText: "Write a caption",
                                  fillColor: Colors.white,
                                ),
                                style: textFieldpara,
                                cursorColor: HexColor('#AEAEAE'),
                                cursorHeight: 20,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter sentence";
                                  }
                                  return null;
                                },
                                controller: postdetail,
                                onSaved: (value) {
                                  postdetail.text = value!;
                                },
                              ),
                            ),
                          ),
                        ),
                        sBoxH60,
                        //Add Image
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: SizedBox(
                                width: 200,
                                child: Text(
                                  'Add Image',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: black),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: hpad4,
                  child: Row(
                    children: [
                      Text(
                        'Tags',
                        style: textFieldTitle,
                      ),
                      Text(
                        '*',
                        style: TextStyle(color: red, fontSize: 24),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Tags
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: values.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: SizedBox(
                          child: OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  values[index] = !values[index];
                                  postTag.update(postTag.keys.toList()[index],
                                      (value) => values[index]);
                                  if (kDebugMode) {
                                    print(postTag);
                                  }
                                });
                              },
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                backgroundColor: values[index] == true
                                    ? HexColor('#FEED5F')
                                    : white,
                                side: BorderSide(color: HexColor('#FEED5F')),
                                primary: HexColor('#FEED5F'),
                              ),
                              child: Row(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: image[index],
                                    height: 20,
                                  ),
                                  sBoxW5,
                                  Text(
                                    tags[index],
                                    style: textFieldpara,
                                  )
                                ],
                              )),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
