class WatchListModel {
  String? id;
  String symbol;
  String currency;
  String companyName;
  WatchListModel(
      {required this.symbol,
      required this.companyName,
      required this.currency,
      this.id});
}
