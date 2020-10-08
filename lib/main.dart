import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        appBar: AppBar(title: Text('Flutter Workshop')),
      ),
    );
  }
}
