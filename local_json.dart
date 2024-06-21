import 'dart:convert';

import 'package:flutter/material.dart';
import 'model/araba_model1.dart';


class LocalJson extends StatefulWidget {
  const LocalJson({super.key});

  @override
  State<LocalJson> createState() => _LocalJsonState();
}

class _LocalJsonState extends State<LocalJson> {
  
  @override
  Widget build(BuildContext context) {
    arabalarJsonOku();
    return Scaffold(
      appBar: AppBar(
        title: Text('local Json işlemleri'),
      ),
      body: FutureBuilder<List<Araba>>(
        future: arabalarJsonOku(), 
      builder: (context,snapshot){
        if (snapshot.hasData){
          List<Araba> arabaListesi= snapshot.data!;
          return ListView.builder(
            itemCount: arabaListesi.length,
            itemBuilder: (context,index){
            return ListTile(
              title: Text(arabaListesi[index].arabaAdi.toString()),
              subtitle:  Text(arabaListesi[index].lke.toString()),
              leading: CircleAvatar(
                child: Text(arabaListesi[index].model![0].fiyat.toString()),
              ),

            );
          },);
        }else if(snapshot.hasError){
          return  Center(
            child: Text(snapshot.error.toString()),
          );
        }else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        
        }
      })
    );
  }

  Future< List< Araba>> arabalarJsonOku() async{
    try{
      String okunanString = await DefaultAssetBundle.of(context).loadString("assets/data/arabalar.json");
  var jsonObject= jsonDecode(okunanString);
  //debugPrint(okunanString);
  //debugPrint("**********");
  //List arabaListesi= jsonObject;
  //debugPrint(arabaListesi[1]["araba_adi"].toString());

 

List<Araba> tumArabalar= (jsonObject as List).map((arabaMap)=> Araba.fromMap(arabaMap)).toList();
return tumArabalar;
    } catch(e){
      debugPrint(e.toString());
      return [];
    }
  


  }
  
}