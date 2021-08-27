import 'package:flutter/material.dart';
import 'package:q1/model/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:q1/widget/onecarditem.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'users List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'User List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Users>> _getUsers() async {
    var data =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var jsonData = json.decode(data.body);
    List<Users> users = [];
    for (var u in jsonData) {
      Users user = Users(
          id: u['id'],
          name: u['name'],
          username: u['username'],
          email: u['email'],
          addressInfo: u['address'],
          phone: u['phone'],
          website: u['website'],
          company: u['company']);

      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    _getUsers();
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          child: FutureBuilder(
            future: _getUsers(),
            builder: (BuildContext context, AsyncSnapshot snap) {
              return ListView.builder(
                itemCount: snap.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return OneCardItems(
                    snap: snap.data[index],
                  );
                },
              );
            },
          ),
        ));
  }
}
