// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:justsing/views/android/result.page.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _firebaseAuth = FirebaseAuth.instance;
  bool _isListening = false;
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
  }

  void _startListening() async {
    await _speechToText.listen(onResult: (SpeechRecognitionResult result) {
      _lastWords = '';

      setState(() {
        _lastWords = result.recognizedWords;
      });
    });
  }

  void changeListeningState() {
    setState(() {
      _isListening = !_isListening;

      if (!_speechEnabled) _initSpeech();

      _isListening ? _startListening() : _stopListening();
    });
  }

  void _stopListening() async {
    await _speechToText.stop();
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
          _firebaseAuth.currentUser == null
              ? GestureDetector(
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pushNamed('/login'),
                    child: Text("Login"),
                  ),
                )
              : GestureDetector(
                  child: ElevatedButton(
                    onPressed: () async {
                      var result =
                          await Navigator.of(context).pushNamed('/profile');
                      setState(() {});
                    },
                    child: Icon(Icons.person),
                  ),
                )
        ]),
        body: Column(
          children: [
            Text(
              "$_lastWords",
              style: TextStyle(color: Colors.amber, fontSize: 30),
            ),
            Flexible(
              child: FloatingActionButton(
                  backgroundColor: Colors.orange,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewApp(
                                lastWords: _lastWords,
                              ))),
                  child: Text('Buscar')),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Center(
          child: AvatarGlow(
            animate: _isListening,
            showTwoGlows: true,
            glowColor: Colors.amber,
            endRadius: 100,
            duration: const Duration(milliseconds: 2000),
            repeatPauseDuration: const Duration(milliseconds: 100),
            repeat: true,
            child: GestureDetector(
              onTap: () => changeListeningState(),
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.all(Radius.circular(360)),
                ),
                child: Icon(
                  _isListening ? Icons.mic_none_sharp : Icons.mic_sharp,
                  size: 100,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
