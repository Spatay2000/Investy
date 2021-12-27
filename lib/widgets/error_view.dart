import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investy/shared/helper.dart';
import 'package:investy/shared/theme.dart';

import 'next_button.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 300),
          child: Center(
            child: Column(
              children: [
                SvgPicture.asset('assets/images/ic_cancel.svg'),
                UIHelper.verticalSpace(20),
                const Text(
                  'Something went wrong',
                  style: TextStyle(fontSize: 16, color: AppColors.textColor),
                ),
                UIHelper.verticalSpace(12),
                TextButton(
                    onPressed: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: SvgPicture.asset('assets/images/108.svg'),
                          content: const Text(
                            'Please, update your balance to make invests',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          actions: <Widget>[
                            Center(
                              child: Column(
                                children: [
                                  DefButton(
                                    text: 'Update account',
                                    press: () {},
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text(
                                      'I’ll do it later',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    child: Text(
                      'Go back',
                      style: TextStyle(
                          color: AppColors.primaryColor, fontSize: 16),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
