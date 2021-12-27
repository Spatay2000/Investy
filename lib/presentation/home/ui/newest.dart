import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investy/base/base_provider.dart';
import 'package:investy/presentation/home/provider/newest_provider.dart';
import 'package:investy/shared/theme.dart';

class Newest extends StatelessWidget {
  const Newest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.whiteColor,
          title: Text(
            'Newest offers',
            style: TextStyle(
                color: AppColors.textColor,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: false,
        ),
        body: BaseProvider<NewestProvider>(
            model: NewestProvider(),
            onReady: (v) => v.init(context),
            builder: (context, model, child) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ContainerToNews(),
                    SizedBox(height: 10),
                    ContainerToNews(),
                    SizedBox(height: 10),
                    ContainerToNews(),
                    SizedBox(height: 10),
                    ContainerToNews(),
                    SizedBox(height: 10),
                    ContainerToNews(),
                    SizedBox(height: 10),
                    ContainerToNews(),
                    SizedBox(height: 10)
                  ],
                ),
              );
            }));
  }
}

class ContainerToNews extends StatelessWidget {
  const ContainerToNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 17),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColors.kshadow,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'NEO Tech',
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 23,
                ),
                SvgPicture.asset('asset/svg/ic_fire.svg'),
                SizedBox(
                  width: 115,
                ),
                Text(
                  '\$10k',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 23,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: const [
                Text(
                  'Information Technology',
                  style: TextStyle(
                      color: AppColors.kGrayText,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 1,
                ),
                Text(
                  'loan (1 year)',
                  style: TextStyle(
                      color: AppColors.kGrayText,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 23,
                ),
              ],
            ),
            const SizedBox(
              height: 31,
            ),
            Row(
              children: const [
                Text(
                  'Service  .',
                  style: TextStyle(
                      color: AppColors.kGrayText,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 23,
                ),
                Icon(
                  Icons.star_outline_outlined,
                  color: AppColors.kGrayText,
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  '5.0',
                  style: TextStyle(
                      color: AppColors.kGrayText,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 34,
                ),
                Text(
                  '\$1,5K (15%)',
                  style: TextStyle(
                      color: AppColors.kGreenText,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 23,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
