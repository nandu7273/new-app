import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newapp/utilities/constants.dart';

class dashboard extends StatefulWidget {
  final String name;

  dashboard({Key key, this.name}) : super(key: key);

  @override
  _dashboard createState() => _dashboard();
}

Widget _buildEmailTF() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text(
        'Email',
        style: kLabelStyle,
      ),
      SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: SearchBoxDecorationStyle,
      //  height: 60.0,

        child: TextField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.blueGrey,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            suffixIcon: Icon(
              Icons.search,
              color: Colors.black45,
            ),
            hintText: 'Search Here',
            hintStyle: kHintTextStyle,
          ),
        ),
      ),
    ],
  );
}

class _dashboard extends State<dashboard> {
  final String title = 'New Appp ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.name}"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.power_settings_new),
              onPressed: () {
                SystemNavigator.pop();
              }),
        ],
      ),
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical: 120.0,
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[_buildEmailTF()]),
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("${widget.name}"),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Add Provider'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Log Out'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                SystemNavigator.pop();
                //Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
