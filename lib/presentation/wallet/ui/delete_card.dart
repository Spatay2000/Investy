import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investy/presentation/home/ui/filter.dart';
import 'package:investy/shared/helper.dart';
import 'package:investy/shared/theme.dart';

class DeleteCardsPage extends StatelessWidget {
  const DeleteCardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          UIHelper.verticalSpace(20),
          Row(
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
                onPressed: () {
                  showMaterialDialog(context);
                },
                child: const Text(
                  'Done',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
          UIHelper.verticalSpace(20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ListTileToDelete(),
                divider(),
                ListTileToDelete(),
                divider(),
              ],
            ),
          ),
        ],
      )),
    );
  }

  ListTile ListTileToDelete() {
    return ListTile(
      title: Text(
        ('1234'),
        style: const TextStyle(fontSize: 16),
      ),
      leading: Padding(
        padding: EdgeInsets.only(top: 3),
        child: SvgPicture.asset(
          'assets/images/visa-logo.svg',
          height: 16,
        ),
      ),
      trailing: SvgPicture.asset('assets/images/ic_tick.svg'),
      onTap: () {},
    );
  }
}

void showMaterialDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            'Are you sure to delete the card *3434?',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.textColor),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Yes, Delete")),
            CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("No")),
          ],
        );
      });
}
