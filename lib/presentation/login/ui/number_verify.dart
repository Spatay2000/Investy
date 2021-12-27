import 'package:flutter/material.dart';
import 'package:investy/base/base_provider.dart';
import 'package:investy/presentation/home/ui/home.dart';
import 'package:investy/presentation/login/provider/number_verify_provider.dart';
import 'package:investy/presentation/login/ui/login.dart';
import 'package:investy/presentation/login/ui/register.dart';
import 'package:investy/shared/theme.dart';
import 'package:investy/widgets/app_bar_with_back.dart';
import 'package:investy/widgets/loading_view.dart';
import 'package:investy/widgets/next_button.dart';

class NumberVerify extends StatelessWidget {
  late final String numField;
  NumberVerify({required this.numField});

  bool isHidden = false;
  var currentText = "1234";

  @override
  Widget build(BuildContext context) {
    return BaseProvider<NumberVerifyProvider>(
        model: NumberVerifyProvider(),
        onReady: (v) => v.init(context),
        builder: (context, model, child) {
          return model.isLoading
              ? LoadingView()
              : Scaffold(
                  appBar: appBarWithBack(context),
                  bottomNavigationBar: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ButtonNext(
                      navigatePage: LoginPage(),
                      text: 'Next',
                      press: () {},
                    ),
                  ),
                  backgroundColor: AppColors.whiteColor,
                  body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Enter your social number',
                            style: TextStyle(
                                color: AppColors.textColor, fontSize: 20.0)),
                        SizedBox(height: 10),
                        Text(
                            "The US Government requires your SSN IN \n order to open an invenstment account"),
                        SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            labelText: 'Social number',
                          ),
                          controller: model.numCtrl,
                          onChanged: (value) {
                            model.isValid();
                          },
                        ),
                        SizedBox(height: 10),
                        Text("All your information is protected.",
                            textAlign: TextAlign.start),
                      ],
                    ),
                  ),
                );
        });
  }
}
