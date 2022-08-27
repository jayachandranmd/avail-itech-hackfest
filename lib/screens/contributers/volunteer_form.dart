import 'package:avail_itech_hackfest/screens/contributers/terms_conditions.dart';
import 'package:avail_itech_hackfest/screens/contributers/verfication_progress.dart';
import 'package:avail_itech_hackfest/screens/contributers/volunteer_completion.dart';
import 'package:avail_itech_hackfest/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/textstyle.dart';
import 'contributer_intro.dart';

class VolunteerForm extends StatefulWidget {
  const VolunteerForm({Key? key}) : super(key: key);

  @override
  State<VolunteerForm> createState() => _VolunteerFormState();
}

class _VolunteerFormState extends State<VolunteerForm> {
  final TextEditingController name=TextEditingController();
  final TextEditingController gender=TextEditingController();
  final TextEditingController age=TextEditingController();
  final TextEditingController id=TextEditingController();
  final TextEditingController email=TextEditingController();
  final TextEditingController phone=TextEditingController();
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
                        builder: (context) => const ContributerIntro(),
                      ),
                          (route) => false);
                },
                child: Icon(Icons.arrow_back,size: 30,color: black,)),
            actions: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  width: 100,
                  child: ElevatedButton(onPressed: (){
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VolunteerCompletion(),
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
                    child:Text('Next',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: black)),
                  ),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: vpad12+hpad12,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Name of NGO',style: textFieldTitle,),
                      Text('*',style: TextStyle(color: red,fontSize: 24),),
                    ],
                  ),
                  sBoxH10,
                  FormsField(textEditingController: name,
                    hintText: 'Name',
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                },
                save: (value) {
                  name.text = value!;
                },),
                  Row(
                    children: [
                      Text('Gender',style: textFieldTitle,),
                      Text('*',style: TextStyle(color: red,fontSize: 24),),
                    ],
                  ),
                  sBoxH10,
                  FormsField(textEditingController: gender,
                    hintText: 'Gender',
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                    },
                    save: (value) {
                      gender.text = value!;
                    },),
                  Row(
                    children: [
                      Text('Age',style: textFieldTitle,),
                      Text('*',style: TextStyle(color: red,fontSize: 24),),
                    ],
                  ),
                  sBoxH10,
                  FormsField(textEditingController: age,
                    hintText: 'Age',
                    keyboard: TextInputType.phone,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                    },
                    save: (value) {
                      age.text = value!;
                    },),
                  Row(
                    children: [
                      Text('Student or Work ID',style: textFieldTitle,),
                      Text('*',style: TextStyle(color: red,fontSize: 24),),
                    ],
                  ),
                  sBoxH10,
                  FormsField(textEditingController: id,
                    hintText: 'ID',
                    keyboard: TextInputType.phone,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                    },
                    save: (value) {
                      id.text = value!;
                    },),
                  Row(
                    children: [
                      Text('Email',style: textFieldTitle,),
                      Text('*',style: TextStyle(color: red,fontSize: 24),),
                    ],
                  ),
                  sBoxH10,
                  FormsField(textEditingController: email,
                    hintText: 'Email',
                    keyboard: TextInputType.emailAddress,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return ("Please enter your email");
                      }
                      // reg expression for email validation
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return ("Please enter a valid email");
                      }
                      return null;
                    },
                    save: (value) {
                      email.text = value!;
                    },),
                  Row(
                    children: [
                      Text('Phone',style: textFieldTitle,),
                      Text('*',style: TextStyle(color: red,fontSize: 24),),
                    ],
                  ),
                  sBoxH10,
                  FormsField(textEditingController: phone,
                    hintText: 'Phone',
                    keyboard: TextInputType.phone,
                    validate: (value) {
                      if (value.length<10) {
                        return 'Please enter phone number';
                      }
                    },
                    save: (value) {
                      phone.text = value!;
                    },),

                ],
              ),
            ),
          ),
        )
    );
  }
}
