import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:investy/base/base_provider.dart';
import 'package:investy/presentation/investments/provider/rate_provider.dart';
import 'package:investy/shared/helper.dart';
import 'package:investy/shared/theme.dart';
import 'package:investy/widgets/next_button.dart';

class RateProviderPage extends StatelessWidget {
  const RateProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int count = 5;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BaseProvider<RateProvider>(
        model: RateProvider(),
        builder: (context, model, child) {
          return model.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.purple,
                ))
              : Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45.79),
                            topRight: Radius.circular(45.79))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 53, horizontal: 23),
                      child: Center(
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Rate provider',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            const Text(
                              'Please, share your opinion about this provider',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.kGrayText),
                              textAlign: TextAlign.center,
                            ),
                            UIHelper.verticalSpace(20),
                            RatingBar.builder(
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemSize: 28,
                              itemCount: count,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                size: 1,
                                color: Colors.orange,
                              ),
                              onRatingUpdate: (rating) {
                                //  print(rating);
                              },
                            ),
                            UIHelper.verticalSpace(30),
                            Card(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: model.commentCtrl,
                                    maxLines: 5,
                                    decoration: InputDecoration.collapsed(
                                      hintText: "Your comment",
                                    ),
                                  ),
                                )),
                            Spacer(),
                            DefButton(
                              text: 'Rate',
                              press: () {
                                model.toProviderPage(context);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
