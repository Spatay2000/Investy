import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investy/base/base_provider.dart';
import 'package:investy/presentation/home/provider/filter_provider.dart';
import 'package:investy/presentation/home/provider/loan_amount_provider.dart';
import 'package:investy/presentation/home/ui/filter.dart';
import 'package:investy/shared/theme.dart';
import 'package:investy/widgets/loading_view.dart';
import 'package:investy/widgets/next_button.dart';

class LoanAmountPage extends StatelessWidget {
  final FilterProvider filterProvider;

  const LoanAmountPage({required this.filterProvider});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BaseProvider<LoanAmaountProvider>(
        model: LoanAmaountProvider(),
        builder: (context, model, child) {
          return model.isLoading
              ? LoadingView()
              : Scaffold(
                  bottomNavigationBar: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DefButton(
                      text: 'Save',
                      press: () {
                        model.toAgainFilterPage(context, filterProvider);
                      },
                    ),
                  ),
                  resizeToAvoidBottomInset: false,
                  body: SafeArea(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 28,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: SvgPicture.asset(
                                'assets/images/rectangle.svg',
                                height: 40,
                                width: 40,
                              ),
                            ),
                            const Text(
                              'Loan amount',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            TextButton(
                              onPressed: model.isResetActivated
                                  ? () {
                                      model.reset();
                                    }
                                  : null,
                              child: Text(
                                'Reset',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: model.isResetActivated
                                      ? AppColors.primaryColor
                                      : AppColors.kInActiveColor,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 34,
                        ),
                        Column(
                          children: [
                            ListView.builder(
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    model.toggleCheck(index);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 10),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              model.array[index].name,
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                            model.array[index].isChecked
                                                ? SvgPicture.asset(
                                                    'assets/images/ic_tick.svg')
                                                : const SizedBox(),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        divider(),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              itemCount: model.array.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                            ),
                            const SizedBox(
                              height: 223,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
