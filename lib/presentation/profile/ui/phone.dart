import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investy/base/base_provider.dart';
import 'package:investy/presentation/profile/provider/phone_provider.dart';
import 'package:investy/presentation/profile/provider/profile_provider.dart';
import 'package:investy/shared/theme.dart';
import 'package:investy/widgets/loading_view.dart';
import 'package:investy/widgets/next_button.dart';

class AddPhoneNumber extends StatelessWidget {
  final ProfileProvider profileProvider;
  const AddPhoneNumber({required this.profileProvider});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BaseProvider<PhoneProvider>(
          model: PhoneProvider()..init(),
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
                              'Add phone number',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.normal),
                            ),
                            leading: IconButton(
                              icon: SvgPicture.asset(
                                  'assets/images/rectangle.svg'),
                              onPressed: () {
                                model.toPopContext(context);
                              },
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 23, horizontal: 23),
                          child: TextFormField(
                            onChanged: (value) {
                              model.isValid();
                            },
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              labelText: 'Phone number',
                              prefix: Text('+1'),
                            ),
                            controller: model.phoneCtrl,
                          ),
                        ),
                        Spacer(),
                        Container(
                            margin: const EdgeInsets.only(bottom: 23),
                            child: DefButton(
                                text: 'Save',
                                press: model.isButtonEnabled
                                    ? () {
                                        model.toSavelogin(
                                            context, profileProvider);
                                      }
                                    : model.toSavelogin(
                                        context, profileProvider)))
                      ],
                    ),
                  );
          }),
    );
  }
}
