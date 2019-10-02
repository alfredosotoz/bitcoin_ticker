import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  String dropDownSelection = 'USD';

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
                  '1 BTC = ? USD',
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
            child: DropdownButton<String>(
              value: dropDownSelection,
              items: [
                DropdownMenuItem(
                  child: Text('USD'),
                  value: 'USD',
                ),
                DropdownMenuItem(
                  child: Text('MXN'),
                  value: 'MXN',
                ),
                DropdownMenuItem(
                  child: Text('EURO'),
                  value: 'EURO',
                ),
                DropdownMenuItem(
                  child: Text('YUAN'),
                  value: 'YUAN',
                ),
              ],
              onChanged: (value){
                setState(() {
                  dropDownSelection = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
