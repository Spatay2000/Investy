import 'package:flutter/material.dart';
import 'package:investy/presentation/home/provider/provide_provider.dart';
import 'package:investy/shared/theme.dart';
import 'package:investy/widgets/confirm.dart';
import 'package:investy/widgets/loading_view.dart';
import 'package:investy/widgets/next_button.dart';

class ShowBottomScreen extends StatelessWidget {
  final ProvideProvider? model;

  const ShowBottomScreen({Key? key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: model!.isLoading
            ? LoadingView()
            : Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45.79),
                        topRight: Radius.circular(45.79))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25, top: 23),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Let’s calculate',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 44,
                          ),
                          Row(
                            children: [
                              const Text(
                                'Your investment',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                width: 150,
                              ),
                              SizedBox(
                                width: 78,
                                height: 40,
                                child: TextFormField(
                                  textAlign: TextAlign.start,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  controller: model!.moneyCtrl,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 44,
                          ),
                          Row(
                            children: const [
                              Text(
                                'Discount',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                width: 230,
                              ),
                              Text('-15%', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          const SizedBox(
                            height: 44,
                          ),
                          Row(
                            children: const [
                              Text(
                                'Loan period',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                width: 190,
                              ),
                              Text('90 days', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          const SizedBox(
                            height: 44,
                          ),
                          Row(
                            children: const [
                              Text(
                                'Your earnings',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                width: 174,
                              ),
                              Text('+\$1 500',
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xFF00CC66))),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 72,
                    ),
                    DefButton(
                      text: 'Invest \$${model!.moneyCtrl.text}',
                      press: () {},
                    )
                  ],
                ),
              ));
  }
}
