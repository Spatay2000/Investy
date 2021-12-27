import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investy/base/base_provider.dart';
import 'package:investy/presentation/home/ui/filter.dart';
import 'package:investy/presentation/profile/provider/profile_provider.dart';
import 'package:investy/presentation/profile/ui/password.dart';
import 'package:investy/shared/helper.dart';
import 'package:investy/shared/theme.dart';
import 'package:investy/widgets/loading_view.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var _lights = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BaseProvider<ProfileProvider>(
        model: ProfileProvider(),
        builder: (context, model, child) {
          return model.isLoading
              ? LoadingView()
              : Scaffold(
                  backgroundColor: Colors.white70,
                  body: SafeArea(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 149, top: 33),
                          child: ListTile(
                              title: const Text(
                                'Profile',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              trailing: IconButton(
                                icon: SvgPicture.asset(
                                  'assets/images/ic_notify.svg',
                                  height: 40,
                                  width: 40,
                                ),
                                onPressed: () {},
                              )),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 23),
                          margin: const EdgeInsets.only(
                              left: 32, right: 32, top: 33),
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
                              model.toSetYourName(context);
                            },
                            title: Text(
                              model.fullName,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textColor),
                            ),
                            subtitle: const Text(
                              'kurmashev@gmail.com',
                              style: TextStyle(
                                  color: AppColors.kGrayText, fontSize: 16),
                            ),
                          ),
                        ),
                        UIHelper.verticalSpace(10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 13),
                          margin: const EdgeInsets.only(
                              left: 32, right: 32, top: 33),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.kshadow,
                                blurRadius: 5,
                                spreadRadius: 1,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ChangePasswordPage()),
                                  );
                                },
                                title: const Text(
                                  'Change password',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.textColor),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                ),
                              ),
                              divider(),
                              ListTile(
                                onTap: () {
                                  model.toAddPhoneNumber(context);
                                },
                                title: const Text(
                                  'Add phone number',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.textColor),
                                ),
                                subtitle: Text(
                                  model.subTile,
                                  style: TextStyle(
                                    fontSize: 23,
                                    color: AppColors.kGrayText,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                ),
                              ),
                              divider(),
                              ListTile(
                                onTap: () {},
                                title: const Text(
                                  'Add card',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.textColor),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                ),
                              ),
                              divider(),
                              MergeSemantics(
                                child: ListTile(
                                  onTap: () {
                                    setState(() {
                                      _lights = !_lights;
                                    });
                                  },
                                  title: const Text(
                                    'Push-notifications',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.textColor),
                                  ),
                                  trailing: CupertinoSwitch(
                                    value: _lights,
                                    onChanged: (bool value) {
                                      setState(() {
                                        _lights = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
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
}
