import 'package:avail_itech_hackfest/utils/colors.dart';
import 'package:avail_itech_hackfest/widgets/textformfield.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/textstyle.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController firstname=TextEditingController();
  TextEditingController lastname=TextEditingController();
  final TextEditingController _email=TextEditingController();
  final TextEditingController _password=TextEditingController();
  final TextEditingController _confirmpassword=TextEditingController();
  bool remainder=false;
  bool terms=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: hpad12+hpad12+vpad12,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Sign Up",
                      style: headingBoldText,
                    ),
                    CachedNetworkImage(imageUrl: 'https://firebasestorage.googleapis.com/v0/b/avail-38482.appspot.com/o/logo.png?alt=media&token=f65ddf57-2e6d-4908-bffb-4b0f650aa378',
                      height: 120,
                    ),
                  ],
                ),
                sBoxH20,
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //First name
                      Row(
                        children: [
                          Text('First Name',style: textFieldTitle,),
                          Text('*',style: TextStyle(color: red,fontSize: 24),),
                        ],
                      ),
                      sBoxH5,
                      TextFieldInput(textEditingController: firstname,
                      validate: (value){
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                      },
                        save: (value){
                          firstname.text = value!;
                        },
                      ),
                      //last name
                      Row(
                        children: [
                          Text('Last Name',style: textFieldTitle,),
                          Text('*',style: TextStyle(color: red,fontSize: 24),),
                        ],
                      ),

                      TextFieldInput(textEditingController: lastname,
                        validate: (value){
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                        save: (value){
                          lastname.text = value!;
                        },
                      ),
                      //email
                      Row(
                        children: [
                          Text('Email',style: textFieldTitle,),
                          Text('*',style: TextStyle(color: red,fontSize: 24),),
                        ],
                      ),
                      sBoxH5,
                      TextFieldInput(textEditingController: _email,
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
                          _email.text = value!;
                        },
                      ),

                      //Phone number
                      Row(
                        children: [
                          Text('Phone',style: textFieldTitle,),
                          Text('*',style: TextStyle(color: red,fontSize: 24),),
                        ],
                      ),
                      sBoxH5,
                      TextFieldInput(textEditingController: _email,
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
                          _email.text = value!;
                        },
                      ),

                      //password
                      Row(
                        children: [
                          Text('Password',style: textFieldTitle,),
                          Text('*',style: TextStyle(color: red,fontSize: 24),),
                        ],
                      ),
                      sBoxH5,
                      TextFieldInput(textEditingController: _password,
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
                          _password.text = value!;
                        },
                      ),
                      //confirm password
                      Row(
                        children: [
                          Text('Confirm Password',style: textFieldTitle,),
                          Text('*',style: TextStyle(color: red,fontSize: 24),),
                        ],
                      ),
                      sBoxH5,
                      TextFieldInput(textEditingController: _confirmpassword,
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
                          _confirmpassword.text = value!;
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: remainder,
                      onChanged: (value){
                        setState(() {
                          remainder=value!;
                        });
                      },
                      activeColor: black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      side: BorderSide(color: black)
                      ,),
                    Text('Yes , send monthly newsletter to my email',style: textFieldpara,)
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: terms,
                      onChanged: (value){
                        setState(() {
                          terms=value!;
                        });
                      },
                      activeColor: black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      side: BorderSide(color: black)
                      ,),
                    Text('I accept terms and conditions ',style: textFieldpara,),
                  ],
                ),
                sBoxH10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Log instead',
                    style: headingBoldText,
                    ),
                    SizedBox(
                      width: 180,
                      height: 50,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUp()));
                      },
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)
                            )
                        ),
                        child: const Text('Sign Up',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ],
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
