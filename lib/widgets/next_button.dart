import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:investy/shared/theme.dart';

class ButtonNext extends StatelessWidget {
  final Widget navigatePage;
  final String text;
  final Function press;
  ButtonNext(
      {required this.navigatePage, required this.text, required this.press});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 4,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => navigatePage));
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 2,
            height: MediaQuery.of(context).size.height * 0.06,
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ));
  }
}

class DefButton extends StatelessWidget {
  final String text;
  final Function press;
  DefButton({required this.text, required this.press});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 4,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          onPressed: press as void Function()?,
          child: Container(
            width: MediaQuery.of(context).size.width * 2,
            height: MediaQuery.of(context).size.height * 0.06,
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ));
  }
}
