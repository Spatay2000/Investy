import 'package:flutter/material.dart';
import 'package:investy/base/base_bloc.dart';
import 'package:investy/presentation/wallet/ui/card_update.dart';

class UpdateProvider extends BaseBloc {
  final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  late String _strNums;

  String get lastName => _strNums;

  TextEditingController numCtrl = TextEditingController();

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
    if (numCtrl.text.isNotEmpty) {
      setIsButtonEnabled(true);
    } else {
      setIsButtonEnabled(false);
    }
  }

  toCardUpdate(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CardUpdate()));
    //TODO write login service
  }

  setIsButtonEnabled(bool value) {
    print("is button state changed $value");
    isButtonEnabled = value;
    notifyListeners();
  }
}
