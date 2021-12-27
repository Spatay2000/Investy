import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investy/base/base_provider.dart';
import 'package:investy/presentation/wallet/provider/update_balance_provider.dart';
import 'package:investy/shared/helper.dart';
import 'package:investy/shared/theme.dart';
import 'package:investy/widgets/loading_view.dart';
import 'package:investy/widgets/next_button.dart';

class UpdateBalance extends StatelessWidget {
  const UpdateBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BaseProvider<UpdateProvider>(
          model: UpdateProvider(),
          builder: (context, model, child) {
            return model.isLoading
                ? LoadingView()
                : Scaffold(
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
                              onChanged: (value) {
                                model.isValida();
                              },
                              controller: model.numCtrl,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  labelText: 'Update amount',
                                  hintText: '0',
                                  prefix: const Text('\$')),
                            ),
                          ),
                          Spacer(),
                          DefButton(
                              text: 'Next',
                              press: model.isButtonEnabled
                                  ? () {
                                      model.toCardUpdate(context);
                                    }
                                  : () {
                                      model.toCardUpdate(context);
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
