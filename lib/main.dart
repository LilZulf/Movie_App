import 'package:flutter/material.dart';
import 'package:movie_app/page/MoviePageView.dart';
import 'page/HomePageView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:MoviePageView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PageStateLess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text("list 1"),
              trailing: Icon(Icons.account_balance_wallet),
            ),
            ListTile(
              title: Text("list 2"),
              trailing: Icon(Icons.account_balance),
            ),
            ListTile(
              title: Text("list 3"),
              trailing: Icon(Icons.ac_unit),
            )
          ],
        ),
    );
  }
}
class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  List<int> item = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for(int i = 0;i<15;i++){
        item.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context,int index){
          return ListTile(
            title: Text("Index Ke-" + index.toString()),
            trailing: Icon(Icons.info),
          );
        },
        itemCount: item.length,

      ),
    );
  }
}

class GridViewPage extends StatefulWidget {
  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {

  List<int> item = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for(int i = 0;i<8;i++){
      item.add(i);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid View"),
        elevation: 20.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePageView()));
            },
          ),
        ],
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: (BuildContext context,int index){
            return Card(
              color: Colors.amberAccent,
              child: Padding(padding: EdgeInsets.all(25),
              ),
            );
          }
      ),
    );
  }
}

