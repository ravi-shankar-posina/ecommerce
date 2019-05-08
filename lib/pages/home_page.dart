
import 'package:flutter/material.dart';
import 'package:ecommerce/pages/page.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
// ignore: camel_case_types
class Home_screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new home();

}

class Photo {
  Photo({
    this.assetName,
    this.assetPackage,
    this.title,
    this.caption,
  });

  final String assetName;
  final String assetPackage;
  final String title;
  final String caption;
}

// ignore: camel_case_types
class home extends State<Home_screen> {
  List list = ['12', '11'];

  List<Photo> photos = <Photo>[
    Photo(
      assetName: 'images/logo.png',
      title: 'Fruits & Vegetables',
    ),
    Photo(
      assetName: 'images/logo.png',
      title: 'Frozen Veg',
    ),
    Photo(
      assetName: 'images/logo.png',
      title: 'Beverages',
    ),
    Photo(
      assetName: 'images/logo.png',
      title: 'Brannded Food',
    ),
    Photo(
      assetName: 'images/logo.png',
      title: 'Beauty & Personal Care',
    ),
    Photo(
      assetName: 'images/logo.png',
      title: 'Home Care & Fashion',
    ),
    Photo(
      assetName: 'images/logo.png',
      title: 'Non Veg',
    ),
    Photo(
      assetName: 'images/logo.png',
      title: 'Dairy, Bakery & Eggs',
    )
  ];

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

  final List<String> items = ['Pakodi', 'Ullipay', 'Biryani'];
  String name ='My Wishlist';
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    theme.textTheme.headline.copyWith(color: Colors.black54);
    ShapeBorder shapeBorder;
    if(!fetch) {
      fetch=true;
      getCategories();
    }

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.lightGreen,
        iconTheme: IconThemeData(color: Colors.black),

        title: Text("Taaza", style: TextStyle(color: Colors.black)),
        actions: <Widget>[
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            onPressed: () async {
              // ignore: unused_local_variable
              final selected = await showSearch<int>(
                context: context, delegate: null,
              );

            },
          ),
          new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Container(
              height: 150.0,
              width: 30.0,
              child: new GestureDetector(
                onTap: () {
                },
                child: Stack(
                  children: <Widget>[
                    new IconButton(
                        icon: new Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Page("No Content Yet")));
                        }),
                    list.length == 0
                        ? new Container()
                        : new Positioned(
                        child: new Stack(
                          children: <Widget>[
                            new Icon(Icons.brightness_1,
                                size: 20.0, color: Colors.orange.shade500),
                            new Positioned(
                                top: 4.0,
                                right: 5.5,
                                child: new Center(
                                  child: new Text(
                                    list.length.toString(),
                                    style: new TextStyle(
                                        color: Colors.white,
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new Card(
              child: UserAccountsDrawerHeader(
                accountName: new Text("Taaza"),
                accountEmail: new Text("taaza@gmail.com"),
                onDetailsPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Page("No Content Yet")));
                },
                decoration: new BoxDecoration(
                  backgroundBlendMode: BlendMode.difference,
                  color: Colors.white30,
                ),
                currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://www.fakenamegenerator.com/images/sil-male.png")),
              ),
            ),
            ExpansionTile(
              title: Text("Categories"),
              trailing: new Icon(Icons.add),
              children: _categories,
            ),
            new Card(
              elevation: 4.0,
              child: new Column(
                children: <Widget>[
                  new ListTile(
                      leading: Icon(Icons.favorite),
                      title: new Text(name),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Page("No Content Yet")));
                      }),
                  new Divider(),
                  new ListTile(
                      leading: Icon(Icons.history),
                      title: new Text("Order History "),


                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Page("No Content Yet")));

                      }),
                ],
              ),
            ),
            new Card(
              elevation: 4.0,
              child: new Column(
                children: <Widget>[
                  new ListTile(
                      leading: Icon(Icons.settings),
                      title: new Text("Setting"),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Page("No Content Yet")));
                      }),
                  new Divider(),
                  new ListTile(
                      leading: Icon(Icons.help),
                      title: new Text("Help"),
                      onTap: () {

                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Page("No Content Yet")));

                      }),
                ],
              ),
            ),
            new Card(
              elevation: 4.0,
              child: new ListTile(
                  leading: Icon(Icons.power_settings_new),
                  title: new Text(
                    "Logout",
                    style:
                    new TextStyle(color: Colors.redAccent, fontSize: 17.0),
                  ),
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Page("No Content Yet")));
                  }),
            )
          ],
        ),
      ),
      body: new SingleChildScrollView(
        child: Container(
          child: new Column(children: <Widget>[
            new Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _verticalD(),
                  new GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Page("No Content Yet")));
                    },
                    child: new Text(
                      'Best value',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  _verticalD(),
                  new GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Page("No Content Yet")));
                    },
                    child: new Text(
                      'Top sellers',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black26,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  _verticalD(),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Page("No Content Yet")));
                        },
                        child: new Text(
                          'All',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black26,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      _verticalD(),
                      IconButton(
                        icon: keyloch,
                        color: Colors.black26,
                        onPressed: () {

                        },
                      )
                    ],
                  )
                ]),
            new Container(
              height: 188.0,
              margin: EdgeInsets.only(left: 5.0),
              child:
              ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                SafeArea(
                  top: true,
                  bottom: true,
                  child: Container(
                    width: 270.0,

                    child: Card(
                      shape: shapeBorder,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 180.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Image.asset(
                                    'images/logo.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  top: true,
                  bottom: true,
                  child: Container(
                    width: 270.0,

                    child: Card(
                      shape: shapeBorder,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 180.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Image.asset(
                                    'images/logo.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  top: true,
                  bottom: true,
                  child: Container(
                    width: 270.0,

                    child: Card(
                      shape: shapeBorder,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 180.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Image.asset(
                                    'images/logo.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  top: true,
                  bottom: true,
                  child: Container(
                    width: 270.0,

                    child: Card(
                      shape: shapeBorder,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 180.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Image.asset(
                                    'images/logo.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            new Container(
              margin: EdgeInsets.only(top: 7.0),
              child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _verticalD(),
                    new GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Page("No Content Yet")));
                      },
                      child: new Text(
                        'Categories',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    _verticalD(),
                    new GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Page("No Content Yet")));
                      },
                      child: new Text(
                        'Popular',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black26,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    _verticalD(),
                    new Row(
                      children: <Widget>[
                        new GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> Page("No Content Yet")));
                          },
                          child: new Text(
                            'Whats New',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black26,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ]),
            ),
            new Container(
              alignment: Alignment.topCenter,
              height: 800.0,

              child: new GridView.builder(
                  itemCount: photos.length,
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(10.0),
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return new GestureDetector(
                        onTap: (){

                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Page("No Content Yet")));
                        },

                        child: new Container(
                            margin: EdgeInsets.all(5.0),
                            child: new Card(
                              shape: shapeBorder,
                              elevation: 3.0,
                              child: new Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 152.0,
                                      child: Stack(
                                        children: <Widget>[
                                          Positioned.fill(
                                              child: Image.asset(
                                                photos[index].assetName,
                                                fit: BoxFit.cover,
                                              )),
                                          Container(
                                            color: Colors.black38,
                                          ),
                                          Container(
                                            //margin: EdgeInsets.only(left: 10.0),
                                            padding: EdgeInsets.only(
                                                left: 3.0, bottom: 3.0),
                                            alignment: Alignment.bottomLeft,
                                            child: new GestureDetector(
                                              onTap: () {
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=> Page("No Content Yet")));
                                              },
                                              child: new Text(
                                                photos[index].title,
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.white,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                        )

                    );
                  }),
            )
          ]),
        ),
      ),
    );
  }
  Icon keyloch = new Icon(
    Icons.arrow_forward,
    color: Colors.black26,
  );

  _verticalD() => Container(
    margin: EdgeInsets.only(left: 5.0, right: 0.0, top: 5.0, bottom: 0.0),
  );


}