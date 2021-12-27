import 'package:flutter/cupertino.dart';
import 'package:investy/base/base_bloc.dart';
import 'package:investy/widgets/loading_view.dart';

class HomeProvider extends BaseBloc {
  init(BuildContext context) async {
    setLoading(true);
    Future.delayed(Duration(seconds: 2), () {
      setLoading(false);
      notifyListeners();
    });
  }
}
