import 'package:flutter/material.dart';
import 'package:investy/base/base_bloc.dart';
import 'package:investy/widgets/confirm.dart';

class ProvideProvider extends BaseBloc {
  final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  TextEditingController moneyCtrl = TextEditingController();
  init(BuildContext context) async {
    setLoading(true);
    Future.delayed(Duration(seconds: 2), () {
      setLoading(false);
      notifyListeners();
    });
    toConfirm(BuildContext context) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ConfirmPage()));
      //TODO write login service
    }
  }
}
