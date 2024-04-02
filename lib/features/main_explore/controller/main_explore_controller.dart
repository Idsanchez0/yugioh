import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../core/network/network.dart';
import '../../../core/provider/provider_data.dart';

class MainExploreController {
  final BuildContext context;
  MainExploreController(this.context);

  Future<dynamic> getCards() async {
    var dataProvider = Provider.of<ProviderData>(context, listen: false);
    dataProvider.setDataCards(null);
    final response = await http.get(
      Uri.parse(network.urlBackend),
    );
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      var data = responseData['data'];
      dataProvider.setDataCards(data);
      return data;
    } else {
      log('Fallo en consulta de reembolsos ${response.statusCode}');
      return null;
    }
  }

  Future<dynamic> filterCards({required cardsList}) async {
    var dataProvider = Provider.of<ProviderData>(context, listen: false);
    dataProvider.setDataFilterCards(null);
    List<dynamic> cardsFilter = [];
    cardsList.forEach((card) {
      if (!card.containsKey('banlist_info')) {
        cardsFilter.add(card);
      }
    });
    dataProvider.setDataFilterCards(cardsFilter);
    return null;
  }
}
