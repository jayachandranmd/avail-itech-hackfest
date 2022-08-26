// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../utils/colors.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final hintText;
  final validate;
  final save;
  final suffixIcon;
  final keyboard;

  const TextFieldInput(
      {Key? key,
      required this.textEditingController,
      this.validate,
      this.keyboard,
      this.isPass = false,
      this.hintText,
      this.save,
      this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: TextFormField(
        keyboardType: keyboard,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validate,
        onSaved: save,
        controller: textEditingController,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: white),
              borderRadius: BorderRadius.circular(50),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none),
            filled: true,
            contentPadding: const EdgeInsets.all(20),
            suffixIcon: suffixIcon),
        obscureText: isPass,
      ),
    );
  }
}




class FormsField extends StatelessWidget {
  final TextEditingController textEditingController;
  final hintText;
  final validate;
  final save;
  final suffixIcon;
  final keyboard;

  const FormsField(
      {Key? key,
        required this.textEditingController,
        this.validate,
        this.keyboard,
        this.hintText,
        this.save,
        this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Theme(
        data: Theme.of(context).copyWith(primaryColor: grey),
        child: TextFormField(
          autofocus: true,
          keyboardType: keyboard,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validate,
          onSaved: save,
          controller: textEditingController,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintStyle: TextStyle(
              fontStyle: FontStyle.italic
            ),
              focusColor: Colors.grey,
              hintText: hintText,
              contentPadding: const EdgeInsets.all(10),
              suffixIcon: suffixIcon)
        ),
      ),
    );
  }
}