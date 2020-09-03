import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FragmentHome extends StatefulWidget {
  @override
  _FragmentHomeState createState() => _FragmentHomeState();
}

class _FragmentHomeState extends State<FragmentHome> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void showAlertDialog(){
    showDialog(context: context,
    child: AlertDialog(
      title: Text("This Is Alert"),
      content: Text("Hi i'm Alert"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.cancel,color: Colors.red,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        IconButton(
          icon: Icon(Icons.check_circle,color: Colors.green,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ],
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: (){
              showAlertDialog();
            },
            child: Text("Simple Alert",
            style: TextStyle(
              color: Colors.white
            ),
            ),
            color: Colors.blueAccent,
          ),
          RaisedButton(
            onPressed: (){
              Fluttertoast.showToast(msg: "This is toast");
            },
            child: Text("Toast",
            style: TextStyle(
              color: Colors.white
            ),
            ),
            color: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}
