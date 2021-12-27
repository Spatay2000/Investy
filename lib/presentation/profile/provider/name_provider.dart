import 'package:flutter/material.dart';
import 'package:investy/base/base_bloc.dart';

import 'profile_provider.dart';

class SetYourNameProvider extends BaseBloc {
  TextEditingController fNameCtrl = TextEditingController();
  TextEditingController sNameCtrl = TextEditingController();
  bool isButtonEnabled = false;

  toPopContext(BuildContext context) {
    Navigator.pop(context);
  }

  init() {
    setLoading(true);
    //Write some initial methods
    setLoading(false);
  }

  setIsButtonEnabled(bool value) {
    print("is button state changed $value");
    isButtonEnabled = value;
    notifyListeners();
  }

  isValid() {
    // print("is valid called");
    // print(loginCtrl.text);
    // print(passCtrl.text);
    if (fNameCtrl.text.isNotEmpty && sNameCtrl.text.isNotEmpty) {
      setIsButtonEnabled(true);
    } else {
      setIsButtonEnabled(false);
    }
  }

  toSavelogin(BuildContext context, ProfileProvider profileProvider) {
    profileProvider.setFullName("${fNameCtrl.text} ${sNameCtrl.text}");
    Navigator.pop(context);
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => ProfilePage()));
    //TODO write login service
  }
}
