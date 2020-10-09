import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:starter_flutter/product.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Product> products = [];

  @override
  void initState() {
    getItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                  accountName: Text('Flutter Workshop'),
                  accountEmail: Text('flutter@thoughtworks.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.yellow,
                    child: Text('F'),
                  )),
              Expanded(
                child: ListView(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: ListTile(
                        title: Text('Home'),
                        leading: Icon(Icons.home),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: ListTile(
                        title: Text('Share'),
                        leading: Icon(Icons.share),
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () {},
                      child: ListTile(
                        title: Text('Settings'),
                        leading: Icon(Icons.settings),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: ListTile(
                        title: Text('Logout'),
                        leading: Icon(Icons.power_settings_new),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        body: products.isEmpty ? Center(child: CircularProgressIndicator()) : ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
             var product = products[index];
             return Padding(
               padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
               child: Card(
                 child: Padding(
                   padding: const EdgeInsets.all(4),
                   child: ListTile(
                     title: Text(
                       product.name,
                     ),
                     subtitle: Text(product.price),
                     trailing: RaisedButton(
                         onPressed: () {},
                         child: Text('Buy', style: TextStyle(color: Colors.white)),
                         color: Colors.green),
                     leading: SizedBox(
                         width: 40, height: 40, child: Image.network(product.image, fit: BoxFit.fill)),
                   ),
                 ),
               ),
             );
          },
        ),
        appBar: AppBar(title: Text('Flutter Workshop')),
      ),
    );
  }

  Future<void> getItems() async {
    var response = await http.get('https://run.mocky.io/v3/86714065-50f3-423b-a048-ee58c46733ea');
    var jsonBody = jsonDecode(response.body);
    setState(() {
      products = productsFromJson(jsonBody);
    });
  }
}
