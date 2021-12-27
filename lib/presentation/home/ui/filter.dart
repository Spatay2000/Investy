import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investy/base/base_provider.dart';
import 'package:investy/presentation/home/provider/filter_provider.dart';
import 'package:investy/presentation/home/ui/home.dart';
import 'package:investy/presentation/home/ui/provide.dart';
import 'package:investy/shared/theme.dart';
import 'package:investy/widgets/loading_view.dart';
import 'package:investy/widgets/next_button.dart';

class FilterPage extends StatelessWidget {
  final String? listTile;
  const FilterPage({this.listTile});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BaseProvider<FilterProvider>(
        model: FilterProvider(),
        builder: (context, model, child) {
          return model.isLoading
              ? LoadingView()
              : Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 28,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 25,
                              ),
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
                              SizedBox(
                                width: 105,
                              ),
                              const Text(
                                'Filter',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(
                                width: 102,
                              ),
                              TextButton(
                                onPressed: () {
                                  model.resetFilter(context);
                                },
                                child: const Text(
                                  'Reset',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF999999),
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
                              Listile_Custom(
                                ontap: () {
                                  model.toAmount(context);
                                },
                                title: 'Loan amount',
                                subtitle: model.getNameOfLoanAmountsList(),
                              ),
                              divider(),
                              Listile_Custom(
                                title: 'Repayment days',
                                ontap: () {
                                  model.toRepayment(context);
                                },
                                subtitle: "",
                              ),
                              divider(),
                              Listile_Custom(
                                title: 'Benefit amount',
                                ontap: () {
                                  model.toBenefitAmount(context);
                                },
                                subtitle: "",
                              ),
                              divider(),
                              Listile_Custom(
                                title: 'Product type',
                                ontap: () {
                                  model.toProductType(context);
                                },
                                subtitle: "",
                              ),
                              divider(),
                              Listile_Custom(
                                title: 'Wholesale and trading areas',
                                ontap: () {
                                  model.toLesale(context);
                                },
                                subtitle: "",
                              ),
                              divider(),
                              // const SizedBox(height: 284,),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  bottomNavigationBar: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ButtonNext(
                        navigatePage: ProviderPage(
                          isButton: false,
                          numField: '',
                        ),
                        text: 'Apply',
                        press: () {}),
                  ));
        },
      ),
    );
  }
}

Divider divider() {
  return const Divider(
    height: 10,
    thickness: 3,
    indent: 20,
    endIndent: 20,
    color: Color(0xFFE4E4E4),
  );
}

class Listile_Custom extends StatelessWidget {
  final String title;
  String? subtitle;
  final Function() ontap;
  Listile_Custom({required this.title, this.subtitle, required this.ontap});

  @override
  Widget build(
    BuildContext context,
  ) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      subtitle: Text(
        subtitle!,
        style: const TextStyle(fontSize: 14),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 17,
      ),
      onTap: ontap,
    );
  }
}
