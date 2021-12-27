import 'package:flutter/material.dart';
import 'package:investy/shared/helper.dart';
import 'package:investy/shared/theme.dart';

import 'error_view.dart';
import 'next_button.dart';

class ConfirmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45.79),
                topRight: Radius.circular(45.79))),
        child: Padding(
          padding: const EdgeInsets.only(left: 25, top: 23, right: 43),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Confirm investment',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 34,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'You’re investing',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '\$10 000',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              UIHelper.verticalSpace(34),
              const Text(
                'Provider',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: AppColors.kGrayText),
              ),
              UIHelper.verticalSpace(15),
              const Text(
                'NEO Tech',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor),
              ),
              UIHelper.verticalSpace(15),
              const Text(
                'Information Technology',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: AppColors.kGrayText),
              ),
              UIHelper.verticalSpace(25),
              const Text(
                'Your benefit',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: AppColors.kGrayText),
              ),
              UIHelper.verticalSpace(15),
              const Text(
                '\$1 000 (15%)',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor),
              ),
              UIHelper.verticalSpace(30),
              const Text(
                'By confirming the investmetn you agree with providers loan terms.',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: AppColors.kGrayText),
              ),
              UIHelper.verticalSpace(20),
              DefButton(
                text: 'Confirm and invest',
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ErrorPage()),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
