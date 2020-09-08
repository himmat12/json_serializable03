import 'package:flutter/material.dart';

import 'model/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url;
  List data = [];
  var response;
  bool isLoading = true;

  List<User> userList = [];

  Future<List<User>> getUsers() async {
    url = "https://jsonplaceholder.typicode.com/users";
    response = await http.get(url);
    data = json.decode(response.body);

    setState(() {
      userList = data.map((json) => User.fromjson(json)).toList();
      isLoading = false;
    });

    return userList;
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JSON Serialization 03"),
      ),
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(userList[index].name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(userList[index].email),
                          Text(userList[index].userName),
                          Text(userList[index].address.city),
                          Text("Geo :  " +
                              userList[index].address.geo.lat +
                              "   " +
                              userList[index].address.geo.lng),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
