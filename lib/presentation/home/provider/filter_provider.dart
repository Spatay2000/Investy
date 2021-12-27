import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:investy/app/data/models/array_model.dart';
import 'package:investy/base/base_bloc.dart';
import 'package:investy/presentation/home/ui/loan_amount.dart';

class FilterProvider extends BaseBloc {
  Size? size;

  init(BuildContext context) async {
    setLoading(true);
    Future.delayed(Duration(seconds: 2), () {
      setLoading(false);
      notifyListeners();
    });
    size = MediaQuery.of(context).size;
  }

  List<ArrayModel> loanAmountList = [];
  bool isResetActivated = false;

  getNameOfLoanAmountsList() {
    String names = "";

    for (int i = 0; i < loanAmountList.length; i++) {
      names += loanAmountList[i].name;
      if (i != loanAmountList.length - 1) {
        names += ", ";
      }
    }
    return names;
  }

  setIsResetActivated(bool value) {
    isResetActivated = value;
    notifyListeners();
  }

  setLoanAmountList(List<ArrayModel> list) {
    loanAmountList = list;
    notifyListeners();
  }

  resetFilter(BuildContext context) {
    for (ArrayModel a in loanAmountList) {
      notifyListeners();
      setIsResetActivated(false);
    }
  }

  toAmount(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LoanAmountPage(
                  filterProvider: this,
                )));
    //TODO write login service
  }

  toRepayment(BuildContext context) {
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => RepaymentPage()));
    //TODO write login service
  }
  toBenefitAmount(BuildContext context) {
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => BenefitPage()));
    //TODO write login service
  }
  toProductType(BuildContext context) {
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => ProductTypePage()));
    //TODO write login service
  }
  toLesale(BuildContext context) {
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => LesalePage()));
    //TODO write login service
  }
}
