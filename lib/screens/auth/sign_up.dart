import 'package:avail_itech_hackfest/screens/auth/sign_in.dart';
import 'package:avail_itech_hackfest/screens/home/homepage.dart';
import 'package:avail_itech_hackfest/utils/auth_method.dart';
import 'package:avail_itech_hackfest/utils/colors.dart';
import 'package:avail_itech_hackfest/widgets/textformfield.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../utils/constants.dart';
import '../../utils/textstyle.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();
  final TextEditingController _phnNum = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  bool remainder = false;
  bool terms = false;
  bool _isObscure = true;
  bool _isObscure2 = true;

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
    _confirmpassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        toolbarHeight: 150,
        leadingWidth: 10,
        title: Text(
          "Sign Up",
          style: headingBoldText,
        ),
        actions: [
          Padding(
            padding: vpad12 + hpad12 + hpad12,
            child: CachedNetworkImage(
              imageUrl:
                  'https://firebasestorage.googleapis.com/v0/b/avail-38482.appspot.com/o/logo.png?alt=media&token=f65ddf57-2e6d-4908-bffb-4b0f650aa378',
              height: 120,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: hpad12 + hpad12 + vpad12,
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              sBoxH20,
              Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //First name
                    Row(
                      children: [
                        Text(
                          'First Name',
                          style: textFieldTitle,
                        ),
                        Text(
                          '*',
                          style: TextStyle(color: red, fontSize: 24),
                        ),
                      ],
                    ),
                    sBoxH5,
                    TextFieldInput(
                      textEditingController: firstname,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                      },
                      save: (value) {
                        firstname.text = value!;
                      },
                    ),
                    //last name
                    Row(
                      children: [
                        Text(
                          'Last Name',
                          style: textFieldTitle,
                        ),
                        Text(
                          '*',
                          style: TextStyle(color: red, fontSize: 24),
                        ),
                      ],
                    ),

                    TextFieldInput(
                      textEditingController: lastname,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                      },
                      save: (value) {
                        lastname.text = value!;
                      },
                    ),
                    //email
                    Row(
                      children: [
                        Text(
                          'Email',
                          style: textFieldTitle,
                        ),
                        Text(
                          '*',
                          style: TextStyle(color: red, fontSize: 24),
                        ),
                      ],
                    ),
                    sBoxH5,
                    TextFieldInput(
                      textEditingController: _email,
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
                        Text(
                          'Phone',
                          style: textFieldTitle,
                        ),
                        Text(
                          '*',
                          style: TextStyle(color: red, fontSize: 24),
                        ),
                      ],
                    ),
                    sBoxH5,
                    TextFieldInput(
                      textEditingController: _phnNum,
                      keyboard: TextInputType.phone,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return ("Please enter number");
                        }
                        // reg expression for email validation
                        if (value.length < 10) {
                          return ("Please enter a valid phone number");
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
                        Text(
                          'Password',
                          style: textFieldTitle,
                        ),
                        Text(
                          '*',
                          style: TextStyle(color: red, fontSize: 24),
                        ),
                      ],
                    ),
                    sBoxH5,
                    TextFieldInput(
                      textEditingController: _password,
                      isPass: _isObscure2,
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
                        _password.text = value!;
                      },
                      suffixIcon: IconButton(
                        color: Colors.white,
                        icon: Icon(
                          _isObscure2
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: black,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure2 = !_isObscure2;
                          });
                        },
                      ),
                    ),
                    //confirm password
                    Row(
                      children: [
                        Text(
                          'Confirm Password',
                          style: textFieldTitle,
                        ),
                        Text(
                          '*',
                          style: TextStyle(color: red, fontSize: 24),
                        ),
                      ],
                    ),
                    sBoxH5,
                    TextFieldInput(
                      textEditingController: _confirmpassword,
                      isPass: _isObscure,
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
                        _confirmpassword.text = value!;
                      },
                      suffixIcon: IconButton(
                        color: Colors.white,
                        icon: Icon(
                          _isObscure
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: black,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: remainder,
                    onChanged: (value) {
                      setState(() {
                        remainder = value!;
                      });
                    },
                    activeColor: black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    side: BorderSide(color: black),
                  ),
                  Text(
                    'Yes , send monthly newsletter to my email',
                    style: textFieldpara,
                  )
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: terms,
                    onChanged: (value) {
                      setState(() {
                        terms = value!;
                      });
                    },
                    activeColor: black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    side: BorderSide(color: black),
                  ),
                  Text(
                    'I accept terms and conditions ',
                    style: textFieldpara,
                  ),
                ],
              ),
              sBoxH10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      child: Text(
                        'Login instead',
                        style: selectedText,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      }),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_key.currentState!.validate()) {
                          String res = await AuthMethods().signUpUser(
                              email: _email.text.trim(),
                              password: _password.text.trim(),
                              firstName: firstname.text.trim(),
                              lastName: lastname.text.trim(),
                              phnNum: _phnNum.text.trim());
                          if (res == "success") {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                                (route) => false);
                          } else {
                            Fluttertoast.showToast(msg: "Some error occurred");
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      child: const Text('Sign Up',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
