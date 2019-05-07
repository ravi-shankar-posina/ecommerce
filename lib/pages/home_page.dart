import 'package:flutter/material.dart';

import './page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle:true,
          title:const Text('Taaza', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.lightGreen,
          actions: <Widget>[
            IconButton(
            icon: Icon(Icons.notifications,color: Colors.black,),
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("No new notifications")));
              },
          ),],
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: new NetworkImage("https://www.getmonero.org/press-kit/symbols/monero-symbol-480.png"),
                        fit: BoxFit.fitHeight
                    )
                ),
              ),
              ExpansionTile(
              title: Text("Categories"),
              trailing: new Icon(Icons.add),
              children: <Widget>[
                new ListTile(
                    title: new Text("Category One"),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("First Page")));
                    }
                ),
                new ListTile(
                    title: new Text("Category Two"),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("First Page")));
                    }
                ),
              ],
              ),
              new ListTile(
                  title: new Text("Cart"),
                  trailing: new Icon(Icons.shopping_basket),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("First Page")));
                  }
              ),
              new ListTile(
                  title: new Text("My Account"),
                  trailing: new Icon(Icons.assignment_ind),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("Second Page")));
                  }
              ),
              new ListTile(
                  title: new Text("Contact Information"),
                  trailing: new Icon(Icons.phone),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("Second Page")));
                  }
              ),
              new ListTile(
                  title: new Text("Notifications"),
                  trailing: new Icon(Icons.notifications),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("Second Page")));
                  }
              ),
              new ListTile(
                  title: new Text("FAQ"),
                  trailing: new Icon(Icons.question_answer),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("Second Page")));
                  }
              ),
              new Divider(),
              new ListTile(
                title: new Text("Cancel"),
                trailing: new Icon(Icons.cancel),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
        body: new Center(
          child: new Text("Drawer Tutorial", style: new TextStyle(fontSize: 35.0)),
        )
    );
  }
}