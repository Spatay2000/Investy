import 'package:flutter/material.dart';
import 'package:investy/widgets/provider.dart';
import 'package:provider/provider.dart';

class IndexScreen extends StatefulWidget {
  @override
  State<IndexScreen> createState() => _MainPageState();
}

class _MainPageState extends State<IndexScreen> {
  @override
  Widget build(BuildContext context) {
    DataProvider dataProvider = Provider.of<DataProvider>(context);
    return Scaffold(
        bottomNavigationBar: getBottomBar(dataProvider, context),
        backgroundColor: Colors.white,
        body: dataProvider.pages[dataProvider.bottomNavIndex]);
  }
}
