import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailPageView extends StatefulWidget {

  final String nama,gambar,tahun,rating;
  const DetailPageView ({ this.nama, this.gambar, this.tahun, this.rating });

  @override
  _DetailPageViewState createState() => _DetailPageViewState();
}

class _DetailPageViewState extends State<DetailPageView>  {
  var fav = false;
  var dummy = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras laoreet et nisl in luctus. Mauris eu felis molestie, viverra tellus ut, tempus ex. Curabitur ac mi in urna suscipit pellentesque. Pellentesque ut ipsum non sem consequat gravida quis a velit. Nullam gravida sit amet eros quis vestibulum. Sed neque mi, sagittis et varius id, maximus nec mauris. Praesent ac fringilla nibh, aliquet aliquam neque. Quisque vitae vehicula enim, eget fringilla tellus.";

  initSharedPref() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSharedPref();
  }

  addFav(String tittle) async {

//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    prefs.setBool('boolValue', true);
    setState(() {
      fav = true;
    });

  }

  removeFav(String tittle) async {

//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    prefs.remove(tittle);
    setState(() {
      fav = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nama),
        actions: <Widget>[
          (fav == false) ?
          IconButton(icon: Icon(Icons.favorite_border), onPressed: (){
            addFav(widget.nama);
          }) :
          IconButton(icon: Icon(Icons.favorite), onPressed: (){
            removeFav(widget.nama);
          })
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(10.0)),
          Container(
            height: 300,
            child: Hero(
                tag: widget.nama,
                child: Material(
                  child: InkWell(
                    child: Image.asset(widget.gambar,fit: BoxFit.contain,),
                  ),
                )
            ),
          ),
          DescriptionMovie(
            nama: widget.nama,
            tahun: widget.tahun,
            rating: widget.rating,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 20),
            child: Text(
              dummy,
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}


//class DetailPageView extends StatelessWidget {
//
//  DetailPageView({this.nama,this.gambar,this.tahun,this.rating});
//
//  final String nama,gambar,tahun,rating;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(nama),
//        actions: <Widget>[
//          IconButton(icon: Icon(Icons.favorite_border), onPressed: (){})
//        ],
//      ),
//      body: ListView(
//        children: <Widget>[
//          Padding(padding: EdgeInsets.all(10.0)),
//          Container(
//            height: 300,
//            child: Hero(
//                tag: nama,
//                child: Material(
//                  child: InkWell(
//                    child: Image.asset(gambar,fit: BoxFit.contain,),
//                  ),
//                )
//            ),
//          ),
//          DescriptionMovie(
//            nama: nama,
//            tahun: tahun,
//            rating: rating,
//          )
//        ],
//      ),
//    );
//  }
//}
class DescriptionMovie extends StatelessWidget {

  DescriptionMovie({this.nama,this.tahun,this.rating});
  final String nama,tahun,rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(nama,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(tahun,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey
                    ),
                  )
                ],
              )
          ),
          Row(
            children: <Widget>[
              Icon(Icons.star,size: 25.0,color: Colors.yellow,),
              Text(rating,style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.grey),)
            ],
          )
        ],
      ),
    );
  }
}

