import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investy/base/base_provider.dart';
import 'package:investy/presentation/profile/provider/confirm_provider.dart';
import 'package:investy/shared/helper.dart';
import 'package:investy/shared/theme.dart';
import 'package:investy/widgets/loading_view.dart';
import 'package:investy/widgets/next_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ConfirmCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BaseProvider<ConfirmProvider>(
        model: ConfirmProvider(),
        builder: (context, model, child) {
          return model.isLoading
              ? LoadingView()
              : Scaffold(
                  resizeToAvoidBottomInset: false,
                  backgroundColor: Colors.white,
                  body: SafeArea(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 23, right: 72),
                          child: ListTile(
                            title: const Text(
                              'Confirm it’s you',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.normal),
                            ),
                            leading: IconButton(
                              icon: SvgPicture.asset(
                                  'assets/images/rectangle.svg'),
                              onPressed: () {
                                model.toPop(context);
                              },
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 19, vertical: 23),
                          child: Center(
                            child: Column(
                              children: [
                                const Text(
                                  'Please, enter the code we sent your email to confirm this action',
                                  style: TextStyle(fontSize: 24),
                                  textAlign: TextAlign.center,
                                ),
                                UIHelper.verticalSpace(18),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 83),
                                  child: PinCodeTextField(
                                    appContext: context,
                                    length: 4,
                                    obscureText: false,
                                    animationType: AnimationType.fade,

                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    pinTheme: PinTheme(
                                      selectedFillColor:
                                          const Color(0xFFF4F4F4),
                                      borderWidth: 0,
                                      shape: PinCodeFieldShape.box,
                                      borderRadius: BorderRadius.circular(5),
                                      fieldHeight: 50,
                                      fieldWidth: 40,
                                      activeFillColor: const Color(0xFFF4F4F4),
                                      inactiveColor: const Color(0xFFF4F4F4),
                                    ),

                                    animationDuration:
                                        const Duration(milliseconds: 300),
                                    backgroundColor: Colors.white,
                                    enableActiveFill: true,
                                    // errorAnimationController: errorController,
                                    controller: model.confrimCheckCtrl,
                                    onCompleted: (value) {
                                      print("Completed");
                                      if (value ==
                                          model.confrimCheckCtrl.text) {
                                        model.toSavelogin(context);
                                      }
                                    },
                                    onChanged: (value) {
                                      print(value);
                                      setState(() {
                                        model.toSavelogin(context);
                                      });
                                    },
                                    beforeTextPaste: (text) {
                                      print("Allowing to paste $text");

                                      return true;
                                    },
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Didn’t recieve code?',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: AppColors.textColor),
                                    ),
                                    TextButton(
                                      child: Text('Send again',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: AppColors.primaryColor,
                                              decoration:
                                                  TextDecoration.underline)),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        DefButton(
                          text: 'Change',
                          press: () {},
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }

  void setState(Function() param0) {}
}
