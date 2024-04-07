import 'dart:convert';
import 'package:http/http.dart';

const String apiKey = '904D4014-C325-4F38-9264-EE61CAA703C3';
const List<String> currenciesList = [
  'PKR',
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];
const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future<double> getExchangeRate(String baseCurrency, String targetCurrency) async {
    try {
      final Uri url = Uri.parse('https://rest.coinapi.io/v1/exchangerate/$baseCurrency/$targetCurrency?apikey=$apiKey');

      final response = await get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final double exchangeRate = data['rate'];
        return exchangeRate;
      } else {
        throw Exception('Failed to fetch exchange rate: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch exchange rate: $e');
    }
  }
}
