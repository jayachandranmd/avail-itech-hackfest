import 'package:avail_itech_hackfest/screens/contributers/contributer_intro.dart';
import 'package:avail_itech_hackfest/screens/post_form.dart';
import 'package:avail_itech_hackfest/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/colors.dart';
import '../../utils/textstyle.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [HexColor('#FEED5F'), HexColor('#FFFFFF')])),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: vpad12 + hpad20,
                      child: Text(
                        'Recent',
                        style: textFieldTitle,
                      ),
                    ),
                    //Contributors Card
                    Padding(
                      padding: hpad20,
                      child: SizedBox(
                        child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('contributor_card')
                              .snapshots(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                  child: CircularProgressIndicator(
                                color: Colors.black,
                              ));
                            }
                            return SizedBox(
                              height: 150,
                              child: Swiper(
                                physics: const ScrollPhysics(),
                                autoplay: true,
                                scale: 0.7,
                                autoplayDisableOnInteraction: true,
                                autoplayDelay: 3000,
                                itemCount: snapshot.data.docs.length,
                                itemBuilder: (BuildContext context, index) {
                                  return Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          topLeft: Radius.circular(20)),
                                      side: BorderSide(color: yellow, width: 1),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: vpad8 + hpad20,
                                          child: Text(
                                            snapshot.data.docs[index]['title'],
                                            style: contributorText,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.location_on,
                                                      color: black),
                                                  Text(
                                                    snapshot.data.docs[index]
                                                        ['location'],
                                                    style: subtitle,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            ClipRect(
                                              clipBehavior: Clip.antiAlias,
                                              child: CachedNetworkImage(
                                                imageUrl: snapshot
                                                    .data.docs[index]['image'],
                                                height: 80,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ]),
            ),
            sBoxH10,
            StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('feeds').snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                        child: CircularProgressIndicator(color: Colors.black));
                  }
                  // ignore: sized_box_for_whitespace
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: const EdgeInsets.only(
                                bottom: 10, top: 10, left: 10, right: 10),
                            shadowColor: Colors.grey,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 20, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        radius: 20,
                                        backgroundImage:
                                            CachedNetworkImageProvider(
                                          'https://firebasestorage.googleapis.com/v0/b/avail-38482.appspot.com/o/profile.png?alt=media&token=6bb09fcb-2e37-42f6-90e5-a8651a2f1b71',
                                        ),
                                      ),
                                      sBoxW10,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot.data.docs[index]['name'],
                                            style: username,
                                          ),
                                          Text(
                                            snapshot.data.docs[index]
                                                ['username'],
                                            style: subtitle,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  sBoxH10,
                                  RichText(
                                    text: TextSpan(
                                      text: snapshot.data.docs[index]['date'],
                                      style: subtitle,
                                      children: <TextSpan>[
                                        TextSpan(text: ' • ', style: subtitle),
                                        TextSpan(
                                            text: snapshot.data.docs[index]
                                                ['time'],
                                            style: subtitle),
                                      ],
                                    ),
                                  ),
                                  sBoxH10,
                                  Text(snapshot.data.docs[index]['content'],
                                      style:
                                          TextStyle(color: black, fontSize: 15),
                                      textScaleFactor: 1.2),
                                  sBoxH10,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 80,
                                        child: ListTile(
                                          title: CachedNetworkImage(
                                            imageUrl:
                                                'https://firebasestorage.googleapis.com/v0/b/avail-38482.appspot.com/o/call.png?alt=media&token=4587dff3-ffc4-4d31-9e12-2ee7e6d64e26',
                                            height: 25,
                                          ),
                                          subtitle: Center(
                                              child: Text(
                                            'Call',
                                            style: subtitle,
                                          )),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async{
                                          var url = "https://wa.me/+917094523949?text=""";
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {
                                            throw 'Could not launch $url';
                                          }
                                        },
                                        child: SizedBox(
                                          width: 80,
                                          child: ListTile(
                                            title: CachedNetworkImage(
                                              imageUrl:
                                                  'https://firebasestorage.googleapis.com/v0/b/avail-38482.appspot.com/o/whatsapp.png?alt=media&token=fba174f0-dd72-41e4-9b06-d28281c41189',
                                              height: 25,
                                            ),
                                            subtitle: Center(
                                                child: Text(
                                              'Chat',
                                              style: subtitle,
                                            )),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 80,
                                        child: ListTile(
                                          title: CachedNetworkImage(
                                            imageUrl:
                                                'https://firebasestorage.googleapis.com/v0/b/avail-38482.appspot.com/o/share.png?alt=media&token=c4ee8389-1191-4d9e-af9e-0670d9edfb20',
                                            height: 20,
                                          ),
                                          subtitle: Center(
                                              child: Text(
                                            'Share',
                                            style: subtitle,
                                          )),
                                        ),
                                      ),
                                      if (snapshot.data.docs[index]['volunteerStatus'])
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=> VolunteerForm() ));
                                          },
                                          child: SizedBox(
                                          width: 80,
                                          child: ListTile(
                                            title: CachedNetworkImage(
                                              imageUrl:
                                                  'https://firebasestorage.googleapis.com/v0/b/avail-38482.appspot.com/o/apply.png?alt=media&token=e903fcac-28bc-42b0-8a39-2821f76fff41',
                                              height: 20,
                                            ),
                                            subtitle: Center(
                                                child: Text(
                                                  'Apply',
                                                  style: subtitle,
                                                )),
                                          ),
                                      ),
                                        ) else Container(height: 0,width: 0,)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                }),
          ],
        ),
      ),
    ));
  }
}
