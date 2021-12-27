import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:investy/presentation/home/ui/home.dart';
import 'package:investy/presentation/investments/ui/investments.dart';
import 'package:investy/presentation/login/ui/login.dart';
import 'package:investy/presentation/profile/ui/profile.dart';
import 'package:investy/presentation/wallet/ui/wallet.dart';
import 'package:investy/shared/theme.dart';

class DataProvider extends ChangeNotifier {
  String appBarTitle = 'Main Page';
  var _bottomNavIndex = 0;
  List<Widget> _pages = [
    HomePage(),
    WalletPage(),
    InvestmetsPage(),
    ProfilePage()
  ];

  List<String> _appBarTitles = ['Main Page', 'Wallet', 'Investment', 'Profile'];
  List<String> get appBarTitles => _appBarTitles;
  List<Widget> get pages => _pages;
  get bottomNavIndex => _bottomNavIndex;

  setBottomNavIndex(value) {
    _bottomNavIndex = value;
    notifyListeners();
  }
}

const kBottomNavIconList = <IconData>[
  Icons.home,
  Icons.wallet_giftcard,
  Icons.inbox,
  Icons.person
];

AnimatedBottomNavigationBar getBottomBar(DataProvider provider, context) {
  // DataProvider dataProvider = Provider.of<DataProvider>(context);
  return AnimatedBottomNavigationBar(
    icons: kBottomNavIconList,
    inactiveColor: AppColors.bottomIconColor,
    activeColor: AppColors.primaryColor,
    gapLocation: GapLocation.none,
    activeIndex: provider._bottomNavIndex,
    onTap: (index) => provider.setBottomNavIndex(index),
  );
}
