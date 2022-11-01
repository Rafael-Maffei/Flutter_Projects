// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:justsing/views/android/login.page.dart';
import 'package:justsing/views/android/profile.page.dart';
import 'package:justsing/views/android/registry.page.dart';
import 'package:justsing/views/android/search.page.dart';

class AndroidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SearchPage(),
        routes: {
          '/search': (context) => SearchPage(),
          '/profile': (context) => ProfilePage(),
          '/login': (context) => LoginPage(),
          '/registry': (context) => RegistryPage(),
        });
  }
}
