import 'package:avail_itech_hackfest/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../utils/colors.dart';
import '../utils/textstyle.dart';

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
          appBar: AppBar(
            backgroundColor: black,
            title: Text("Home",
            style: appbar,
            ),
            actions: [Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CachedNetworkImage(
                    imageUrl: "https://firebasestorage.googleapis.com/v0/b/avail-38482.appspot.com/o/add_post.png?alt=media&token=949efad9-626e-41eb-a3e9-addc663d200a",
                    height: 25,
                ),
                sBoxH10,
                IconButton(
                  icon: Icon(Icons.menu,color: white,size: 32),
                  onPressed: () {},
                ),
              ],
            ),]
          ),
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
                        colors:[
                      HexColor('#FEED5F'),
                      HexColor('#FFFFFF')
                    ])
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Padding(
                        padding: vpad12+hpad20,
                        child: Text('Recent',
                          style: textFieldTitle,
                        ),
                      ),
                      //Contributors Card
                      Padding(
                        padding: hpad20,
                        child: SizedBox(
                          child: StreamBuilder(
                            stream: FirebaseFirestore.instance.collection('contributor_card').snapshots(),
                            builder: (BuildContext context, AsyncSnapshot snapshot) {
                              if (!snapshot.hasData ) {
                                return const CircularProgressIndicator();
                              }
                              return SizedBox(
                                height: 150,
                                child: Swiper(physics: ScrollPhysics(),
                                  autoplay: true,
                                  autoplayDelay: 2000,
                                  itemCount: snapshot.data.docs.length,
                                  itemBuilder: (BuildContext context, index) {
                                    return Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                                        side: BorderSide(color: yellow, width: 1),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: vpad8+hpad8,
                                            child: Text(snapshot.data.docs[index]['title'],
                                              style: contributorText,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(bottom: 5),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.location_on,color: black),
                                                    Text(snapshot.data.docs[index]['location'],style: subtitle,),
                                                  ],
                                                ),
                                              ),
                                              ClipRect(
                                                clipBehavior: Clip.antiAlias,
                                                child: CachedNetworkImage(
                                                  imageUrl: snapshot.data.docs[index]['image'],
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
                    ]
                  ),
                ),
                sBoxH10,
                StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('feeds').snapshots(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData ) {
                        return const CircularProgressIndicator(color: Colors.black);
                      }
                      return SizedBox(
                        height: 500,
                        child: ListView.builder(
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context,index) {
                            return Card(
                              shadowColor: Colors.grey,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 10,right: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CachedNetworkImage(imageUrl: 'https://firebasestorage.googleapis.com/v0/b/avail-38482.appspot.com/o/profile.png?alt=media&token=05b80632-a7ea-42ec-82ad-b619608208a9'
                                        ),
                                        sBoxW10,
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(snapshot.data.docs[index]['name'],style: username,),
                                            Text(snapshot.data.docs[index]['username'],style: subtitle,),
                                          ],
                                        ),
                                      ],
                                    ),
                                    sBoxH5,
                                    RichText(
                                      text: TextSpan(
                                        text: snapshot.data.docs[index]['date'],
                                        style: subtitle,
                                        children: <TextSpan>[
                                          TextSpan(text: ' • ',style: subtitle),
                                          TextSpan(
                                              text: snapshot.data.docs[index]['date'],
                                              style: subtitle),
                                        ],
                                      ),
                                    ),
                                    sBoxH5,
                                    Text(snapshot.data.docs[index]['content'],style: TextStyle(color: black,fontSize: 15),),
                                    sBoxH10,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                       SizedBox(
                                         width: 100,
                                         child: ListTile(
                                           title: CachedNetworkImage(
                                             imageUrl: 'https://firebasestorage.googleapis.com/v0/b/avail-38482.appspot.com/o/whatsapp.png?alt=media&token=d8dc64fe-27fa-403e-b72e-fb69ebae16da',
                                                height: 30,
                                           ),
                                           subtitle: Center(child: Text('Chat',style: subtitle,)),
                                         ),
                                       ),
                                       SizedBox(
                                         width: 100,
                                         child: ListTile(
                                           title: CachedNetworkImage(
                                             imageUrl: 'https://firebasestorage.googleapis.com/v0/b/avail-38482.appspot.com/o/location.png?alt=media&token=2665e347-8574-4b14-bb5a-0782f5d8af97',
                                             height: 30,
                                           ),
                                           subtitle: Center(child: Text('Location',style: subtitle,)),
                                         ),
                                       ),
                                       SizedBox(
                                         width: 100,
                                         child: ListTile(
                                           title: CachedNetworkImage(
                                             imageUrl: 'https://firebasestorage.googleapis.com/v0/b/avail-38482.appspot.com/o/share.png?alt=media&token=bda67aba-99e8-4394-96b5-5fb7e6ad1e70',
                                                height: 30,
                                           ),
                                           subtitle: Center(child: Text('Share',style: subtitle,)),
                                         ),
                                       ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        ),
                      );
                    }
                )
              ],
            ),
          ),
        ));
  }
}
