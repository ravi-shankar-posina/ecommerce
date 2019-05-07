import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _categories = <Widget> [];
  var fetch = false;

  Future<String> getCategories() async {
    var response = await http.get(
      Uri.encodeFull("http://192.168.0.103/taaza/api/getCategory.php"),
      headers: {
        "Accept":"application/json"
      }
    );

    var items = json.decode(response.body);
    var temp = <Widget> [];
    items.forEach((item) {
      print(item);
      temp.add(new ListTile(
          title: new Text(item),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("First Page")));
          }
      ));
      setState(() {
        _categories = temp;
      });
    });

    return response.body;

  }

  @override
  Widget build(BuildContext context) {
    if(!fetch) {
      fetch=true;
      getCategories();
    }
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
              children: _categories,
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