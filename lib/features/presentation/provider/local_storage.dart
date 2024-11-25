import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:stockify/features/data/data_source/data_source.dart';
import 'package:stockify/features/data/model/stock_model.dart';
import 'package:stockify/features/data/model/watch_list_model.dart';
import 'package:stockify/features/data/model/watch_model.dart';
import 'package:stockify/features/presentation/provider/api_data.dart';

class LocalStorage extends ChangeNotifier {
  LocalStorage() {
    getAll();
  }
  bool loading = false;
  ApiData api = ApiData();
  List<WatchListModel> data = [];
  List<WatchModel> watchModels = [];
  final String _name = 'watch_list_db';
  //-----adding watchlist model into local storage------
  Future<void> add(WatchListModel model) async {
    try {
      final box = await Hive.openBox<WatchListModel>(_name);
      final id = await box.add(model);
      model.id = id;
      box.put(id, model);
      log('data added successfully');
      getAll();
    } catch (e) {
      log('error from adding to database=$e');
    }
  }

  //--------getting all data from the local storage----------
  Future<void> getAll() async {
    try {
      loading = true;
      notifyListeners();
      final box = await Hive.openBox<WatchListModel>(_name);
      data.clear();
      data = box.values.toList();
      final apiKey = dotenv.env['API_KEY'];
      log(apiKey.toString());
      for (var element in data) {
        //------getting stock value from the api-------------
        final symbol = element.symbol;
        final response = await DataSource.request(
            'query?function=TIME_SERIES_DAILY&symbol=$symbol&outputsize=compact&apikey=$apiKey');
        log('symbol ====${element.symbol}');
        log('reached here');
        log('this is the data    :${response.data}');
        final stockModel = StockData.fromJson(response.data);
        final watchModel =
            WatchModel(stockData: stockModel, watchListModel: element);
        watchModels.add(watchModel);
        log('reached here');
      }
      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      log('error from getting all data from database=$e');
    }
  }

//---------deleting single data from the database-------------
  Future<void> delete(int id) async {
    final box = await Hive.openBox<WatchListModel>(_name);
    await box.delete(id);
    getAll();
  }

//--------checking for whether the company is already in the watchlist or not---
  bool contains(String symbol) {
    return data.any((e) => e.symbol == symbol);
  }
}
