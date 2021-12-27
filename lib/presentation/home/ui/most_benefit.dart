import 'package:flutter/material.dart';
import 'package:investy/base/base_provider.dart';
import 'package:investy/presentation/home/provider/most_benefit_provider.dart';
import 'package:investy/shared/theme.dart';
import 'package:investy/widgets/loading_view.dart';

class MostBenefit extends StatelessWidget {
  const MostBenefit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.whiteColor,
          title: Text('Most Benefit',
              style: TextStyle(color: AppColors.textColor)),
          centerTitle: false,
        ),
        body: BaseProvider<MostBenefitProvider>(
            model: MostBenefitProvider(),
            onReady: (v) => v.init(context),
            builder: (context, model, child) {
              return model.isLoading ? LoadingView() : LoadingView();
            }));
  }
}
