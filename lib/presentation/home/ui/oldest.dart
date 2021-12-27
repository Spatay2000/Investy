import 'package:flutter/material.dart';
import 'package:investy/base/base_provider.dart';
import 'package:investy/presentation/home/provider/oldest_provider.dart';
import 'package:investy/shared/theme.dart';
import 'package:investy/widgets/loading_view.dart';

class Oldest extends StatelessWidget {
  const Oldest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.whiteColor,
          title: Text('Oldest', style: TextStyle(color: AppColors.textColor)),
          centerTitle: false,
        ),
        body: BaseProvider<OldestProvider>(
            model: OldestProvider(),
            onReady: (v) => v.init(context),
            builder: (context, model, child) {
              return model.isLoading ? LoadingView() : LoadingView();
            }));
  }
}
