import 'package:flutter/material.dart';
import 'currency.dart';
import 'book.dart';
import 'sportdetails.dart';
class Sport extends StatefulWidget {
  const Sport({super.key});

  @override
  State<Sport> createState() => _SportState();
}

class _SportState extends State<Sport> {
  List<double> selectedPrices = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text(
          'press on the picture to buy',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_bag),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Bag(selectedPrices: selectedPrices),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.monetization_on),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Currency(),
                ),
              );
            },
          ),
        ],
        backgroundColor: Colors.indigoAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 6.0,
                mainAxisSpacing: 20.0,
              ),
              itemCount: sbooks.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedPrices.add(sbooks[index].price);
                        });
                      },
                      child: Container(
                        width: 200,
                        height: 170.5,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(sbooks[index].image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(

                      children: [
                        Text(
                          '${sbooks[index].price.toString()} \$',
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                        SizedBox(width: 10,),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Sportdetails(),
                              settings: RouteSettings(arguments: sbooks[index].toString()),
                            ));
                          },
                          child: Text('Details'),
                        ),
                      ],mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
///n2alet el bag lahon
class Bag extends StatelessWidget {
  final List<double> selectedPrices;

  Bag({Key? key, required this.selectedPrices}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double total = selectedPrices.fold(0, (previous, current) => previous + current);

    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text('Bag'),
        actions: [
          IconButton(
            icon: Icon(Icons.monetization_on),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Currency(),
                ),
              );
            },
          ),
        ],
        backgroundColor: Colors.indigoAccent,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40,),
            Container(
              child: Text(
                'Total Price: ${total.toString()} \$',
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
