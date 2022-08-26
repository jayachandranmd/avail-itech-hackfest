import 'package:avail_itech_hackfest/utils/colors.dart';
import 'package:avail_itech_hackfest/utils/constants.dart';
import 'package:avail_itech_hackfest/utils/textstyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../widgets/textformfield.dart';
import 'sign_up.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailcontroller =TextEditingController();
  TextEditingController passwordcontroller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: hpad12+hpad12+vpad12+vpad8,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Login",
                        style: headingBoldText,
                      ),
                      CachedNetworkImage(imageUrl: 'https://firebasestorage.googleapis.com/v0/b/avail-38482.appspot.com/o/logo.png?alt=media&token=f65ddf57-2e6d-4908-bffb-4b0f650aa378',
                      height: 120,
                      ),
                    ],
                  ),
                  sBoxH60,
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email',style: textFieldTitle,),
                        sBoxH10,
                        TextFieldInput(textEditingController: emailcontroller, hintText: 'someone@example.com',
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
                            emailcontroller.text = value!;
                          },
                        ),
                        sBoxH5,
                        Text('Password',style: textFieldTitle,),
                        sBoxH10,
                        TextFieldInput(textEditingController: passwordcontroller, hintText: '*****',
                          validate: (value) {
                            RegExp regex = RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return ("Password is required for login");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Enter Valid Password(Min. 6 Character)");
                            }
                            return null;
                          },
                          save: (value) {
                            passwordcontroller.text = value!;
                          },
                        ),
                      ],
                    ),
                  ),
                  sBoxH20,
                  SizedBox(
                    width: double.infinity,
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
                        child: const Text('Login',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700)),
                    ),
                  ),
                  sBoxH30,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Divider(
                          thickness: 2,
                          color: darkgrey,
                        ),
                      ),
                      Text('or',style: TextStyle(color: darkgrey),),
                      SizedBox(
                        width: 150,
                        child: Divider(
                          thickness: 2,
                          color: darkgrey,
                        ),
                      ),
                    ],
                  ),
                  sBoxH20,
                  Center(
                    child:CachedNetworkImage(imageUrl:'https://firebasestorage.googleapis.com/v0/b/avail-38482.appspot.com/o/google.png?alt=media&token=45833eae-dad9-452a-aef1-70bb08cea00d',
                    height: 40,
                    )
                  ),
                  sBoxH30,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style:
                        TextStyle(color: black, fontSize: 18),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUp()));
                        },
                        child: InkWell(
                          child: Text('Sign up',
                              style: TextStyle(
                                  color: blue,
                                  fontSize: 18,
                                  decoration: TextDecoration.underline)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
