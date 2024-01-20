import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptativeTextfield extends StatelessWidget {
  final String titleLabel;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final Function(String) submitForm;

  AdaptativeTextfield({
    required this.titleLabel,
    required this.controller,
    this.keyboardType,
    required this.submitForm,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Container(
          margin: EdgeInsets.only(bottom: 5),
          child: CupertinoTextField(
            controller: controller,
            keyboardType: keyboardType,
            onSubmitted: submitForm,
            placeholder: titleLabel,
            padding: EdgeInsets.all(8),
          ),
        )
        : TextField(
            controller: controller,
            keyboardType: keyboardType,
            onSubmitted: submitForm,
            decoration: InputDecoration(
              labelText: titleLabel,
            ),
          );
  }
}