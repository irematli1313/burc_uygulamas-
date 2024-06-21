import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/model/user_model.dart';

class RemoteApi extends StatefulWidget {
  const RemoteApi({super.key});

  @override
  State<RemoteApi> createState() => _RemoteApiState();
}

class _RemoteApiState extends State<RemoteApi> {
  Future<List<User>?> _getUserList() async{
    try{
     var response=  await Dio().get('https://jsonplaceholder.typicode.com/users');
     List<User> _userList= [];
     if(response.statusCode==200){
      
    var userList = (response.data as List).map((e)=> User.fromMap(e)).toList();
    return userList;
     }
     return _userList;
    } on DioException catch(e){
      return Future.error(e.message.toString());
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder<List<User>?>(
          future: _getUserList(), 
          builder: (context,snapshot){
            if(snapshot.hasData){
              var userList= snapshot.data!;
              return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index){
                  var user = userList[index];
                  return ListTile(
                    title: Text(user.email.toString()),
                    subtitle: Text(user.address.toString()),
                    leading: Text(user.id.toString()),);
                    
                  
                });
            }else if(snapshot.hasError){
              return Text(snapshot.error.toString() );

            }else 
            return CircularProgressIndicator();
          }),
      ),
    );
  }
}