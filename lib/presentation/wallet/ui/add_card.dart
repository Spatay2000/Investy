import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investy/base/base_provider.dart';
import 'package:investy/presentation/home/ui/filter.dart';
import 'package:investy/presentation/wallet/provider/add_card_provider.dart';
import 'package:investy/shared/helper.dart';
import 'package:investy/shared/theme.dart';
import 'package:investy/widgets/card_bottom_sheet.dart';
import 'package:investy/widgets/loading_view.dart';
import 'package:investy/widgets/next_button.dart';

import 'card_update.dart';

class AddCardPage extends StatelessWidget {
  const AddCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BaseProvider<AddCardProvider>(
          model: AddCardProvider(),
          builder: (context, model, child) {
            return model.isLoading
                ? LoadingView()
                : Scaffold(
                    body: SafeArea(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 28,
                          ),
                          CustomScaffold(context),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 23),
                            child: Column(
                              children: [
                                UIHelper.verticalSpace(23),
                                listTileCard(context),
                                divider(),
                                UIHelper.verticalSpace(23),
                                listTileCard(context),
                                divider(),
                                UIHelper.verticalSpace(23),
                                listTileCard(context),
                                divider(),
                                ListTile(
                                  title: Text(
                                    ('Add Card'),
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  trailing: const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CardUpdate()),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DefButton(
                              text: 'Update',
                              press: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return const CardBottomSheet();
                                    });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  );
          }),
    );
  }

  ListTile listTileCard(BuildContext context) {
    return ListTile(
      title: Text(
        ('1234'),
        style: const TextStyle(fontSize: 16),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(top: 3),
        child: SvgPicture.asset(
          'assets/images/visa-logo.svg',
          height: 16,
        ),
      ),
      // subtitle: Text(
      //   subtitle!,
      //   style: const TextStyle(fontSize: 17),
      // ),
      // leading: Text(
      //   text,
      //   style: const TextStyle(fontSize: 23),
      // ),
      trailing: SvgPicture.asset('assets/images/ic_tick.svg'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CardUpdate()),
        );
      },
    );
  }

  Row CustomScaffold(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 25,
        ),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset('assets/images/rectangle.svg'),
        ),
        SizedBox(
          width: 65,
        ),
        const Text(
          'Update balance',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          width: 57,
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Edit',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
