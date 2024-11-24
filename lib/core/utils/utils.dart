class Utils {
  //-----function for getting the currenct symboll-------------
  String getCurrency(String symbol) {
    const exchangeToCurrency = {
      "BSE": "₹", // Indian Rupee
      "NSE": "₹", // Indian Rupee
      "NYSE": "\$", // US Dollar
      "NASDAQ": "\$", // US Dollar
      "L": "£", // British Pound
      "TRT": "CAD", // Canadian Dollar
      "HK": "HKD", // Hong Kong Dollar
      "JP": "¥", // Japanese Yen
      "ASX": "AUD", // Australian Dollar
    };
    //----------splitting the symbol using ".", then getting the last value
    //----------which is represnting the exchange code-----------------
    final exchangeCode = symbol.split('.').last;
    return exchangeToCurrency[exchangeCode] ?? "Unknown Currency";
  }
  final Map<String, String> currencySymbols = {
  'AED': 'د.إ‎',    // United Arab Emirates Dirham
  'AFN': '؋',       // Afghan Afghani
  'ALL': 'L',        // Albanian Lek
  'AMD': '֏',        // Armenian Dram
  'ANG': 'ƒ',        // Netherlands Antillean Guilder
  'AOA': 'Kz',       // Angolan Kwanza
  'ARS': '\$',       // Argentine Peso
  'AUD': '\$',       // Australian Dollar
  'AWG': 'ƒ',        // Aruban Florin
  'AZN': '₼',        // Azerbaijani Manat
  'BAM': 'KM',       // Bosnia-Herzegovina Convertible Mark
  'BBD': '\$',       // Barbadian Dollar
  'BDT': '৳',        // Bangladeshi Taka
  'BGN': 'лв',       // Bulgarian Lev
  'BHD': '.د.ب',     // Bahraini Dinar
  'BIF': 'Fr',       // Burundian Franc
  'BMD': '\$',       // Bermudan Dollar
  'BND': '\$',       // Brunei Dollar
  'BOB': 'Bs',       // Bolivian Boliviano
  'BRL': r'R$',       // Brazilian Real
  'BSD': '\$',       // Bahamian Dollar
  'BTN': 'Nu.',      // Bhutanese Ngultrum
  'BWP': 'P',        // Botswanan Pula
  'BZD': r'BZ$',      // Belize Dollar
  'CAD': '\$',       // Canadian Dollar
  'CDF': 'Fr',       // Congolese Franc
  'CHF': 'Fr.',      // Swiss Franc
  'CLF': 'UF',       // Chilean Unit of Account UF
  'CLP': '\$',       // Chilean Peso
  'CNH': '¥',        // Chinese Yuan Offshore
  'CNY': '¥',        // Chinese Yuan
  'COP': r'$',        // Colombian Peso
  'CUP': '₱',        // Cuban Peso
  'CVE': r'$',        // Cape Verdean Escudo
  'CZK': 'Kč',       // Czech Republic Koruna
  'DJF': 'Fr',       // Djiboutian Franc
  'DKK': 'kr',       // Danish Krone
  'DOP': r'RD$',      // Dominican Peso
  'DZD': 'د.ج',      // Algerian Dinar
  'EGP': 'ج.م',      // Egyptian Pound
  'ERN': 'Nfk',      // Eritrean Nakfa
  'ETB': 'Br',       // Ethiopian Birr
  'EUR': '€',        // Euro
  'FJD': '\$',       // Fijian Dollar
  'FKP': '£',        // Falkland Islands Pound
  'GBP': '£',        // British Pound Sterling
  'GEL': '₾',        // Georgian Lari
  'GHS': '₵',        // Ghanaian Cedi
  'GIP': '£',        // Gibraltar Pound
  'GMD': 'D',        // Gambian Dalasi
  'GNF': 'Fr',       // Guinean Franc
  'GTQ': 'Q',        // Guatemalan Quetzal
  'GYD': '\$',       // Guyanaese Dollar
  'HKD': '\$',       // Hong Kong Dollar
  'HNL': 'L',        // Honduran Lempira
  'HRK': 'kn',       // Croatian Kuna
  'HTG': 'G',        // Haitian Gourde
  'HUF': 'Ft',       // Hungarian Forint
  'ICP': 'ICP',      // Internet Computer
  'IDR': 'Rp',       // Indonesian Rupiah
  'ILS': '₪',        // Israeli New Sheqel
  'INR': '₹',        // Indian Rupee
  'IQD': 'ع.د',      // Iraqi Dinar
  'IRR': 'ریال',     // Iranian Rial
  'ISK': 'kr',       // Icelandic Krona
  'JEP': '£',        // Jersey Pound
  'JMD': '\$',       // Jamaican Dollar
  'JOD': 'د.ا',      // Jordanian Dinar
  'JPY': '¥',        // Japanese Yen
  'KES': 'Sh',       // Kenyan Shilling
  'KGS': 'с',        // Kyrgystani Som
  'KHR': '៛',       // Cambodian Riel
  'KMF': 'Fr',       // Comorian Franc
  'KPW': '₩',        // North Korean Won
  'KRW': '₩',        // South Korean Won
  'KWD': 'د.ك',      // Kuwaiti Dinar
  'KYD': '\$',       // Cayman Islands Dollar
  'KZT': '₸',        // Kazakhstani Tenge
  'LAK': '₭',        // Laotian Kip
  'LBP': 'ل.ل',      // Lebanese Pound
  'LKR': 'Rs',       // Sri Lankan Rupee
  'LRD': '\$',       // Liberian Dollar
  'LSL': 'M',        // Lesotho Loti
  'LYD': 'د.ل',      // Libyan Dinar
  'MAD': 'د.م',      // Moroccan Dirham
  'MDL': 'Lei',      // Moldovan Leu
  'MGA': 'Ar',       // Malagasy Ariary
  'MKD': 'ден',      // Macedonian Denar
  'MMK': 'K',        // Myanma Kyat
  'MNT': '₮',        // Mongolian Tugrik
  'MOP': 'MOP',      // Macanese Pataca
  'MRO': 'UM',       // Mauritanian Ouguiya (pre-2018)
  'MRU': 'UM',       // Mauritanian Ouguiya
  'MUR': '₨',        // Mauritian Rupee
  'MVR': 'Rf',       // Maldivian Rufiyaa
  'MWK': 'K',        // Malawian Kwacha
  'MXN': '\$',       // Mexican Peso
  'MYR': 'RM',       // Malaysian Ringgit
  'MZN': 'MT',       // Mozambican Metical
  'NAD': r'N$',       // Namibian Dollar
  'NGN': '₦',        // Nigerian Naira
  'NOK': 'kr',       // Norwegian Krone
  'NPR': 'Rs',       // Nepalese Rupee
  'NZD': '\$',       // New Zealand Dollar
  'OMR': 'ر.ع.',     // Omani Rial
  'PAB': 'B/.',      // Panamanian Balboa
  'PEN': 'S/',       // Peruvian Nuevo Sol
  'PGK': 'K',        // Papua New Guinean Kina
  'PHP': '₱',        // Philippine Peso
  'PKR': '₨',        // Pakistani Rupee
  'PLN': 'zł',       // Polish Zloty
  'PYG': '₲',        // Paraguayan Guarani
  'QAR': 'ر.ق',      // Qatari Rial
  'RON': 'lei',      // Romanian Leu
  'RSD': 'дин.',     // Serbian Dinar
  'RUB': '₽',        // Russian Ruble
  'RUR': '₽',        // Old Russian Ruble
  'RWF': 'Fr',       // Rwandan Franc
  'SAR': 'ر.س',      // Saudi Riyal
  'SBD': '\$',       // Solomon Islands Dollar
  'SCR': '₨',        // Seychellois Rupee
  'SDG': 'ج.س.',     // Sudanese Pound
  'SDR': 'SDR',      // Special Drawing Rights
  'SEK': 'kr',       // Swedish Krona
  'SGD': '\$',       // Singapore Dollar
  'SHP': '£',        // Saint Helena Pound
  'SLL': 'Le',       // Sierra Leonean Leone
  'SOS': 'Sh',       // Somali Shilling
  'SRD': '\$',       // Surinamese Dollar
  'SYP': '£',        // Syrian Pound
  'SZL': 'L',        // Swazi Lilangeni
  'THB': '฿',        // Thai Baht
  'TJS': 'SM',       // Tajikistani Somoni
  'TMT': 'm',        // Turkmenistani Manat
  'TND': 'د.ت',      // Tunisian Dinar
  'TOP': r'T$',       // Tongan Paʻanga
  'TRY': '₺',        // Turkish Lira
  'TTD': r'TT$',      // Trinidad and Tobago Dollar
  'TWD': r'NT$',      // New Taiwan Dollar
  'TZS': 'Sh',       // Tanzanian Shilling
  'UAH': '₴',        // Ukrainian Hryvnia
  'UGX': 'Sh',       // Ugandan Shilling
  'UYU': '\$',       // Uruguayan Peso
  'UZS': 'лв',       // Uzbekistani Som
  'VES': 'Bs.S',     // Venezuelan Bolívar Soberano
  'VND': '₫',        // Vietnamese Dong
  'VUV': 'Vt',       // Vanuatu Vatu
  'WST': 'T',        // Samoan Tala
  'XAF': 'FCFA',     // Central African CFA Franc
  'XCD': r'EC/$',      // East Caribbean Dollar
  'XOF': 'CFA',      // West African CFA Franc
  'XPF': 'XPF',      // CFP Franc
  'YER': 'ر.ي',      // Yemeni Rial
  'ZAR': 'R',        // South African Rand
  'ZMW': 'K',        // Zambian Kwacha
  'ZWL': r'Z$',       // Zimbabwean Dollar
};

}
