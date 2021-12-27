import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:investy/shared/theme.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          strokeWidth: MediaQuery.of(context).size.width * 0.01,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
