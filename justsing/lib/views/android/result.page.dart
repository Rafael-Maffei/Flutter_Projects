import 'package:flutter/material.dart';
import 'package:justsing/views/android/display.page.dart';
import 'package:youtube_api/youtube_api.dart';
import 'package:justsing/views/android/search.page.dart';

void main() => runApp(ResultPage());

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ViewApp(),
    );
  }
}

class ViewApp extends StatefulWidget {
  String? lastWords;

  ViewApp({this.lastWords});

  @override
  _ViewAppState createState() => _ViewAppState();
}

class _ViewAppState extends State<ViewApp> {
  static String key = "AIzaSyA1VVcrda8uStrYEO0ItCT35p7kyUQubQU";

  YoutubeAPI youtube = YoutubeAPI(key);
  List<YouTubeVideo> videoResult = [];

  Future<void> callAPI() async {
    String query = 'music' + widget.lastWords.toString();
    videoResult = await youtube.search(
      query,
      order: 'relevance',
      videoDuration: 'any',
    );
    videoResult = await youtube.nextPage();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    callAPI();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.orange,
            scaffoldBackgroundColor: Colors.grey[900]),
        home: Scaffold(
          appBar: AppBar(title: Text('Resultados encontrados'), actions: [
            GestureDetector(
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop('/search'),
                child: Icon(Icons.home),
              ),
            )
          ]),
          body: ListView(
            children: videoResult.map<Widget>(listItem).toList(),
          ),
        ));
  }

  Widget listItem(YouTubeVideo video) {
    return Card(
      color: Colors.grey[850],
      child: GestureDetector(
        onTap: () {
          String _link = video.url;
          print(_link);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PlayerPage(
                        link: _link,
                      )));
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 7.0),
          padding: EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Image.network(
                  video.thumbnail.small.url ?? '',
                  width: 120.0,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      video.title,
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 3.0),
                      child: Text(
                        video.channelTitle,
                        softWrap: true,
                        style: TextStyle(
                            fontWeight: FontWeight.w900, color: Colors.orange),
                      ),
                    ),
                    // Text(
                    //   video.url,
                    //   softWrap: true,
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
