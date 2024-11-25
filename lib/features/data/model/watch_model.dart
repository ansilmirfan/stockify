import 'package:stockify/features/data/model/stock_model.dart';
import 'package:stockify/features/data/model/watch_list_model.dart';

class WatchModel {
  StockData stockData;
  WatchListModel watchListModel;
  WatchModel({required this.stockData, required this.watchListModel});
}
