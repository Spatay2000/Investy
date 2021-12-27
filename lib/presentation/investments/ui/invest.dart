import 'package:flutter/material.dart';
import 'package:investy/presentation/home/ui/provide.dart';
import 'package:investy/presentation/investments/ui/rate.dart';
import 'package:investy/widgets/next_button.dart';

class InvestProviderPage extends StatefulWidget {
  const InvestProviderPage({Key? key}) : super(key: key);

  @override
  _InvestProviderPageState createState() => _InvestProviderPageState();
}

class _InvestProviderPageState extends State<InvestProviderPage> {
  @override
  Widget build(BuildContext context) {
    return ProviderPage(
      isButton: false,
      numField: '',
      bottomBarButton: DefButton(
        text: 'Rate provider',
        press: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return RateProviderPage();
              });
        },
      ),
    );
  }
}
