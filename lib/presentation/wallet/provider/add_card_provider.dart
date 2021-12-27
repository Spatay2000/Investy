import 'package:flutter/material.dart';
import 'package:investy/base/base_bloc.dart';
import 'package:investy/widgets/card_bottom_sheet.dart';

class AddCardProvider extends BaseBloc {
  toUpdate(
    BuildContext context,
  ) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CardBottomSheet()));
  }

  init(BuildContext context) async {
    setLoading(true);
    Future.delayed(Duration(seconds: 2), () {
      setLoading(false);
      notifyListeners();
    });
  }
}
