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
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText!.initialize();

    print("ENTROU AQUI BROW");
    /* setState(() async {
      _speechEnabled = await _speechToText.initialize();
    }); */
  }

  void _startListening() async {
    await _speechToText.listen(onResult: (SpeechRecognitionResult result) {
      print(result);
    });
  }

  void changeListeningState() {
    setState(() {
      _isListening = !_isListening;
    });

    _isListening ? _stopListening() : _startListening();
  }

  void _stopListening() async {
    await _speechToText.stop();
    changeListeningState();
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
            showTwoGlows: true,
            glowColor: Colors.amber,
            endRadius: 100,
            duration: const Duration(milliseconds: 2000),
            repeatPauseDuration: const Duration(milliseconds: 100),
            repeat: true,
            child: GestureDetector(
              onTap: () {
                changeListeningState();
              },
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.all(Radius.circular(360)),
                ),
                child: Icon(
                  _isListening ? Icons.mic : Icons.mic_none,
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
