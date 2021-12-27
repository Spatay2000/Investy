import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:investy/base/base_bloc.dart';
import 'package:investy/presentation/home/ui/home.dart';

import 'package:investy/widgets/loading_view.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginProvider extends BaseBloc {
  Size? size;

  var loginMasked = MaskTextInputFormatter(mask: '', filter: {"#": RegExp("")});

  init(BuildContext context) async {
    size = MediaQuery.of(context).size;
  }
}
