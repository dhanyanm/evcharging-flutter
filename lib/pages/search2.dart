import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final dref=FirebaseDatabase.instance.reference();
  late DatabaseReference databaseReference;
  setData(){
    dref.child("Info").set(
        {
          'name': "Green Tech Charging Station",
          'description': "1st Main 1st Cross Rd,Kamakshipalya,Bengaluru,A connector with 2 type ",
          'phone no' : "9845612397",
          'Status' : "Available"

        }
    ).asStream();
    dref.child("Info1").set(
        {
          'name': "BESCOM Charging Station",
          'description': "Aicobo Nagar, 1st Stage, BTM 1st Stage, Bengaluru, A connector with 2 type ",
          'phone no' : "9845612397",
          'Status' : "Busy"

        }
    ).asStream();
    dref.child("Info2").set(
        {
          'name': "ZON MOTORS",
          'description': "Shop No:238, 7th Block, Jayanagar, Bengaluru ",
          'phone no' : "080 3221 1322",
          'Status' : "Available"

        }
    ).asStream();

  }

  showData(){
    dref.once().then((snapshot){
      print(snapshot.value);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databaseReference = dref;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

        appBar: AppBar(
          brightness: Brightness.dark,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          title: Text('EV Station near me'),
          toolbarHeight: 75,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              gradient: LinearGradient(
                  colors: [Colors.teal.shade400, Colors.grey],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter
              ),
            ),
          ),
        ),
        body: Column(
            children:[
              TextButton(
                  onPressed: setData,
                  child:Text(
                    "Store Data",style: TextStyle(
                      color:Colors.grey),)),

              // FirebaseAnimatedList(
              //     shrinkWrap: true,
              //     query: databaseReference,
              //     itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation animation, int index){
              //       return ListTile(
              //           leading: Text(snapshot.value['Status'].toString()),
              //           title: Text(snapshot.value['name']),
              //           subtitle:  Text(snapshot.value['description']),
              //           trailing: Text(snapshot.value['phone no'].toString())
              //       );
              //
              //     })
            ]

        )
    );
  }
}

