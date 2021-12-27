import 'package:flutter/material.dart';
import 'package:investy/base/base_bloc.dart';

import 'profile_provider.dart';

class PhoneProvider extends BaseBloc {
  TextEditingController phoneCtrl = TextEditingController();

  bool isButtonEnabled = false;

  init() {
    setLoading(true);
    //Write some initial methods
    setLoading(false);
  }

  isValid() {
    if (phoneCtrl.text.length == 10) {
      setIsButtonEnabled(true);
    } else {
      setIsButtonEnabled(false);
    }
  }

  toSavelogin(BuildContext context, ProfileProvider profileProvider) {
    profileProvider.setSubTile(phoneCtrl.text);
    Navigator.pop(context);
    //TODO write login service
  }

  toPopContext(BuildContext context) {
    Navigator.pop(context);
  }

  setIsButtonEnabled(bool value) {
    print("is button state changed $value");
    isButtonEnabled = value;
    notifyListeners();
  }
}
