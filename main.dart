import 'package:flutter/material.dart';
import 'package:flutter_application_4/local_json.dart';
import 'package:flutter_application_4/remote_api.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter Demo',
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text('HTTP JSON '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const LocalJson()),
                );
                
              },
               child:  const Text('Local Json')),
               ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const RemoteApi()));
               },
                child: Text('Remote Api') ),
          ],
        ),
      )
    );
  }
}