import 'package:flutter/material.dart';
import 'package:investy/base/base_bloc.dart';
import 'package:investy/presentation/profile/ui/name.dart';
import 'package:investy/presentation/profile/ui/password.dart';
import 'package:investy/presentation/profile/ui/phone.dart';

class ProfileProvider extends BaseBloc {
  final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  String fullName = "Set your name";

  String subTile = '';

  bool isButtonEnabled = false;

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

  setFullName(String value) {
    fullName = value;
    notifyListeners();
  }

  setSubTile(String value) {
    subTile = value;
    notifyListeners();
  }

  toSavelogin(BuildContext context) {
    Navigator.pop(context);
  }

  toPopContext(BuildContext context) {
    Navigator.pop(context);
  }

  toSetYourName(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SetYourNamePage(
                profileProvider: this,
              )),
    );
  }

  toAddPhoneNumber(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AddPhoneNumber(
                profileProvider: this,
              )),
    );
  }

  toChangePassord(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChangePasswordPage()),
    );
  }
}
