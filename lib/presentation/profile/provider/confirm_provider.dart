import 'package:flutter/material.dart';
import 'package:investy/base/base_bloc.dart';
import 'package:investy/presentation/profile/ui/confirm.dart';
import 'package:investy/presentation/profile/ui/profile.dart';

class ConfirmProvider extends BaseBloc {
  final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  late String _strConfirm;

  String get confirmCheck => _strConfirm;

  TextEditingController confrimCheckCtrl = TextEditingController();

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
    if (confrimCheckCtrl.text.length == 1234) {
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

  toSavelogin(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProfilePage()));
    //TODO write login service
  }

  setIsButtonEnabled(bool value) {
    print("is button state changed $value");
    isButtonEnabled = value;
    notifyListeners();
  }
}
