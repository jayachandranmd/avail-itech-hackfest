// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../utils/colors.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final validate;
  final save;

  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    this.validate,
    this.isPass = false,
    this.hintText,
    this.save,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validate,
        onSaved: save,
        controller: textEditingController,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none
          ),
          focusedBorder:  OutlineInputBorder(
              borderSide: BorderSide(color:white),
              borderRadius: BorderRadius.circular(50),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none
          ),
          filled: true,
          contentPadding: const EdgeInsets.all(20),
        ),
        obscureText: isPass,
      ),
    );
  }
}

