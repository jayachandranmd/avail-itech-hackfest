import 'dart:ffi';

import 'package:avail_itech_hackfest/screens/contributers/individual_form.dart';
import 'package:avail_itech_hackfest/screens/contributers/organization_form.dart';
import 'package:avail_itech_hackfest/utils/constants.dart';
import 'package:avail_itech_hackfest/utils/textstyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../utils/colors.dart';
import '../home/mainhomepage.dart';
import 'NGO_form.dart';

class ContributerIntro extends StatefulWidget {
  const ContributerIntro({Key? key}) : super(key: key);

  @override
  State<ContributerIntro> createState() => _ContributerIntroState();
}

class _ContributerIntroState extends State<ContributerIntro> {
  List values=[false,false,false];
  Map contribute={
    'NGO':false,
    'Individual':false,
    'Organization':false,
  };
  var navigate;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          toolbarHeight: 70,
          elevation: 2,
          leading: GestureDetector(
              onTap: (){
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainHomePage(),
                    ),
                        (route) => false);
              },
              child: Icon(Icons.close,size: 30,color: black,)),
          actions: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: 100,
                child: ElevatedButton(onPressed: (){
                  navigate=contribute.keys.where(
                          (element) => contribute[element] == true);
                  if (kDebugMode) {
                    print(navigate.toString().trim());
                  }
                  if(navigate.toString()=='(NGO)'){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>NGOForm()));
                  }
                  else if(navigate.toString()=='(Individual)'){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>IndividualForm()));
                  }
                  else if(navigate.toString()=='(Organization)'){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>OrganizationForm()));
                  }
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: values[0]==true||values[1]==true||values[2]==true?HexColor('#FEED5F'):grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)
                      )
                  ),
                  child:Text('Next',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: black)),
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 220.0,
                    width: double.infinity,
                    decoration: new BoxDecoration(
                      color:HexColor('#FEED5F'),
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(
                              MediaQuery.of(context).size.width, 380.0)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 30,),
                        Text("Become a Contributer ",style: headtext),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 90,
                    right: 135,
                    child: CachedNetworkImage(imageUrl: 'https://firebasestorage.googleapis.com/v0/b/avail-38482.appspot.com/o/hands.png?alt=media&token=3457ee8e-dab8-4fba-87e4-da9df7d47fb4',
                      height: 180,
                    ),
                  )
                ],
              ),
              SizedBox(height: 60,),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                child: Row(
                  children: [
                    Text('Select any one',style: textFieldTitle,),
                    Text('*',style: TextStyle(color: red,fontSize: 24),),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //ngo
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            values[0]=!values[0];
                            contribute.update(
                                contribute.keys.toList()[0],
                                    (value) => values[0]);

                          });
                        },
                        child: Stack(
                          children: [
                            Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                                side: values[0]==true?BorderSide(color: HexColor('#FEED5F')):BorderSide.none
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: CachedNetworkImage(
                                  imageUrl: 'https://firebasestorage.googleapis.com/v0/b/avail-38482.appspot.com/o/NGO.png?alt=media&token=ba887660-9412-4204-873c-79eed7ab93c1',
                                height: 80,
                                ),
                              ),
                            ),
                            values[0]==true?Positioned(
                            top: 8,
                            right: 8,
                            child: CircleAvatar(maxRadius: 15,backgroundColor: HexColor('#FEED5F'),child: Icon(Icons.done_rounded,color: white,),)):Container()
                          ],
                        ),
                      ),
                      Text('NGO',style:TextStyle(fontSize: 21),)
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            values[1]=!values[1];
                            contribute.update(
                                contribute.keys.toList()[1],
                                    (value) => values[1]);
                          });
                        },
                        child: Stack(
                          children: [
                            Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                                  side: values[1]==true?BorderSide(color: HexColor('#FEED5F')):BorderSide.none
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: CachedNetworkImage(
                                  imageUrl: 'https://firebasestorage.googleapis.com/v0/b/avail-38482.appspot.com/o/individual.png?alt=media&token=568cddda-b565-4208-bb4d-6be807e66a14',
                                  height: 80,
                                ),
                              ),
                            ),
                            values[1]==true?Positioned(
                                top: 8,
                                right: 8,
                                child: CircleAvatar(maxRadius: 15,backgroundColor: HexColor('#FEED5F'),child: Icon(Icons.done_rounded,color: white,),)):Container()
                          ],
                        ),
                      ),
                      Text('Individual',style:TextStyle(fontSize: 21),)
                    ],
                  )
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            values[2]=!values[2];
                            contribute.update(
                                contribute.keys.toList()[2],
                                    (value) => values[2]);

                          });
                        },
                        child: Stack(
                          children: [
                            Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  side: values[2]==true?BorderSide(color: HexColor('#FEED5F')):BorderSide.none
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: CachedNetworkImage(
                                  imageUrl: 'https://firebasestorage.googleapis.com/v0/b/avail-38482.appspot.com/o/organization.png?alt=media&token=e5321013-de24-404c-9667-5ce2fe2665ac',
                                  height: 80,
                                ),
                              ),
                            ),
                            values[2]==true?Positioned(
                                top: 8,
                                right: 8,
                                child: CircleAvatar(maxRadius: 15,backgroundColor: HexColor('#FEED5F'),child: Icon(Icons.done_rounded,color: white,),)):Container()
                          ],
                        ),
                      ),
                      Text('Organization',style:TextStyle(fontSize: 21),)
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20,),



            ],
          ),
        ),
      ),
    );
  }
}
