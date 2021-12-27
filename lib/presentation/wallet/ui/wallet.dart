import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investy/base/base_provider.dart';
import 'package:investy/presentation/wallet/provider/wallet_provider.dart';
import 'package:investy/shared/theme.dart';
import 'package:investy/widgets/loading_view.dart';

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BaseProvider<WalletProvider>(
        model: WalletProvider(),
        builder: (context, model, child) {
          return model.isLoading
              ? LoadingView()
              : Scaffold(
                  backgroundColor: Colors.white10,
                  appBar: AppBar(
                    title: const Text(
                      'Wallet',
                      style: TextStyle(
                        color: AppColors.textColor,
                      ),
                    ),
                    toolbarHeight: 60,
                    elevation: 0,
                    backgroundColor: Colors.white,
                    centerTitle: true,
                  ),
                  body: SafeArea(
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.04),
                          child: Column(
                            children: [
                              const Text(
                                'My balance',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.kGrayText),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                '\$10 000',
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textColor),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/images/incomes.svg',
                                            height: 15,
                                            width: 15,
                                          ),
                                          const Text(
                                            'Incomes',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: AppColors.kGrayText),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        '\$50 000',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: AppColors.textColor),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/images/outcomes.svg',
                                            height: 15,
                                            width: 15,
                                          ),
                                          const Text(
                                            'Outcomes',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: AppColors.kGrayText),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        '\$40 000',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: AppColors.textColor),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.1,
                          ),
                          width: 308,
                          height: 207,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                              bottomLeft: Radius.circular(13.0),
                              bottomRight: Radius.circular(13.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.kshadow,
                                blurRadius: 1,
                                spreadRadius: 1,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.02),
                          margin: const EdgeInsets.only(
                            top: 200,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.36,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Color(0xFFF9F5FF)),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ))),
                                    onPressed: () {},
                                    child: const Text(
                                      'Withdraw',
                                      style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: 16),
                                    )),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.36,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Color(0xFFF9F5FF)),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ))),
                                    onPressed: () {
                                      model.toUpdateBalance(context);
                                    },
                                    child: const Text(
                                      'Update',
                                      style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: 16),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.kshadow,
                                blurRadius: 1,
                                spreadRadius: 5,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          margin: const EdgeInsets.only(
                            top: 286,
                          ),
                          height: 413.0,
                          width: 400,
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      right: 260, top: 40),
                                  child: const Text(
                                    'History',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.textColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                listTile('Update account', '15.04.2021, 15:23',
                                    '+\$10 000', AppColors.primaryColor),
                                listTile(
                                    'Benefit from invesment',
                                    '14.04.2021, 10:45',
                                    '+\$10 000',
                                    Colors.green),
                                listTile('Withdraw money', '10.04.2021, 14:55',
                                    '-\$20 000', AppColors.textColor),
                                listTile('Update account', '09.04.2021, 11:27',
                                    '+\$10 000', AppColors.primaryColor),
                                listTile(
                                    'Benefit from invesment',
                                    '14.04.2021, 10:45',
                                    '+\$10 000',
                                    Colors.green),
                                listTile('Withdraw money', '10.04.2021, 14:55',
                                    '-\$20 000', AppColors.textColor),
                                listTile('Update account', '09.04.2021, 11:27',
                                    '+\$10 000', AppColors.primaryColor),
                              ],
                            ),
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

  ListTile listTile(
      String title, String subtitle, String trailing, Color color) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(color: AppColors.textColor, fontSize: 16),
      ),
      subtitle: Text(subtitle,
          style: const TextStyle(color: AppColors.kGrayText, fontSize: 14)),
      trailing: Text(trailing, style: TextStyle(color: color, fontSize: 16)),
    );
  }
}
