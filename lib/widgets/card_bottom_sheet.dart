import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investy/presentation/home/ui/filter.dart';
import 'package:investy/presentation/wallet/ui/add_card.dart';
import 'package:investy/presentation/wallet/ui/delete_card.dart';
import 'package:investy/shared/helper.dart';
import 'package:investy/shared/theme.dart';
import 'package:investy/widgets/next_button.dart';

class CardBottomSheet extends StatelessWidget {
  const CardBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45.79),
              topRight: Radius.circular(45.79))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Update balance',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 34,
            ),
            const Text(
              'From',
              style: TextStyle(fontSize: 16),
            ),
            UIHelper.verticalSpace(10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.kshadow,
                    blurRadius: 5,
                    spreadRadius: 4,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ListTile(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return const CardsBottomSheet();
                      });
                },
                leading: Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: SvgPicture.asset(
                    'assets/images/visa-logo.svg',
                    height: 16,
                  ),
                ),
                title: const Text(
                  ' 1234',
                  style: TextStyle(fontSize: 16),
                ),
                trailing: Icon(Icons.keyboard_arrow_down_rounded),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              'To',
              style: TextStyle(fontSize: 16),
            ),
            UIHelper.verticalSpace(10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.kshadow,
                    blurRadius: 5,
                    spreadRadius: 4,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const ListTile(
                leading: Text(
                  ' My balance',
                  style: TextStyle(fontSize: 16),
                ),
                trailing: Text(
                  ' \$10 000',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            UIHelper.verticalSpace(10),
            const Divider(
              thickness: 2,
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: const ListTile(
                leading: Text(
                  ' You’re updating',
                  style: TextStyle(fontSize: 16),
                ),
                trailing: Text(
                  ' \$50 000',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            UIHelper.verticalSpace(34),
            DefButton(
              text: 'Confirm and update',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddCardPage()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class CardsBottomSheet extends StatelessWidget {
  const CardsBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45.79),
                topRight: Radius.circular(45.79))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Choose the card',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 34,
              ),
              UIHelper.verticalSpace(10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  listTIle(),
                  divider(),
                  listTIle(),
                  divider(),
                  listTIle(),
                  divider(),
                ],
              ),
              UIHelper.verticalSpace(100),
              DefButton(
                text: 'Save',
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DeleteCardsPage()),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  ListTile listTIle() {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: SvgPicture.asset(
          'assets/images/visa-logo.svg',
          height: 16,
        ),
      ),
      title: const Text(
        ' 1234',
        style: TextStyle(fontSize: 16),
      ),
      trailing: SvgPicture.asset('assets/images/ic_tick.svg'),
    );
  }
}
