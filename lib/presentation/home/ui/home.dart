import 'package:flutter/material.dart';
import 'package:investy/base/base_provider.dart';
import 'package:investy/presentation/home/provider/home_provider.dart';
import 'package:investy/presentation/home/ui/benefit.dart';
import 'package:investy/presentation/home/ui/filter.dart';
import 'package:investy/presentation/home/ui/most_benefit.dart';
import 'package:investy/presentation/home/ui/newest.dart';
import 'package:investy/presentation/home/ui/oldest.dart';
import 'package:investy/presentation/home/ui/popular.dart';
import 'package:investy/presentation/login/ui/login.dart';

import 'package:investy/shared/theme.dart';
import 'package:investy/widgets/loading_view.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.whiteColor,
          title:
              Text('Main Page', style: TextStyle(color: AppColors.textColor)),
          centerTitle: true,
        ),
        backgroundColor: AppColors.whiteColor,
        body: BaseProvider<HomeProvider>(
            model: HomeProvider(),
            onReady: (v) => v.init(context),
            builder: (context, model, child) {
              return model.isLoading
                  ? LoadingView()
                  : Center(
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              hintText: 'Providers, offers....',
                              suffix: TextButton(
                                child: const Text(
                                  'Filter',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FilterPage()),
                                  );
                                },
                              ),
                            ),
                          ),
                          // const Divider(),
                          Container(
                            height: 0.1,
                            decoration: const BoxDecoration(
                              color: Colors.black12,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: DefaultTabController(
                              length: 4,
                              child: Scaffold(
                                appBar: AppBar(
                                  automaticallyImplyLeading: false,
                                  backgroundColor: AppColors.whiteColor,
                                  elevation: 0,
                                  toolbarHeight: 0,
                                  bottom: TabBar(
                                      labelColor: AppColors.textColor,
                                      isScrollable: true,
                                      tabs: [
                                        Tab(text: 'Newest'),
                                        Tab(text: 'Oldest'),
                                        Tab(text: 'Most benefit'),
                                        Tab(text: 'Popular')
                                      ]),
                                ),
                                body: TabBarView(
                                  children: [
                                    Newest(),
                                    Oldest(),
                                    Benefit(),
                                    Popular()
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
            }),
      ),
    );
  }
}
