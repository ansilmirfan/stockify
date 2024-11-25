import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stockify/features/data/model/watch_list_model.dart';

class LocalStorage extends ChangeNotifier {
  LocalStorage() {
    getAll();
  }
  List<WatchListModel> data = [];
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
      final box = await Hive.openBox<WatchListModel>(_name);
      data.clear();
      data = box.values.toList();
      notifyListeners();
    } catch (e) {
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
