import 'package:flutter/material.dart';

String iconProfile = "iconProfile.png";
String iconSearch = "iconSearch.png";

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.orange,
          scaffoldBackgroundColor: Colors.grey[850]),
      home: Scaffold(
        appBar: AppBar(title: Text('justSing!'), actions: [
          GestureDetector(
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed('/profile'),
              child: Icon(Icons.person),
            ),
          )
        ]),
        body: Center(
          child: 
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    shape: CircleBorder(),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      splashColor: Colors.purple[800],
                      onTap: () {},
                      child: Image.asset("assets/" + iconSearch, scale: 3),
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    // ignore: prefer_const_constructors
                    child: Text(
                      'Pesquisar música',
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 50,),
                ],
                ),
        ),
      ),
    );
  }
}
