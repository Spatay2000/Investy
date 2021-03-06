import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investy/base/base_provider.dart';
import 'package:investy/presentation/login/provider/register_provider.dart';
import 'package:investy/presentation/login/ui/code_verify.dart';
import 'package:investy/presentation/login/ui/login.dart';
import 'package:investy/shared/theme.dart';
import 'package:investy/widgets/next_button.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<RegisterProvider>(
        model: RegisterProvider(),
        onReady: (value) async => await value.init(context),
        builder: (context, model, child) {
          return SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                backgroundColor: AppColors.whiteColor,
                appBar: AppBar(
                  backgroundColor: AppColors.whiteColor,
                  elevation: 0,
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: AppColors.primaryColor, fontSize: 20.0),
                      ),
                    )
                  ],
                ),
                body: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(
                          flex: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Sign up",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.whiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0xffE5E5E5),
                                        offset: Offset(0, 4),
                                        blurRadius: 1)
                                  ]),
                              width: model.size!.width,
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                inputFormatters: [model.loginMasked],
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelStyle:
                                      TextStyle(color: AppColors.primaryColor),
                                  label: Text('Email'),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.whiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0xffE5E5E5),
                                        offset: Offset(0, 4),
                                        blurRadius: 1)
                                  ]),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.remove_red_eye_outlined),
                                    onPressed: () {},
                                  ),
                                  border: InputBorder.none,
                                  labelStyle:
                                      TextStyle(color: AppColors.primaryColor),
                                  label: Text("Password"),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.whiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0xffE5E5E5),
                                        offset: Offset(0, 4),
                                        blurRadius: 1)
                                  ]),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelStyle:
                                      TextStyle(color: AppColors.primaryColor),
                                  label: Text("Repeat Password"),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => model.setIsAgreed(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              model.isAgreed
                                  ? SvgPicture.asset(
                                      'assets/images/checkbox.svg')
                                  : SvgPicture.asset('assets/images/empty.svg'),
                              Text(
                                "I agree to investy Terms of Use and Privacy \nPolicy",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: AppColors.kpColor, fontSize: 14.0),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        ButtonNext(
                          navigatePage: CodeVerify(
                            numField: '',
                          ),
                          text: 'Next',
                          press: () {},
                        ),
                        Spacer(flex: 5),
                        Column(
                          children: [
                            Text(
                              "or sign in with",
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon:
                                      SvgPicture.asset(SvgImages.googleImages),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon:
                                      SvgPicture.asset(SvgImages.twitterImages),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: SvgPicture.asset(
                                      SvgImages.facebookImages),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: SvgPicture.asset(SvgImages.appleImages),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
