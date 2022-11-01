// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

String emptyPicture = "emptyProfilePicture.png";

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.orange,
            scaffoldBackgroundColor: Colors.grey[850]),
        home: Scaffold(
          appBar: AppBar(
              title: Text('justSing!'),
              elevation: 0,
              leading: GestureDetector(
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop('/search'),
                  child: Icon(Icons.home),
                ),
              ),
              actions: [
                GestureDetector(
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pushNamed('/login'),
                    child: Text("Login"),
                  ),
                )
              ]),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                        shape: CircleBorder(),
                        color: Colors.transparent,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          splashColor: Colors.orange,
                          onTap: () {},
                          child:
                              Image.asset("assets/" + emptyPicture, scale: 3.5),
                        )),
                  ],
                ),
              ),
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  'Nome do usuário',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 240, 5),
                child: Text(
                  'Histórico',
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Flexible(
                  child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ))
            ],
          ),
        ));
  }
}
