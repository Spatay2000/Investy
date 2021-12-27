import 'package:flutter/material.dart';
import 'package:investy/base/base_bloc.dart';

class CardUpdateProvider extends BaseBloc {
  final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  late String _strPhoneNums;

  String get lastPhoneNum => _strPhoneNums;

  TextEditingController cardNumCtrl = TextEditingController();
  late String _strDateNums;

  String get lastDateNume => _strDateNums;

  TextEditingController dateNumCtrl = TextEditingController();
  late String _strCvcNums;

  String get lastCvcNume => _strCvcNums;

  TextEditingController cvcNumCtrl = TextEditingController();

  bool isButtonEnabled = false;

  init(BuildContext context) async {
    setLoading(true);
    Future.delayed(Duration(seconds: 2), () {
      setLoading(false);
      notifyListeners();
    });
  }

  isValida() {
    // print("is valid called");
    // print(loginCtrl.text);
    // print(passCtrl.text);
    if (cardNumCtrl.text.length == 20 &&
        dateNumCtrl.text.length == 5 &&
        cvcNumCtrl.text.length == 3) {
      setIsButtonEnabled(true);
    } else {
      setIsButtonEnabled(false);
    }
  }

  // toCardBottomSheet(BuildContext context) {
  //   Navigator.push(context,
  //       MaterialPageRoute(builder: (context) => const CardBottomSheet()));
  //   //TODO write login service
  // }

  setIsButtonEnabled(bool value) {
    print("is button state changed $value");
    isButtonEnabled = value;
    notifyListeners();
  }
}
