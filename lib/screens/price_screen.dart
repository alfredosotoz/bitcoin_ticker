import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String dropDownSelection = 'USD';

  String bitcoinValueInUSD = '?';

  void getData() async {
    try {
      double data = await CoinData().getCoinData(dropDownSelection);
      setState(() {
        bitcoinValueInUSD = data.toStringAsFixed(0);
      });
    } catch (e) {
      print(e);
    }
  }

  void initState(){
    super.initState();
    getData();
  }

  DropdownButton<String> androidDropDown() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (int i = 0; i < currenciesList.length; i++) {
      String currency = currenciesList[i];
      var newItem = DropdownMenuItem(
        child: Text('$currency'),
        value: '$currency',
      );
      dropDownItems.add(newItem);
    }
    return DropdownButton<String>(
      value: dropDownSelection,
      items: dropDownItems,
      onChanged: (value) {
        setState(() {
          dropDownSelection = value;
          getData();
        });
      },
    );
  }

  CupertinoPicker iOSPicker(){

    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.amberAccent,
      itemExtent: 32,
      onSelectedItemChanged: (selected) {
        print(selected);
        dropDownSelection = currenciesList[selected];
        getData();
      },
      children: pickerItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.orange,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $bitcoinValueInUSD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
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
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.amberAccent,
              child: Platform.isIOS? iOSPicker() : androidDropDown(),
          ),
        ],
      ),
    );
  }
}

//                 DropdownMenuItem(
//                  child: Text('USD'),
//                  value: 'USD',
//                ),
//                DropdownMenuItem(
//                  child: Text('MXN'),
//                  value: 'MXN',
//                ),
//                DropdownMenuItem(
//                  child: Text('EURO'),
//                  value: 'EURO',
//                ),
//                DropdownMenuItem(
//                  child: Text('YUAN'),
//                  value: 'YUAN',
//                ),

//DropdownButton<String>(
//value: dropDownSelection,
//items: getDropDownItems(),
//onChanged: (value){
//setState(() {
//dropDownSelection = value;
//});
//},
//),
