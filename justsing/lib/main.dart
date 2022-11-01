import 'package:flutter/material.dart';
import 'package:justsing/views/android/android.app.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(AndroidApp());
}

class JustSing extends StatelessWidget {
  const JustSing({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'justSing!',
      theme: ThemeData(primarySwatch: Colors.orange,),
    );
  }
}
