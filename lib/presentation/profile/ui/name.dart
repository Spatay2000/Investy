import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investy/base/base_provider.dart';
import 'package:investy/presentation/profile/provider/name_provider.dart';
import 'package:investy/presentation/profile/provider/profile_provider.dart';
import 'package:investy/shared/helper.dart';
import 'package:investy/widgets/loading_view.dart';
import 'package:investy/widgets/next_button.dart';

class SetYourNamePage extends StatelessWidget {
  final ProfileProvider profileProvider;
  const SetYourNamePage({required this.profileProvider});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BaseProvider<SetYourNameProvider>(
          model: SetYourNameProvider(),
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
                              'Set your name',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal),
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
                          padding: const EdgeInsets.symmetric(
                              vertical: 23, horizontal: 23),
                          child: Column(
                            children: [
                              TextFormField(
                                onChanged: (value) {
                                  model.isValid();
                                },
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  labelText: 'First Name',
                                ),
                                controller: model.fNameCtrl,
                              ),
                              UIHelper.verticalSpace(20),
                              TextFormField(
                                onChanged: (value) {
                                  model.isValid();
                                },
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  labelText: 'Last Name',
                                ),
                                controller: model.sNameCtrl,
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
                                        // log(model.nameCtrl.text);
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
