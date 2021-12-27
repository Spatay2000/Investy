import 'package:flutter/material.dart';
import 'package:investy/base/base_bloc.dart';
import 'package:investy/presentation/home/ui/provide.dart';

class RateProvider extends BaseBloc {
  final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  TextEditingController commentCtrl = TextEditingController();

  init(BuildContext context) async {
    setLoading(true);
    Future.delayed(Duration(seconds: 2), () {
      setLoading(false);
      notifyListeners();
    });
  }

  toProviderPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ProviderPage(isButton: false, numField: commentCtrl.text)));
    //TODO write login service
  }
}
