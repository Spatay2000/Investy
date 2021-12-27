import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investy/base/base_provider.dart';
import 'package:investy/presentation/profile/provider/pass_provider.dart';
import 'package:investy/shared/helper.dart';
import 'package:investy/shared/theme.dart';
import 'package:investy/widgets/loading_view.dart';
import 'package:investy/widgets/next_button.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BaseProvider<PasswordProvider>(
          model: PasswordProvider(),
          builder: (context, model, child) {
            return model.isLoading
                ? LoadingView()
                : Scaffold(
                    resizeToAvoidBottomInset: false,
                    body: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 63, right: 72),
                          child: ListTile(
                            title: const Text(
                              'Change password',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal),
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
                          padding: EdgeInsets.symmetric(
                              vertical: 23, horizontal: 23),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                obscureText: true,
                                onChanged: (value) {
                                  model.isValid();
                                },
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  labelText: 'Current password',
                                ),
                                controller: model.curPassCtrl,
                              ),
                              UIHelper.verticalSpace(10),
                              TextButton(
                                  onPressed: () {
                                    model.toConfirm(context);
                                  },
                                  child: const Text(
                                    'Forgot password?',
                                    style: TextStyle(
                                        color: AppColors.kGrayText,
                                        fontSize: 14),
                                  )),
                              UIHelper.verticalSpace(20),
                              TextFormField(
                                obscureText: true,
                                onChanged: (value) {
                                  model.isValid();
                                },
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  labelText: 'New password',
                                ),
                                controller: model.passCtrl,
                              ),
                              UIHelper.verticalSpace(20),
                              TextFormField(
                                obscureText: true,
// enableSuggestions: false,
// autocorrect: false,
                                onChanged: (value) {
                                  model.isValid();
                                },
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  labelText: 'Repeat password',
                                ),
                                controller: model.repeatPassCtrl,
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                            margin: const EdgeInsets.only(bottom: 23),
                            child: DefButton(
                                text: 'Save',
                                press: model.isButtonEnabled
                                    ? () {
                                        model.toPop(context);
                                      }
                                    : model.toPop(context)))
                      ],
                    ),
                  );
          }),
    );
  }
}
