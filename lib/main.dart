import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//https://jsonplaceholder.typicode.com/posts
void main() async{
  List _data = await getJson();
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('JSON Parsing'),
      ),
      body: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (BuildContext context, var index){
            return Column(
              children: [
                Divider(height: 14.4,),
                Column(
                  children: [
                    Container(width: 300,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage('${_data[index]['url']}')
                        ),
                      ),
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                              height: 60,
                              padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                              color: Colors.white,
                              child: Text('${_data[index]['title']}'))),
                    )
                  ],
                )
              ],
            );
          })
    ),
  ));
}

Future<List> getJson() async{
  var url = Uri.parse('https://jsonplaceholder.typicode.com/photos');

  http.Response response = await http.get(url);

  return jsonDecode(response.body);
}













/*





















Future<List> getJson() async{

  var jsonUrl = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  
  http.Response response = await http.get(jsonUrl);

  return jsonDecode(response.body);
}


*/
