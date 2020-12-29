const Currencies = [
  { code: "AED", name: "(AED) United Arab Emirates Dirham" },
  { code: "AFN", name: "(AFN) Afghan Afghani" },
  { code: "ALL", name: "(ALL) Albanian Lek" },
  { code: "AMD", name: "(AMD) Armenian Dram" },
  { code: "ANG", name: "(ANG) Netherlands Antillean Guilder" },
  { code: "AOA", name: "(AOA) Angolan Kwanza" },
  { code: "ARS", name: "(ARS) Argentine Peso" },
  { code: "AUD", name: "(AUD) Australian Dollar" },
  { code: "AWG", name: "(AWG) Aruban Florin" },
  { code: "AZN", name: "(AZN) Azerbaijani Manat" },
  { code: "BAM", name: "(BAM) Bosnia-Herzegovina Convertible Mark" },
  { code: "BBD", name: "(BBD) Barbadian Dollar" },
  { code: "BDT", name: "(BDT) Bangladeshi Taka" },
  { code: "BGN", name: "(BGN) Bulgarian Lev" },
  { code: "BHD", name: "(BHD) Bahraini Dinar" },
  { code: "BIF", name: "(BIF) Burundian Franc" },
  { code: "BMD", name: "(BMD) Bermudan Dollar" },
  { code: "BND", name: "(BND) Brunei Dollar" },
  { code: "BOB", name: "(BOB) Bolivian Boliviano" },
  { code: "BRL", name: "(BRL) Brazilian Real" },
  { code: "BSD", name: "(BSD) Bahamian Dollar" },
  { code: "BTC", name: "(BTC) Bitcoin" },
  { code: "BTN", name: "(BTN) Bhutanese Ngultrum" },
  { code: "BWP", name: "(BWP) Botswanan Pula" },
  { code: "BYN", name: "(BYN) Belarusian Ruble" },
  { code: "BZD", name: "(BZD) Belize Dollar" },
  { code: "CAD", name: "(CAD) Canadian Dollar" },
  { code: "CDF", name: "(CDF) Congolese Franc" },
  { code: "CHF", name: "(CHF) Swiss Franc" },
  { code: "CLF", name: "(CLF) Chilean Unit of Account (UF)" },
  { code: "CLP", name: "(CLP) Chilean Peso" },
  { code: "CNH", name: "(CNH) Chinese Yuan (Offshore)" },
  { code: "CNY", name: "(CNY) Chinese Yuan" },
  { code: "COP", name: "(COP) Colombian Peso" },
  { code: "CRC", name: "(CRC) Costa Rican Colón" },
  { code: "CUC", name: "(CUC) Cuban Convertible Peso" },
  { code: "CUP", name: "(CUP) Cuban Peso" },
  { code: "CVE", name: "(CVE) Cape Verdean Escudo" },
  { code: "CZK", name: "(CZK) Czech Republic Koruna" },
  { code: "DJF", name: "(DJF) Djiboutian Franc" },
  { code: "DKK", name: "(DKK) Danish Krone" },
  { code: "DOP", name: "(DOP) Dominican Peso" },
  { code: "DZD", name: "(DZD) Algerian Dinar" },
  { code: "EGP", name: "(EGP) Egyptian Pound" },
  { code: "ERN", name: "(ERN) Eritrean Nakfa" },
  { code: "ETB", name: "(ETB) Ethiopian Birr" },
  { code: "EUR", name: "(EUR) Euro" },
  { code: "FJD", name: "(FJD) Fijian Dollar" },
  { code: "FKP", name: "(FKP) Falkland Islands Pound" },
  { code: "GBP", name: "(GBP) British Pound Sterling" },
  { code: "GEL", name: "(GEL) Georgian Lari" },
  { code: "GGP", name: "(GGP) Guernsey Pound" },
  { code: "GHS", name: "(GHS) Ghanaian Cedi" },
  { code: "GIP", name: "(GIP) Gibraltar Pound" },
  { code: "GMD", name: "(GMD) Gambian Dalasi" },
  { code: "GNF", name: "(GNF) Guinean Franc" },
  { code: "GTQ", name: "(GTQ) Guatemalan Quetzal" },
  { code: "GYD", name: "(GYD) Guyanaese Dollar" },
  { code: "HKD", name: "(HKD) Hong Kong Dollar" },
  { code: "HNL", name: "(HNL) Honduran Lempira" },
  { code: "HRK", name: "(HRK) Croatian Kuna" },
  { code: "HTG", name: "(HTG) Haitian Gourde" },
  { code: "HUF", name: "(HUF) Hungarian Forint" },
  { code: "IDR", name: "(IDR) Indonesian Rupiah" },
  { code: "ILS", name: "(ILS) Israeli New Sheqel" },
  { code: "IMP", name: "(IMP) Manx pound" },
  { code: "INR", name: "(INR) Indian Rupee" },
  { code: "IQD", name: "(IQD) Iraqi Dinar" },
  { code: "IRR", name: "(IRR) Iranian Rial" },
  { code: "ISK", name: "(ISK) Icelandic Króna" },
  { code: "JEP", name: "(JEP) Jersey Pound" },
  { code: "JMD", name: "(JMD) Jamaican Dollar" },
  { code: "JOD", name: "(JOD) Jordanian Dinar" },
  { code: "JPY", name: "(JPY) Japanese Yen" },
  { code: "KES", name: "(KES) Kenyan Shilling" },
  { code: "KGS", name: "(KGS) Kyrgystani Som" },
  { code: "KHR", name: "(KHR) Cambodian Riel" },
  { code: "KMF", name: "(KMF) Comorian Franc" },
  { code: "KPW", name: "(KPW) North Korean Won" },
  { code: "KRW", name: "(KRW) South Korean Won" },
  { code: "KWD", name: "(KWD) Kuwaiti Dinar" },
  { code: "KYD", name: "(KYD) Cayman Islands Dollar" },
  { code: "KZT", name: "(KZT) Kazakhstani Tenge" },
  { code: "LAK", name: "(LAK) Laotian Kip" },
  { code: "LBP", name: "(LBP) Lebanese Pound" },
  { code: "LKR", name: "(LKR) Sri Lankan Rupee" },
  { code: "LRD", name: "(LRD) Liberian Dollar" },
  { code: "LSL", name: "(LSL) Lesotho Loti" },
  { code: "LYD", name: "(LYD) Libyan Dinar" },
  { code: "MAD", name: "(MAD) Moroccan Dirham" },
  { code: "MDL", name: "(MDL) Moldovan Leu" },
  { code: "MGA", name: "(MGA) Malagasy Ariary" },
  { code: "MKD", name: "(MKD) Macedonian Denar" },
  { code: "MMK", name: "(MMK) Myanma Kyat" },
  { code: "MNT", name: "(MNT) Mongolian Tugrik" },
  { code: "MOP", name: "(MOP) Macanese Pataca" },
  { code: "MRO", name: "(MRO) Mauritanian Ouguiya (pre-2018)" },
  { code: "MRU", name: "(MRU) Mauritanian Ouguiya" },
  { code: "MUR", name: "(MUR) Mauritian Rupee" },
  { code: "MVR", name: "(MVR) Maldivian Rufiyaa" },
  { code: "MWK", name: "(MWK) Malawian Kwacha" },
  { code: "MXN", name: "(MXN) Mexican Peso" },
  { code: "MYR", name: "(MYR) Malaysian Ringgit" },
  { code: "MZN", name: "(MZN) Mozambican Metical" },
  { code: "NAD", name: "(NAD) Namibian Dollar" },
  { code: "NGN", name: "(NGN) Nigerian Naira" },
  { code: "NIO", name: "(NIO) Nicaraguan Córdoba" },
  { code: "NOK", name: "(NOK) Norwegian Krone" },
  { code: "NPR", name: "(NPR) Nepalese Rupee" },
  { code: "NZD", name: "(NZD) New Zealand Dollar" },
  { code: "OMR", name: "(OMR) Omani Rial" },
  { code: "PAB", name: "(PAB) Panamanian Balboa" },
  { code: "PEN", name: "(PEN) Peruvian Nuevo Sol" },
  { code: "PGK", name: "(PGK) Papua New Guinean Kina" },
  { code: "PHP", name: "(PHP) Philippine Peso" },
  { code: "PKR", name: "(PKR) Pakistani Rupee" },
  { code: "PLN", name: "(PLN) Polish Zloty" },
  { code: "PYG", name: "(PYG) Paraguayan Guarani" },
  { code: "QAR", name: "(QAR) Qatari Rial" },
  { code: "RON", name: "(RON) Romanian Leu" },
  { code: "RSD", name: "(RSD) Serbian Dinar" },
  { code: "RUB", name: "(RUB) Russian Ruble" },
  { code: "RWF", name: "(RWF) Rwandan Franc" },
  { code: "SAR", name: "(SAR) Saudi Riyal" },
  { code: "SBD", name: "(SBD) Solomon Islands Dollar" },
  { code: "SCR", name: "(SCR) Seychellois Rupee" },
  { code: "SDG", name: "(SDG) Sudanese Pound" },
  { code: "SEK", name: "(SEK) Swedish Krona" },
  { code: "SGD", name: "(SGD) Singapore Dollar" },
  { code: "SHP", name: "(SHP) Saint Helena Pound" },
  { code: "SLL", name: "(SLL) Sierra Leonean Leone" },
  { code: "SOS", name: "(SOS) Somali Shilling" },
  { code: "SRD", name: "(SRD) Surinamese Dollar" },
  { code: "SSP", name: "(SSP) South Sudanese Pound" },
  { code: "STD", name: "(STD) São Tomé and Príncipe Dobra (pre-2018)" },
  { code: "STN", name: "(STN) São Tomé and Príncipe Dobra" },
  { code: "SVC", name: "(SVC) Salvadoran Colón" },
  { code: "SYP", name: "(SYP) Syrian Pound" },
  { code: "SZL", name: "(SZL) Swazi Lilangeni" },
  { code: "THB", name: "(THB) Thai Baht" },
  { code: "TJS", name: "(TJS) Tajikistani Somoni" },
  { code: "TMT", name: "(TMT) Turkmenistani Manat" },
  { code: "TND", name: "(TND) Tunisian Dinar" },
  { code: "TOP", name: "(TOP) Tongan Pa'anga" },
  { code: "TRY", name: "(TRY) Turkish Lira" },
  { code: "TTD", name: "(TTD) Trinidad and Tobago Dollar" },
  { code: "TWD", name: "(TWD) New Taiwan Dollar" },
  { code: "TZS", name: "(TZS) Tanzanian Shilling" },
  { code: "UAH", name: "(UAH) Ukrainian Hryvnia" },
  { code: "UGX", name: "(UGX) Ugandan Shilling" },
  { code: "USD", name: "(USD) United States Dollar" },
  { code: "UYU", name: "(UYU) Uruguayan Peso" },
  { code: "UZS", name: "(UZS) Uzbekistan Som" },
  { code: "VEF", name: "(VEF) Venezuelan Bolívar Fuerte" },
  { code: "VND", name: "(VND) Vietnamese Dong" },
  { code: "VUV", name: "(VUV) Vanuatu Vatu" },
  { code: "WST", name: "(WST) Samoan Tala" },
  { code: "XAF", name: "(XAF) CFA Franc BEAC" },
  { code: "XAG", name: "(XAG) Silver Ounce" },
  { code: "XAU", name: "(XAU) Gold Ounce" },
  { code: "XCD", name: "(XCD) East Caribbean Dollar" },
  { code: "XDR", name: "(XDR) Special Drawing Rights" },
  { code: "XOF", name: "(XOF) CFA Franc BCEAO" },
  { code: "XPD", name: "(XPD) Palladium Ounce" },
  { code: "XPF", name: "(XPF) CFP Franc" },
  { code: "XPT", name: "(XPT) Platinum Ounce" },
  { code: "YER", name: "(YER) Yemeni Rial" },
  { code: "ZAR", name: "(ZAR) South African Rand" },
  { code: "ZMW", name: "(ZMW) Zambian Kwacha" },
  { code: "ZWL", name: "(ZWL) Zimbabwean Dollar" },
];

export default Currencies;
