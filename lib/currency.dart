import 'package:flutter/material.dart';

class Currency extends StatefulWidget {
  const Currency({super.key});

  @override
  State<Currency> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  TextEditingController amountController = TextEditingController();
  double result = 0;
  String from = 'USD';
  String to = 'EUR';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text('Currency Exchange', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount',
                labelStyle: TextStyle(color: Colors.white), // Set label text color
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton(
                  value: from,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        from = value;
                      });
                    }
                  },
                  items: ['USD', 'EUR', 'LBP']
                      .map((currency) => DropdownMenuItem(
                    value: currency,
                    child: Text(currency, style: TextStyle(color: Colors.black)), // Set dropdown item text color
                  ))
                      .toList(),
                  hint: Text('From', style: TextStyle(color: Colors.white)), // Set hint text color
                ),
                DropdownButton(
                  value: to,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        to = value;
                      });
                    }
                  },
                  items: ['USD', 'EUR', 'LBP']
                      .map((currency) => DropdownMenuItem(
                    value: currency,
                    child: Text(currency, style: TextStyle(color: Colors.black)), // Set dropdown item text color
                  ))
                      .toList(),
                  hint: Text('To', style: TextStyle(color: Colors.white)), // Set hint text color
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  result = convert();
                });
              },
              child: Text('Convert', style: TextStyle(color: Colors.white)), // Set button text color
            ),
            SizedBox(height: 20),
            Text('Result: $result $to', style: TextStyle(color: Colors.white,fontSize: 20,fontStyle: FontStyle.italic),), // Set result text color
          ],
        ),
      ),
    );
  }

  double convert() {
    double amount = double.parse(amountController.text);
    Map<String, double> exchangeRates = {
      'USD': 1,
      'EUR': 0.85,
      'LBP': 90000,
    };
    double fromRate = exchangeRates[from] ?? 1;
    double toRate = exchangeRates[to] ?? 1;
    return (amount / fromRate) * toRate;
  }
}
