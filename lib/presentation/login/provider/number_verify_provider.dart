import 'package:flutter/material.dart';
import 'package:investy/base/base_bloc.dart';

class NumberVerifyProvider extends BaseBloc {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  late String _stringNum;

  String get firstName => _stringNum;
  TextEditingController numCtrl = TextEditingController();
  Size? size;
  bool isButtonEnabled = false;

  init(BuildContext context) async {
    size = MediaQuery.of(context).size;
  }

  isValid() {
    if (numCtrl.text.length >= 12) {
      setIsButtonEnabled(true);
    } else {
      setIsButtonEnabled(false);
    }
  }

  setIsButtonEnabled(bool value) {
    print("is button state changed $value");
    isButtonEnabled = value;
    notifyListeners();
  }
}
