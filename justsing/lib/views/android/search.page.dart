import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

String iconProfile = "iconProfile.png";
String iconSearch = "iconSearch.png";

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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

    print("PERMISSÃO:");
    print(_speechToText.hasPermission);
  }

  void _startListening() async {
    await _speechToText.listen(onResult: (SpeechRecognitionResult result) {
      print("PALAVRAS FALADAS: ");
      print(result.recognizedWords);
      setState(() {
        _lastWords += result.recognizedWords;
      });
    });
  }

  void changeListeningState() {
    setState(() {
      _isListening = !_isListening;

      if (!_speechEnabled) _initSpeech();

      _isListening ? _startListening() : _stopListening();
      print("MICROFONE LIGADO");
      print(_speechToText.isListening);
      print(_isListening);
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
          GestureDetector(
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed('/profile'),
              child: Icon(Icons.person),
            ),
          ),
        ]),
        body: Text("$_lastWords"),
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
