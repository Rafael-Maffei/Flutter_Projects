import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

String iconProfile = "iconProfile.png";
String iconSearch = "iconSearch.png";

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  stt.SpeechToText? _speech;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

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
          ),
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Center(
          child: AvatarGlow(
            animate: _isListening,
            glowColor: Colors.amber,
            endRadius: 75.0,
            duration: const Duration(milliseconds: 2000),
            repeatPauseDuration: const Duration(milliseconds: 100),
            repeat: true,
            child: FloatingActionButton(
              onPressed: (() {}), //_listen,
              child: Icon(_isListening ? Icons.mic : Icons.mic_none),
            ),
          ),
        ),
        // body: Center(
        //   child:
        //     Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Material(
        //             shape: CircleBorder(),
        //             clipBehavior: Clip.antiAliasWithSaveLayer,
        //             child: InkWell(
        //               splashColor: Colors.purple[800],
        //               onTap: () {},
        //               child: Image.asset("assets/" + iconSearch, scale: 3),
        //             ),
        //           ),
        //           // ignore: prefer_const_constructors
        //           Padding(
        //             padding: const EdgeInsets.only(top: 25),
        //             // ignore: prefer_const_constructors
        //             child: Text(
        //               'Pesquisar música',
        //               // ignore: prefer_const_constructors
        //               style: TextStyle(
        //                   color: Colors.orange,
        //                   fontSize: 20,
        //                   fontWeight: FontWeight.bold),
        //             ),
        //           ),
        //           SizedBox(height: 50,),
        //         ],
        //         ),
        // ),
      ),
    );
  }

  // void _listen() async {
  //   if (!_isListening) {
  //     bool available = await _speech.initialize(
  //       onStatus: (val) => print('onStatus: $val'),
  //       onError: (val) => print('onError: $val'),
  //     );
  //     if (available) {
  //       setState(() => _isListening = true);
  //       _speech.listen(
  //           onResult: (val) => setState(() {
  //                 _text = val.recognizedWords;
  //               }));
  //     } else {
  //       setState(() => _isListening = false);
  //       _speech.stop();
  //     }
  //   }
  // }
}
