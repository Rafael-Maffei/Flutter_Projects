// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String emptyPicture = "emptyProfilePicture.png";

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  String? name;

  void setDisplayName() async {
    var sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      name = sharedPreferences.getString("displayName") ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    setDisplayName();
  }

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
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
            ),
            child: Column(
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
                            splashColor: Colors.transparent,
                            onTap: () {},
                            child: Image.asset("assets/" + emptyPicture,
                                scale: 3.5),
                          )),
                    ],
                  ),
                ),
                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    '${name}',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                // ignore: prefer_const_constructors
                Container(
                  width: double.infinity,
                  child: Text(
                    'Histórico',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 50,
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: EdgeInsets.zero,
                        key: UniqueKey(),
                        title: Text("teste $index"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
