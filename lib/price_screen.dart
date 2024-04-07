import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  late String selectedCurrency;
  late String baseCurrency;
  late Map<String, double> exchangeRates = {}; // Map to store exchange rates for each crypto currency
  late List<String> cryptoRates = []; // List to store exchange rate strings for each crypto currency

  // Method to get dropdown items for Android
  DropdownButton<String> androidDropDown() {
    List<DropdownMenuItem<String>> dropDownItems = [];

    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        value: currency,
        child: Text(currency),
      );
      dropDownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropDownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value!;
          fetchExchangeRate(); // Fetch exchange rates when currency selection changes
        });
      },
    );
  }

  // Method to get CupertinoPicker for iOS
  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];

    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          fetchExchangeRate(); // Fetch exchange rates when currency selection changes
        });
      },
      children: pickerItems,
    );
  }

  // Asynchronous function to fetch exchange rates for each crypto currency
  void fetchExchangeRate() async {
    CoinData coinData = CoinData();
    baseCurrency = selectedCurrency; // Update base currency to the selected currency
    for (String cryptoCurrency in cryptoList) {
      double exchangeRate = await coinData.getExchangeRate(cryptoCurrency, baseCurrency);
      exchangeRates[cryptoCurrency] = exchangeRate; // Store exchange rate in the map
    }
    updateCryptoRates(); // Update exchange rate strings for each crypto currency
  }

  // Method to update exchange rate strings for each crypto currency
  void updateCryptoRates() {
    cryptoRates.clear();
    for (String cryptoCurrency in cryptoList) {
      double rate = exchangeRates[cryptoCurrency] ?? 0.0;
      cryptoRates.add('1 $cryptoCurrency = ${rate.toInt()} $selectedCurrency'); // Format exchange rate string
    }
    setState(() {}); // Update the UI after updating the exchange rates
  }

  @override
  void initState() {
    super.initState();
    baseCurrency = cryptoList.first;
    selectedCurrency = currenciesList.first; // Set initial currency to the first item in currenciesList
    fetchExchangeRate(); // Fetch initial exchange rates when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          for (int i = 0; i < cryptoList.length; i++)
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              child: Card(
                color: Colors.lightBlueAccent,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                  child: Text(
                    cryptoRates.isNotEmpty ? cryptoRates[i] : '', // Use the fetched exchange rate
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropDown(),
          ),
        ],
      ),
    );
  }
}
