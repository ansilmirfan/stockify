import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stockify/features/data/data_source/data_source.dart';
import 'package:stockify/features/data/model/search_model.dart';

class ApiData extends ChangeNotifier {
  List<BestMatch> list = [];
  Future search(String querry) async {
    final apiKey = dotenv.env['API_KEY'];
    final String endUrl =
        'query?function=SYMBOL_SEARCH&keywords=$querry&apikey=$apiKey';
    final response = await DataSource.request(endUrl);

    final data = SearchModel.fromJson(response.data);
    if (data.bestMatches != null) {
      list = data.bestMatches!;
    }
    log(list.toString());
  }
}
