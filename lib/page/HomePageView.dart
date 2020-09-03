import 'package:flutter/material.dart';
import 'fragment/FragmentHome.dart';

class HomePageView extends StatefulWidget {
  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
          bottom: TabBar(
            controller: tabController,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.home),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.history),
                text: "History",
              ),
              Tab(
                icon: Icon(Icons.account_circle),
                text: "Account",
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
            Center(
              child: FragmentHome(),
            ),
            Center(
              child: Image.asset('assets/ghibli.jpg'),
            ),
            Center(
              child: Image.network("https://www.jrailpass.com/blog/wp-content/uploads/2020/04/studio-ghibli-theme-park.jpg"),
            ),
          ],
        ),
      ),
    );
  }
}
