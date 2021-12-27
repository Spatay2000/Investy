import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:investy/presentation/home/ui/newest.dart';
import 'package:investy/presentation/index.dart';
import 'package:investy/presentation/login/ui/login.dart';
import 'package:investy/presentation/profile/provider/profile_provider.dart';
import 'package:investy/presentation/profile/ui/name.dart';
import 'package:investy/widgets/loading_view.dart';
import 'package:investy/widgets/provider.dart';
import 'package:provider/provider.dart';

import 'presentation/onboarding/ui/onboarding.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  late ProfileProvider? profileProvider;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => DataProvider(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false, home: IntroScreen()));
  }
}
