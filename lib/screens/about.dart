import 'package:avail_itech_hackfest/utils/colors.dart';
import 'package:avail_itech_hackfest/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Aboutpage extends StatelessWidget {
  const Aboutpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [HexColor('#FEED5F'), HexColor('#FFFBDF')])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sBoxH30,
            sBoxH10,
            Center(
              child: CachedNetworkImage(
                imageUrl:
                    'https://firebasestorage.googleapis.com/v0/b/avail-38482.appspot.com/o/appistics.png?alt=media&token=6482a4e0-46cd-4479-a567-e74afeab452e',
                height: 90,
              ),
            ),
            sBoxH20,
            Padding(
              padding: vpad20 + hpad20,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: white),
                child: Padding(
                  padding: vpad12 + hpad12,
                  child: RichText(
                    text: TextSpan(
                        text: 'What are we?',
                        style: TextStyle(
                            color: black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                '\n\nAn app that could help people contribute food and clothes to the people in need of it ( or at least make the best use of it ) to ensure sustainability',
                            style: TextStyle(
                                color: black,
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                                wordSpacing: 2.5),
                          )
                        ]),
                  ),
                ),
              ),
            ),
            Padding(
              padding: vpad20 + hpad20,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: white),
                child: Padding(
                  padding: vpad12 + hpad12,
                  child: RichText(
                    text: TextSpan(
                        text: 'How are we going to achieve this',
                        style: TextStyle(
                            color: black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                '\n\nBy building a community of NGOs that could use help from individuals, small enterprises and act as a bridge between them and the people who are in need of their help - Diversion and inclusion',
                            style: TextStyle(
                                color: black,
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                                wordSpacing: 2.5),
                          )
                        ]),
                  ),
                ),
              ),
            ),
            Text(
              'Dont Waste food !',
              style: TextStyle(
                color: Colors.black.withOpacity(0.2),
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
