import 'package:flutter/material.dart';
import 'package:investy/base/base_bloc.dart';

class RepaymentProvider extends BaseBloc {
  init(BuildContext context) async {
    setLoading(true);
    Future.delayed(Duration(seconds: 2), () {
      setLoading(false);
      notifyListeners();
    });
  }
}
