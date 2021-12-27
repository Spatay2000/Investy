import 'package:flutter/material.dart';
import 'package:investy/base/base_provider.dart';
import 'package:investy/presentation/investments/provider/investments_provider.dart';
import 'package:investy/shared/helper.dart';
import 'package:investy/shared/theme.dart';
import 'package:investy/widgets/loading_view.dart';

import 'invest.dart';

class InvestmetsPage extends StatelessWidget {
  const InvestmetsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BaseProvider<InvestmentsProvider>(
        model: InvestmentsProvider(),
        builder: (context, model, child) {
          return model.isLoading
              ? LoadingView()
              : Scaffold(
                  backgroundColor: AppColors.whiteColor,
                  resizeToAvoidBottomInset: false,
                  appBar: AppBar(
                    toolbarHeight: 70,
                    elevation: 0,
                    backgroundColor: Colors.white,
                    centerTitle: true,
                    title: const Text(
                      'Investments',
                      style:
                          TextStyle(fontSize: 20, color: AppColors.textColor),
                    ),
                  ),
                  body: SafeArea(
                    child: Column(
                      children: [
                        UIHelper.verticalSpace(15),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ExpansionTile(
                            title: const Text(
                              'Active investments',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.textColor,
                              ),
                            ),
                            children: [
                              UIHelper.verticalSpace(15),
                              contListTile(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          InvestProviderPage()),
                                );
                              }),
                              UIHelper.verticalSpace(15),
                              contListTile(() {}),
                              SizedBox(height: 10)
                            ],
                          ),
                        ),
                        UIHelper.verticalSpace(15),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ExpansionTile(
                            title: const Text(
                              'Last invested',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.textColor,
                              ),
                            ),
                            children: [
                              UIHelper.verticalSpace(15),
                              contListTile(() {}),
                              UIHelper.verticalSpace(15),
                              contListTile(() {}),
                              SizedBox(height: 10)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }

  Container contListTile(Function? Function() ontap) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: EdgeInsets.only(
        left: 32,
        right: 32,
      ),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(2),
        boxShadow: [
          BoxShadow(
            color: AppColors.kshadow,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          UIHelper.verticalSpace(20),
          ListTile(
              onTap: ontap,
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'NEO Tech',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '02.06.2021 >89 days left',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kGrayText),
                  ),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text('\$20K',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor)),
                  Text('\$20K',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.green)),
                ],
              ))
        ],
      ),
    );
  }
}
