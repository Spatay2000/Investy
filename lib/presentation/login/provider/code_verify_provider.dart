import 'package:flutter/cupertino.dart';
import 'package:investy/base/base_bloc.dart';
import 'package:investy/base/base_provider.dart';

class CodeVerifyProvider extends BaseBloc {
  Size? size;

  init(BuildContext context) async {
    size = MediaQuery.of(context).size;
    setLoading(true);
    Future.delayed(Duration(seconds: 2), () {
      setLoading(false);
      notifyListeners();
    });
  }
}
