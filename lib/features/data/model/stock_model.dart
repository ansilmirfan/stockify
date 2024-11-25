

class StockData {
  final String? information;
  final String? symbol;
  final String? lastRefreshed;
  final String? outputSize;
  final String? timeZone;
  final Map<String, DailyPrice>? timeSeries;

  StockData({
    this.information,
    this.symbol,
    this.lastRefreshed,
    this.outputSize,
    this.timeZone,
    this.timeSeries,
  });

  factory StockData.fromJson(Map<String, dynamic> json) {
    Map<String, DailyPrice>? parsedTimeSeries = (json['Time Series (Daily)'] as Map<String, dynamic>?)
        ?.map((key, value) => MapEntry(key, DailyPrice.fromJson(value)));

    return StockData(
      information: json['Meta Data']?['1. Information'] ?? 'Unknown Information',
      symbol: json['Meta Data']?['2. Symbol'] ?? 'Unknown Symbol',
      lastRefreshed: json['Meta Data']?['3. Last Refreshed'] ?? 'Unknown Date',
      outputSize: json['Meta Data']?['4. Output Size'] ?? 'Unknown Output Size',
      timeZone: json['Meta Data']?['5. Time Zone'] ?? 'Unknown Time Zone',
      timeSeries: parsedTimeSeries,
    );
  }
}

class DailyPrice {
  final double? open;
  final double? high;
  final double? low;
  final double? close;
  final int? volume;

  DailyPrice({
    this.open,
    this.high,
    this.low,
    this.close,
    this.volume,
  });

  factory DailyPrice.fromJson(Map<String, dynamic> json) {
    return DailyPrice(
      open: double.tryParse(json['1. open'] ?? '') ?? 0.0,
      high: double.tryParse(json['2. high'] ?? '') ?? 0.0,
      low: double.tryParse(json['3. low'] ?? '') ?? 0.0,
      close: double.tryParse(json['4. close'] ?? '') ?? 0.0,
      volume: int.tryParse(json['5. volume'] ?? '') ?? 0,
    );
  }
}
