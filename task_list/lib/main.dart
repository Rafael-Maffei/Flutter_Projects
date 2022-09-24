import 'package:flutter/material.dart';
import 'dart:io';
import 'package:task_list/views/ios/ios.app.dart';
import 'views/android/android.app.dart';

void main() {
  runApp(Platform.isIOS ? IosApp() : AndroidApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'task_list',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}
