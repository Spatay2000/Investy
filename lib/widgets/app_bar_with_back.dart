import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investy/shared/theme.dart';

AppBar appBarWithBack(BuildContext context) {
  return AppBar(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          SvgImages.backArrow,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ));
}
