import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/textstyle.dart';
import '../home/mainhomepage.dart';

class VolunteerCompletion extends StatefulWidget {
  const VolunteerCompletion({Key? key}) : super(key: key);

  @override
  State<VolunteerCompletion> createState() => _VolunteerCompletionState();
}

class _VolunteerCompletionState extends State<VolunteerCompletion> {
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
              Text('We appreciate your\nInterest to come forward\nand help others',style: headtext,textAlign: TextAlign.center,),
              CachedNetworkImage(
                  imageUrl: 'https://firebasestorage.googleapis.com/v0/b/avail-38482.appspot.com/o/volenteer.png?alt=media&token=cda1e831-1f64-4b87-8a93-f23f66af1074'),
              Text(
                'You‘ll be notified by the Contributer\nsoon',
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
