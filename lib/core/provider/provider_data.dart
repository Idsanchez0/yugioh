import 'package:flutter/material.dart';

class ProviderData extends ChangeNotifier {
  dynamic dataCard;
  dynamic dataFilterCard;

  get getDataCards => dataCard;
  get getDataFilterCards => dataFilterCard;

  setDataCards(dynamic newData) {
    dataCard = newData;
    notifyListeners();
  }

  setDataFilterCards(dynamic newData) {
    dataFilterCard = newData;
    notifyListeners();
  }
}
