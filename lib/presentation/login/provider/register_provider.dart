import 'package:flutter/cupertino.dart';
import 'package:investy/base/base_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterProvider extends BaseBloc {
  Size? size;
  bool isAgreed = false;

  var loginMasked = MaskTextInputFormatter(mask: '', filter: {"#": RegExp("")});

  init(BuildContext context) async {
    size = MediaQuery.of(context).size;
  }

  setIsAgreed() {
    isAgreed = !isAgreed;
    notifyListeners();
  }
}
