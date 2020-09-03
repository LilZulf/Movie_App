import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/page/DetailPageView.dart';

class MoviePageView extends StatefulWidget {
  @override
  _MoviePageViewState createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {

  List<Container> list_movie = new List();

  var daftar_movie = [
    {"nama":"Howl Moving Castle","images":"assets/howl.jpg","year":"2004","rating":"4.3"},
    {"nama":"Kaguya-hime Monogatari","images":"assets/kaguya.jpg","year":"2013","rating":"4.4"},
    {"nama":"Kiki's Delivery Service","images":"assets/kiki.jpeg","year":"1989","rating":"4.8"},
    {"nama":"Castle in The Sky","images":"assets/laputa.jpg","year":"1986","rating":"4.0"},
    {"nama":"Mononoke-hime","images":"assets/mononoke.png","year":"1997","rating":"4.4"},
    {"nama":"Ponyo","images":"assets/ponyo.jpg","year":"2008","rating":"4.1"},
    {"nama":"Porco Rosso","images":"assets/porco.jpg","year":"1992","rating":"4.1"},
    {"nama":"Spirited Away","images":"assets/spirited.png","year":"2001","rating":"4.8"},
    {"nama":"My Neighbor Totoro","images":"assets/totoro.jpg","year":"1988","rating":"4.3"},
    {"nama":"Whisper of Heart","images":"assets/whisper.jpg","year":"1995","rating":"4.2"},
  ];

  _buatDataList() {

    for(var i=0;i<daftar_movie.length;i++){
      final list_movienya = daftar_movie[i];
      final String images = list_movienya['images'];

      list_movie.add(new Container(
        padding: EdgeInsets.all(20.0),
        child: Card(
          child: InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailPageView(
                nama: list_movienya['nama'],
                gambar: images,
                tahun: list_movienya['year'],
                rating: list_movienya['rating'],
              )));
            },
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(10.0)),
                Hero(
                  tag: list_movienya['nama'],
                  child: Image.asset(images,
                    height: 130.0,
                    width: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                Text(list_movienya['nama'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ));
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _buatDataList();
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    // Mengatur grid
    final double item_height = (size.height - kToolbarHeight - 24)/2;
    final double item_width = size.width / 2;

    return Scaffold(
      appBar: AppBar(
        title: Text("Ghibli Movie List"),
      ),
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: GridView.count(crossAxisCount: 2,
          childAspectRatio: (item_width/item_height),
          controller: ScrollController(keepScrollOffset: false),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: list_movie,
        ),
      ),
    );
  }
}
