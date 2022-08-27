import 'package:avail_itech_hackfest/screens/auth/sign_up.dart';
import 'package:avail_itech_hackfest/utils/colors.dart';
import 'package:avail_itech_hackfest/utils/constants.dart';
import 'package:avail_itech_hackfest/utils/textstyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController controller = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
            children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: 150),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('onboard')
                        .orderBy('index', descending: false)
                        .snapshots(),
                    builder: ((context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                            child: CircularProgressIndicator(
                          color: black,
                        ));
                      }
                      return PageView.builder(
                          onPageChanged: ((value) {
                            setState(() {
                              currentIndex = value;
                            });
                          }),
                          controller: controller,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: ((context, index) => Center(
                                child: Padding(
                                  padding: hpad20 + hpad20,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      sBoxH60,
                                      sBoxH60,
                                      sBoxH60,
                                      sBoxH30,
                                      CachedNetworkImage(
                                          imageUrl: snapshot.data!.docs[index]
                                              ['image'],height: MediaQuery.of(context).size.height/4.5,),
                                      sBoxH30,
                                      Text(
                                        snapshot.data!.docs[index]['title'],
                                        style: TextStyle(
                                            color: black,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      sBoxH20,
                                      Text(
                                        snapshot.data!.docs[index]
                                            ['description'],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ),
                              )));
                    }),
                  )),
              Positioned(
                  right: 158,
                  top: 80,
                  child: Image.asset(
                    'assets/logo/logo.png',
                    height: 90,
                  )),
            ],
          ),
          bottomSheet: SizedBox(
            height: 150,
            child: Padding(
              padding: hpad12 + hpad4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        controller.animateToPage(3,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeIn);
                      },
                      child: currentIndex != 3
                          ? Text(
                              'Skip',
                              style: textFieldTitle,
                            )
                          : Container()),
                  SizedBox(
                      width: 120,
                      child: ElevatedButton(
                        onPressed: () {
                          if (currentIndex != 3) {
                            controller.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeIn);
                          } else {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()),
                                (route) => false);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: yellow,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40))),
                        child: currentIndex != 3
                            ? const Text('Next',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black))
                            : const Text('Done!',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black)),
                      ))
                ],
              ),
            ),
          )),
    );
  }
}
