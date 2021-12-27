import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:investy/base/base_provider.dart';
import 'package:investy/presentation/home/provider/provide_provider.dart';
import 'package:investy/presentation/home/ui/pdf.dart';
import 'package:investy/presentation/home/ui/show_bottom.dart';
import 'package:investy/shared/helper.dart';
import 'package:investy/shared/theme.dart';
import 'package:investy/widgets/confirm.dart';
import 'package:investy/widgets/loading_view.dart';
import 'package:investy/widgets/next_button.dart';

class ProviderPage extends StatefulWidget {
  final String numField;

  final bool isButton;

  final Widget? bottomBarButton;

  const ProviderPage(
      {required this.isButton, required this.numField, this.bottomBarButton});
  // const ProviderPage({Key? key}) : super(key: key);

  @override
  _ProviderPageState createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage>
    with TickerProviderStateMixin {
  late TabController _controller;
  final double _iconRating = 2;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 4,
      vsync: this,
    );
    _controller.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BaseProvider<ProvideProvider>(
        model: ProvideProvider(),
        builder: (context, model, child) {
          return model.isLoading
              ? LoadingView()
              : DefaultTabController(
                  length: 4,
                  child: Scaffold(
                      resizeToAvoidBottomInset: false,
                      appBar: AppBar(
                        elevation: 0.0,
                        toolbarHeight: 404,
                        backgroundColor: Colors.white,
                        title: Text(
                          'Provider',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        centerTitle: true,
                        leading: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: SvgPicture.asset(
                            'assets/images/rectangle.svg',
                          ),
                        ),
                        bottom: PreferredSize(
                          preferredSize: const Size.fromHeight(0),
                          child: Column(
                            children: [
                              container(),
                              const SizedBox(
                                height: 14,
                              ),
                              Material(
                                color: Colors.white24,
                                child: TabBar(
                                    indicatorColor: Colors.lime,
                                    labelPadding: const EdgeInsets.only(
                                        left: 15, right: 5),
                                    isScrollable: true,
                                    labelStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                    indicator: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: const Color(0xFFF9F5FF)),
                                    controller: _controller,
                                    tabs: [
                                      tabSelected('Payment info', 0),
                                      tabSelected('About', 1),
                                      tabSelected('Documents', 2),
                                      tabSelected('Reviews', 3),
                                    ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                      body: TabBarView(
                        controller: _controller,
                        children: [
                          ListView(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 24, right: 24, top: 24),
                                child: Column(
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          'Loan terms',
                                          style: TextStyle(
                                              color: AppColors.textColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          '\$10 000, 90 days, 15% discount',
                                          style: TextStyle(
                                              color: AppColors.textColor,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 35,
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          'Benefit info',
                                          style: TextStyle(
                                              color: AppColors.textColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          'You invest now',
                                          style: TextStyle(
                                              color: AppColors.textColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        SizedBox(
                                          width: 170,
                                        ),
                                        Text(
                                          '\$8 500',
                                          style: TextStyle(
                                              color: AppColors.textColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          '01.06.2021',
                                          style: TextStyle(
                                              color: AppColors.kGrayText,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        SizedBox(
                                          width: 205,
                                        ),
                                        Text(
                                          '\$10 000',
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              color: AppColors.kGrayText,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          'Earnings by 90 days',
                                          style: TextStyle(
                                              color: AppColors.textColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        SizedBox(
                                          width: 120,
                                        ),
                                        Text(
                                          '+\$1 500',
                                          style: TextStyle(
                                              color: AppColors.textColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          '01.09.2021',
                                          style: TextStyle(
                                              color: AppColors.kGrayText,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        SizedBox(
                                          width: 181,
                                        ),
                                        Text(
                                          '15% benefit',
                                          style: TextStyle(
                                              color: AppColors.kGrayText,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 35,
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          'Wanna earn more?',
                                          style: TextStyle(
                                              color: AppColors.textColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            showModalBottomSheet(
                                                context: context,
                                                builder: (context) {
                                                  return ShowBottomScreen(
                                                    model: model,
                                                  );
                                                });
                                          },
                                          child: const Text(
                                            'Open calculator',
                                            style: TextStyle(
                                                color: AppColors.primaryColor,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            color: Colors.white24,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 18, horizontal: 23),
                                  child: Column(
                                    children: [
                                      const Text(
                                        'NEO Tech offers their electronic SIM Cards and provides users with cellular data. The company started in 2019 and needs some investment in order to be spread and well-known wolrd wide.',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 23,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Color(0xFFF8F8F8),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.kshadow,
                                              blurRadius: 5,
                                              spreadRadius: 4,
                                              offset: const Offset(0, 5),
                                            ),
                                          ],
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 23, vertical: 23),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/images/group.svg'),
                                            const SizedBox(
                                              width: 23,
                                            ),
                                            const Text(
                                              'This company is validated and \n trusted.',
                                              style: TextStyle(fontSize: 14),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 23, horizontal: 26),
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 20, right: 20, bottom: 210),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xFFF8F8F8),
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
                                leading: SvgPicture.asset(
                                    'assets/images/ic_pdf.svg'),
                                title: Text(
                                    ' Agreement with wholesale areas b...'),
                                subtitle: Text('1.3 MB'),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PdfPage()),
                                  );
                                },
                              ),
                            ),
                          ),
                          ListView(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            children: [
                              _getRatingWidget(context),
                              Container(
                                margin: EdgeInsets.only(left: 23, top: 33),
                                child: const Text(
                                  'Reviews(4)',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textColor),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 13, horizontal: 10),
                                margin: EdgeInsets.only(
                                    right: 23, left: 23, top: 23),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xFFF8F8F8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.kshadow,
                                      blurRadius: 5,
                                      spreadRadius: 4,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'NEO Tech is fire! Invest into them, it worth it.',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    UIHelper.verticalSpace(15),
                                    RatingBarIndicator(
                                      rating: 5,
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 14.0,
                                      direction: Axis.horizontal,
                                    ),
                                    UIHelper.verticalSpace(17),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: const [
                                        Text(
                                          'Almat Kurmashev',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        Text(
                                          'Wed, 16:26',
                                          style: TextStyle(fontSize: 14),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 23, horizontal: 15),
                                margin: EdgeInsets.only(
                                    right: 23, left: 23, top: 23),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xFFF8F8F8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.kshadow,
                                      blurRadius: 5,
                                      spreadRadius: 4,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      widget.numField,
                                      // 'NEO Tech is fire! Invest into them, it worth it.',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 223),
                                      child: RatingBarIndicator(
                                        rating: 5,
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        itemCount: 5,
                                        itemSize: 20.0,
                                        direction: Axis.horizontal,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 93),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(
                                            'Almat Kurmashev',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          Text(
                                            'Wed, 16:26',
                                            style: TextStyle(fontSize: 14),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 23, horizontal: 15),
                                margin: EdgeInsets.only(
                                    right: 23, left: 23, top: 23),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xFFF8F8F8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.kshadow,
                                      blurRadius: 5,
                                      spreadRadius: 4,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      'NEO Tech is fire! Invest into them, it worth it.',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 223),
                                      child: RatingBarIndicator(
                                        rating: 5,
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        itemCount: 5,
                                        itemSize: 20.0,
                                        direction: Axis.horizontal,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Almat Kurmashev',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        Text(
                                          'Wed, 16:26',
                                          style: TextStyle(fontSize: 14),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      bottomNavigationBar: widget.isButton
                          ? DefButton(
                              text: 'Invest \$10 000',
                              press: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return ConfirmPage();
                                    });
                              },
                            )
                          : widget.bottomBarButton),
                );
        },
      ),
    );
  }

  Container container() {
    return Container(
      margin: EdgeInsets.only(left: 20, bottom: 23, right: 20),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
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
            children: const [
              Text(
                'NEO Tech',
                style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 150,
              ),
              Icon(
                Icons.star_outline_outlined,
                color: AppColors.kGrayText,
                size: 14,
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                '5.0',
                style: TextStyle(
                    color: AppColors.kGrayText,
                    fontSize: 14,
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
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: const [
              Text(
                'Peoduct type:',
                style: TextStyle(
                    color: AppColors.kGrayText,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                'Service',
                style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
          const Divider(
            color: Color(0xFFE4E4E4),
            height: 50,
            thickness: 2,
          ),
          Row(
            children: const [
              SizedBox(
                width: 20,
              ),
              Text(
                'loan (90 days):',
                style: TextStyle(
                    color: AppColors.kGrayText,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                width: 80,
              ),
              Text(
                'benefit:',
                style: TextStyle(
                    color: AppColors.kGrayText,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                width: 23,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: const [
              SizedBox(
                width: 20,
              ),
              Text(
                '\$10 000',
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                width: 95,
              ),
              Text(
                '+\$1 500 (15%)',
                style: TextStyle(
                    color: Color(0xFF00CC66),
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                width: 23,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Tab tabSelected(String text, int index) {
    return Tab(
        child: Text(
      text,
      style: TextStyle(
          color: _controller.index == index
              ? const Color(0xFF5C00D0)
              : const Color(0xFF999999),
          fontSize: 18),
    ));
  }

  _getRatingWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32, horizontal: 23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Provider rating',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 23),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xFFF9F5FF),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.kshadow,
                        blurRadius: 5,
                        spreadRadius: 4,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: const [
                      Text(
                        '5.0',
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'out ot 5',
                        style: TextStyle(
                            color: AppColors.primaryColor, fontSize: 14),
                      )
                    ],
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      ratingbar(5),
                      lineContainer(AppColors.primaryColor),
                    ],
                  ),
                  Row(
                    children: [
                      ratingbar(4),
                      lineContainer(AppColors.kInActiveColor),
                    ],
                  ),
                  Row(
                    children: [
                      ratingbar(3),
                      lineContainer(AppColors.kInActiveColor),
                    ],
                  ),
                  Row(
                    children: [
                      ratingbar(2),
                      lineContainer(AppColors.kInActiveColor),
                    ],
                  ),
                  Row(
                    children: [
                      ratingbar(1),
                      lineContainer(AppColors.kInActiveColor),
                    ],
                  ),
                  Text(
                    '4 ratings',
                    style: TextStyle(color: AppColors.kGrayText, fontSize: 14),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container lineContainer(Color colors) {
    return Container(
      height: 6,
      width: 142,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: colors,
      ),
    );
  }

  RatingBar ratingbar(int count) {
    return RatingBar.builder(
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemSize: 12,
      itemCount: count,
      itemPadding: const EdgeInsets.symmetric(horizontal: 3.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        size: 1,
        color: AppColors.kInActiveColor,
      ),
      onRatingUpdate: (rating) {
        //  print(rating);
      },
    );
  }
}

class widge extends StatelessWidget {
  const widge({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(2),
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
            children: const [
              Text(
                'NEO Tech',
                style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 23,
              ),
              Icon(
                Icons.fireplace_rounded,
                color: Colors.orange,
              ),
              SizedBox(
                width: 115,
              ),
              Text(
                '\$10k',
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 24,
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
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 44,
              ),
              Text(
                'loan (1 year)',
                style: TextStyle(
                    color: AppColors.kGrayText,
                    fontSize: 19,
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
                    fontSize: 24,
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
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 34,
              ),
              Text(
                '\$1,5K (15%)',
                style: TextStyle(
                    color: AppColors.kGreenText,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 23,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
