import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investy/base/base_provider.dart';
import 'package:investy/presentation/wallet/provider/card_update_provider.dart';
import 'package:investy/shared/helper.dart';
import 'package:investy/shared/theme.dart';
import 'package:investy/widgets/card_bottom_sheet.dart';
import 'package:investy/widgets/loading_view.dart';
import 'package:investy/widgets/next_button.dart';

class CardUpdate extends StatelessWidget {
  const CardUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BaseProvider<CardUpdateProvider>(
          model: CardUpdateProvider(),
          builder: (context, model, child) {
            return model.isLoading
                ? LoadingView()
                : Scaffold(
                    resizeToAvoidBottomInset: false,
                    appBar: AppBar(
                      centerTitle: true,
                      toolbarHeight: 70,
                      elevation: 0,
                      backgroundColor: Colors.white,
                      title: const Text(
                        'Update balance',
                        style:
                            TextStyle(fontSize: 16, color: AppColors.textColor),
                      ),
                      leading: IconButton(
                        icon: SvgPicture.asset('assets/images/rectangle.svg'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    body: SafeArea(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 23, horizontal: 23),
                            child: TextFormField(
                              inputFormatters: [
                                MaskedInputFormatter(' #### #### #### ####')
                              ],
                              keyboardType: TextInputType.number,
                              maxLength: 20,
                              onChanged: (value) {
                                model.isValida();
                              },
                              controller: model.cardNumCtrl,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                labelText: 'Card number',
                                hintText: '|1234 1234 1234 1234',
                              ),

                              // controller: model.loginCtrl,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 158,
                                height: 60,
                                child: TextFormField(
                                  //     inputFormatters: [
                                  //   MaskedInputFormatter(' /')
                                  // ],
                                  keyboardType: TextInputType.number,
                                  maxLength: 5,
                                  onChanged: (value) {
                                    model.isValida();
                                  },
                                  controller: model.dateNumCtrl,
                                  textAlign: TextAlign.start,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    labelText: 'Expiration date',
                                    hintText: '|MM/YY',
                                  ),

                                  // controller: model.loginCtrl,
                                ),
                              ),
                              SizedBox(
                                width: 158,
                                height: 60,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,

                                  maxLength: 3,
                                  onChanged: (value) {
                                    model.isValida();
                                  },
                                  controller: model.cvcNumCtrl,
                                  textAlign: TextAlign.start,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    labelText: 'CVV/CVC',
                                    hintText: 'CVV/CVC',
                                  ),

                                  // controller: model.loginCtrl,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          DefButton(
                              text: 'Next',
                              press: model.isButtonEnabled
                                  ? () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return const CardBottomSheet();
                                          });
                                    }
                                  : () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return const CardBottomSheet();
                                          });
                                    }),
                          UIHelper.verticalSpace(20),
                        ],
                      ),
                    ),
                  );
          }),
    );
  }
}
