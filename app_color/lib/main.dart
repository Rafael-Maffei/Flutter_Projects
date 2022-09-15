// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KindaCode.com',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _title = 'Default Title';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        // the TextField widget lets the user enter text in
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: TextField(
              onChanged: (enteredValue) {
                setState(() {
                  _title = enteredValue;
                });
              },
              decoration: const InputDecoration(
                  hintText: 'Enter something...', border: OutlineInputBorder()),
            ),
          ),
        ));
  }
}
