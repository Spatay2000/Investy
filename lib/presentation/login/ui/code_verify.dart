import 'package:flutter/material.dart';

import 'package:investy/base/base_provider.dart';
import 'package:investy/presentation/home/ui/home.dart';
import 'package:investy/presentation/login/provider/code_verify_provider.dart';
import 'package:investy/presentation/login/ui/number_verify.dart';
import 'package:investy/presentation/login/ui/register.dart';
import 'package:investy/shared/theme.dart';
import 'package:investy/widgets/app_bar_with_back.dart';
import 'package:investy/widgets/loading_view.dart';
import 'package:investy/widgets/next_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CodeVerify extends StatelessWidget {
  late final String numField;
  CodeVerify({required this.numField});

  bool isHidden = false;
  var currentText = "1234";

  @override
  Widget build(BuildContext context) {
    return BaseProvider<CodeVerifyProvider>(
        model: CodeVerifyProvider(),
        onReady: (v) => v.init(context),
        builder: (context, model, child) {
          return model.isLoading
              ? LoadingView()
              : Scaffold(
                  appBar: appBarWithBack(context),
                  bottomNavigationBar: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ButtonNext(
                        navigatePage: NumberVerify(
                          numField: '',
                        ),
                        text: 'Next',
                        press: () {}),
                  ),
                  backgroundColor: AppColors.whiteColor,
                  body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Verify email',
                            style: TextStyle(
                                color: AppColors.textColor, fontSize: 20.0)),
                        SizedBox(height: 10),
                        Text(
                            "Enter the confirmation code we've sent to  kurmashev@gmail.com"),
                        Container(
                          margin: const EdgeInsets.only(
                              right: 184, top: 5, bottom: 10),
                          child: Text(
                            numField,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                          child: PincodeTextField(
                            context,
                          ),
                          margin: const EdgeInsets.only(right: 153),
                        ),
                        Row(
                          children: [
                            Text("Didn't receive code?"),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Register()));
                                },
                                child: Text(
                                  'Send again',
                                  style:
                                      TextStyle(color: AppColors.primaryColor),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                );
        });
  }

  PinCodeTextField PincodeTextField(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      obscureText: false,
      animationType: AnimationType.fade,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      pinTheme: PinTheme(
        selectedFillColor: const Color(0xFFF4F4F4),
        borderWidth: 0,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: const Color(0xFFF4F4F4),
        inactiveColor: const Color(0xFFF4F4F4),
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      enableActiveFill: true,
      // errorAnimationController: errorController,
      // controller: textEditingController,
      onCompleted: (value) {
        print("Completed");
        if (value == currentText) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NumberVerify(
                        numField: '',
                      )));
        }
      },
      onChanged: (value) {
        print(value);
        setState(() {
          currentText = value;
          // Navigator.push(
          //                   context, MaterialPageRoute(builder: (context) =>  OnboardingScreen()));
        });
      },
      beforeTextPaste: (text) {
        print("Allowing to paste $text");
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
    );
  }

  void setState(Null Function() param0) {}
}
