import 'package:flutter/material.dart';
bool switchValue = false;
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(120.0); // Increase the height

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 60.0), // Increase vertical padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Dark Mode'),
              Switch(
                value: switchValue,
                onChanged: (value) {
                  switchValue = value;
                },
              ),
            ],
          ),
        ),
      ],
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        height: 150,
        width: double.infinity,
        child: Center(
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/icon.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Color.fromARGB(101, 182, 255, 227),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.menu),
          ),
        ),
      ),
    );
  }
}
class YourWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
              onTap: () {
                // Handle the onTap here
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                // Handle the onTap here
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle the onTap here
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Your Widget Body'),
      ),
    );
  }
}
