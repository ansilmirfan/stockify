import 'package:hive_flutter/hive_flutter.dart';
part 'watch_list_model.g.dart';

@HiveType(typeId: 0)
class WatchListModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String symbol;
  @HiveField(2)
  String currency;
  @HiveField(3)
  String companyName;
  WatchListModel(
      {required this.symbol,
      required this.companyName,
      required this.currency,
      this.id});
  factory WatchListModel.fromMap(Map map) {
    return WatchListModel(
        symbol: map['symbol'],
        companyName: map['companyName'],
        currency: map['currency'],
        id: map['id']);
  }
}
