import 'dart:convert';

class SearchModel {
  final List<BestMatch>? bestMatches;

  SearchModel({
    this.bestMatches,
  });

  SearchModel copyWith({
    List<BestMatch>? bestMatches,
  }) =>
      SearchModel(
        bestMatches: bestMatches ?? this.bestMatches,
      );

  factory SearchModel.fromRawJson(String str) =>
      SearchModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        bestMatches: json["bestMatches"] == null
            ? []
            : List<BestMatch>.from(
                json["bestMatches"]!.map((x) => BestMatch.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bestMatches": bestMatches == null
            ? []
            : List<dynamic>.from(bestMatches!.map((x) => x.toJson())),
      };
}

class BestMatch {
  final String? the1Symbol;
  final String? the2Name;
  final String? the3Type;
  final String? the4Region;
  final String? the5MarketOpen;
  final String? the6MarketClose;
  final String? the7Timezone;
  final String? the8Currency;
  final String? the9MatchScore;

  BestMatch({
    this.the1Symbol,
    this.the2Name,
    this.the3Type,
    this.the4Region,
    this.the5MarketOpen,
    this.the6MarketClose,
    this.the7Timezone,
    this.the8Currency,
    this.the9MatchScore,
  });

  BestMatch copyWith({
    String? the1Symbol,
    String? the2Name,
    String? the3Type,
    String? the4Region,
    String? the5MarketOpen,
    String? the6MarketClose,
    String? the7Timezone,
    String? the8Currency,
    String? the9MatchScore,
  }) =>
      BestMatch(
        the1Symbol: the1Symbol ?? this.the1Symbol,
        the2Name: the2Name ?? this.the2Name,
        the3Type: the3Type ?? this.the3Type,
        the4Region: the4Region ?? this.the4Region,
        the5MarketOpen: the5MarketOpen ?? this.the5MarketOpen,
        the6MarketClose: the6MarketClose ?? this.the6MarketClose,
        the7Timezone: the7Timezone ?? this.the7Timezone,
        the8Currency: the8Currency ?? this.the8Currency,
        the9MatchScore: the9MatchScore ?? this.the9MatchScore,
      );

  factory BestMatch.fromRawJson(String str) =>
      BestMatch.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BestMatch.fromJson(Map<String, dynamic> json) => BestMatch(
        the1Symbol: json["1. symbol"],
        the2Name: json["2. name"],
        the3Type: json["3. type"],
        the4Region: json["4. region"],
        the5MarketOpen: json["5. marketOpen"],
        the6MarketClose: json["6. marketClose"],
        the7Timezone: json["7. timezone"],
        the8Currency: json["8. currency"],
        the9MatchScore: json["9. matchScore"],
      );

  Map<String, dynamic> toJson() => {
        "1. symbol": the1Symbol,
        "2. name": the2Name,
        "3. type": the3Type,
        "4. region": the4Region,
        "5. marketOpen": the5MarketOpen,
        "6. marketClose": the6MarketClose,
        "7. timezone": the7Timezone,
        "8. currency": the8Currency,
        "9. matchScore": the9MatchScore,
      };
}
