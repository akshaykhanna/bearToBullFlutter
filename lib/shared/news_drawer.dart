import 'package:flutter/material.dart';

class NewsDrawer extends StatelessWidget {
  const NewsDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
