import 'package:flutter/material.dart';
import 'package:investy/base/base_bloc.dart';
import 'package:investy/base/base_provider.dart';

class NewestProvider extends BaseBloc {
  Size? size;

  init(BuildContext context) async {
    size = MediaQuery.of(context).size;
  }
}
