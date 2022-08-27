import 'package:avail_itech_hackfest/screens/contributers/NGO_form.dart';
import 'package:avail_itech_hackfest/screens/contributers/verfication_progress.dart';
import 'package:avail_itech_hackfest/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../utils/colors.dart';
import '../../utils/textstyle.dart';


class TermsAndCondtion extends StatefulWidget {
  const TermsAndCondtion({Key? key}) : super(key: key);

  @override
  State<TermsAndCondtion> createState() => _TermsAndCondtionState();
}

class _TermsAndCondtionState extends State<TermsAndCondtion> {
  bool accept=false;
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
                      builder: (context) => const NGOForm(),
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
                 if(accept==true){
                   Navigator.pushAndRemoveUntil(
                       context,
                       MaterialPageRoute(
                         builder: (context) => const VerificationProcess(),
                       ),
                           (route) => false);
                 }
                },
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary:accept==true?HexColor('#FEED5F'):grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)
                      )
                  ),
                  child:Text('Next',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: black)),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(textAlign: TextAlign.left,text: TextSpan(
                    text: '• ',style: textFieldpara,
                    children: [
                      TextSpan(
                        text:'Use of this app is provided by Avail which is subjected to the following Terms and Conditions as given below.',

                    )
                    ]
                  )),
                  sBoxH10,
                  RichText(textAlign: TextAlign.left,text: TextSpan(
                    text: '• ',style: textFieldpara,
                    children: [
                      TextSpan(
                        text:'Your use and access to the app constitute acceptance of these Terms and Conditions as at the date of your first use of the app',

                    )
                    ]
                  )),
                  sBoxH10,
                  RichText(textAlign: TextAlign.left,text: TextSpan(
                      text: '• ',style: textFieldpara,
                      children: [
                        TextSpan(
                          text:'You agree to use the app only for lawful purposes, and in a manner which does not infringe the rights, or restrict, or inhibit the use and enjoyment of the app by any third party.'
                        )
                      ]
                  )),
                  sBoxH10,
                  RichText(textAlign: TextAlign.left,text: TextSpan(
                      text: '• ',style: textFieldpara,
                      children: [
                        TextSpan(
                          text:'Avail takes no responsibility for the unhygienic food.Avail shall not be responsible or liable, directly or indirectly, for any damages resulting from the use of such this app.')
                      ]
                  )),
                  sBoxH10,
                  RichText(textAlign: TextAlign.left,text: TextSpan(
                      text: '• ',style: textFieldpara,
                      children: [
                        TextSpan(
                            text:'Any communication or material that you transmit to, or post on, any public area of the app including any data, questions, comments, suggestions, or the like, is and will be treated as non-confidential and non-proprietary information. Avail reserves the right to remove any such communication or material from the app at its own discretion.'
                        )
                      ]
                  )),
                  sBoxH10,
                  RichText(textAlign: TextAlign.left,text: TextSpan(
                      text: '• ',style: textFieldpara,
                      children: [
                        TextSpan(
                          text: 'If these Terms and Conditions are not accepted in full, the use of the app must be terminated immediately.'
                        ),
                      ]
                  )),
                  sBoxH10,
                  CheckboxListTile(
                    value: accept,
                    checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged:(value) {
                      setState(() {
                      accept = value!;
                        });
                      },activeColor: Colors.black,
                    side: BorderSide(color: black),

                    title: Text('Accepting \'Terms and Conditions\' means an implicit acceptance of our Disclaimer and Privacy Policy'),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
