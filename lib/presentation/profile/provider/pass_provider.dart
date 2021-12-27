import 'package:flutter/material.dart';
import 'package:investy/base/base_bloc.dart';
import 'package:investy/presentation/profile/ui/confirm.dart';

class PasswordProvider extends BaseBloc {
  final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  late String _strCurPassword;
  late String _strNewPassword;
  late String _strPasswordRepeat;

  String get curPassword => _strCurPassword;
  String get newPassword => _strNewPassword;
  String get repeatPassword => _strPasswordRepeat;

  TextEditingController curPassCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController repeatPassCtrl = TextEditingController();

  bool isButtonEnabled = false;

  init() {
    setLoading(true);
    //Write some initial methods
    setLoading(false);
  }

  isValid() {
    // print("is valid called");
    // print(loginCtrl.text);
    // print(passCtrl.text);
    if (curPassCtrl.text.length == 2 &&
        repeatPassCtrl.text.length == passCtrl.text.length &&
        passCtrl.text.length == 10) {
      setIsButtonEnabled(true);
    } else {
      setIsButtonEnabled(false);
    }
  }

  toPop(BuildContext context) {
    Navigator.pop(context);
    //TODO write login service
  }

  toConfirm(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ConfirmCheck()));
    //TODO write login service
  }
  //  toSavelogin(BuildContext context) {
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => ProfilePage()));
  //   //TODO write login service
  // }

  setIsButtonEnabled(bool value) {
    print("is button state changed $value");
    isButtonEnabled = value;
    notifyListeners();
  }
}
