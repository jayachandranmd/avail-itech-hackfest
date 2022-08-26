import 'package:avail_itech_hackfest/screens/home/mainhomepage.dart';
import 'package:avail_itech_hackfest/utils/constants.dart';
import 'package:avail_itech_hackfest/utils/textstyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../utils/colors.dart';


class VerificationProcess extends StatefulWidget {
  const VerificationProcess({Key? key}) : super(key: key);

  @override
  State<VerificationProcess> createState() => _VerificationProcessState();
}

class _VerificationProcessState extends State<VerificationProcess> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          toolbarHeight: 70,
          elevation: 2,
          actions: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: 100,
                child: ElevatedButton(onPressed: (){
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainHomePage(),
                      ),
                          (route) => false);

                },
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: HexColor('#FEED5F'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)
                      )
                  ),
                  child:Text('Done',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: black)),
                ),
              ),
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Congrats !\nVerification is Processing',style: headtext,textAlign: TextAlign.center,),
              CachedNetworkImage(imageUrl: 'https://firebasestorage.googleapis.com/v0/b/avail-38482.appspot.com/o/verfication_process.png?alt=media&token=ba2147d7-64a6-4ce6-b686-fdf525a08dab'),
              Text(
                'Please be patient our team is working on your application , It will take 1 - 2 days to approve your application',
                style: textFieldpara,textAlign: TextAlign.center,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Any queries",
                    style: TextStyle(color: black, fontSize: 14),
                  ),
                  sBoxW5,
                  InkWell(
                    onTap: () {
                    },
                    child: InkWell(
                      child: Text('Learn more',
                          style: TextStyle(
                              color: black,
                              fontSize: 14,
                              decoration: TextDecoration.underline)),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
