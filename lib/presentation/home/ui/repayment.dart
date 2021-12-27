import 'package:flutter/material.dart';
import 'package:investy/base/base_provider.dart';
import 'package:investy/presentation/home/provider/repayment_provider.dart';
import 'package:investy/shared/theme.dart';
import 'package:investy/widgets/loading_view.dart';

class Repayment extends StatelessWidget {
  const Repayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.whiteColor,
          title:
              Text('Repayment', style: TextStyle(color: AppColors.textColor)),
          centerTitle: false,
        ),
        body: BaseProvider<RepaymentProvider>(
            model: RepaymentProvider(),
            onReady: (v) => v.init(context),
            builder: (context, model, child) {
              return model.isLoading ? LoadingView() : LoadingView();
            }));
  }
}
