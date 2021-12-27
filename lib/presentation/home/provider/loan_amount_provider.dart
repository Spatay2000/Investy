import 'package:flutter/material.dart';
import 'package:investy/app/data/models/array_model.dart';
import 'package:investy/base/base_bloc.dart';

import 'filter_provider.dart';

class LoanAmaountProvider extends BaseBloc {
  Size? size;

  bool isResetActivated = false;

  List<ArrayModel> array = [
    ArrayModel(name: '\$0-\$1000', isChecked: false),
    ArrayModel(name: '\$1000-\$10 000', isChecked: false),
    ArrayModel(name: '\$10 000-\$100 000', isChecked: false),
    ArrayModel(name: '\$100 000-\$500 000', isChecked: false),
    ArrayModel(name: '\$500 000-\$1 000 000', isChecked: false),
    ArrayModel(name: 'More than \$1 000 000', isChecked: false),
  ];

  init(BuildContext context) async {
    setLoading(true);
    Future.delayed(Duration(seconds: 2), () {
      setLoading(false);
      notifyListeners();
    });
    size = MediaQuery.of(context).size;
  }

  setIsResetActivated(bool value) {
    isResetActivated = value;
    notifyListeners();
  }

  checkIsOneChoosed() {
    for (ArrayModel a in array) {
      if (a.isChecked) {
        setIsResetActivated(true);
        return;
      }
    }
    setIsResetActivated(false);
    return;
  }

  reset() {
    print("RESET");
    for (ArrayModel a in array) {
      a.isChecked = false;
      notifyListeners();
      checkIsOneChoosed();
    }
  }

  toggleCheck(int index) {
    array[index].toggleChecked();
    notifyListeners();

    List newArray = array.where((element) => element.isChecked).toList();
    checkIsOneChoosed();
  }

  toAgainFilterPage(BuildContext context, FilterProvider filterProvider) {
    filterProvider.setLoanAmountList(getChoosedOptions());

    Navigator.of(context).pop();
    //  Navigator.push(context,
    //   MaterialPageRoute(builder: (context) =>  FilterPage()));
  }

  getChoosedOptions() {
    List<ArrayModel> list = [];
    for (ArrayModel a in array) {
      if (a.isChecked) {
        list.add(a);
      }
    }
    print(list);
    return list;
  }
}
