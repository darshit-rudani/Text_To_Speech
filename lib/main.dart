import 'package:flutter/material.dart';
import 'package:flutter_text_to_speech/flutter_text_to_speech.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  VoiceController controller = FlutterTextToSpeech.instance.voiceController();
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Text To Speech',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30.0),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
                controller: textController,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                    width: 3,
                    color: Color(0xff6809e0),
                  ),
                ),
                onPressed: () {
                  controller.speak(
                    "${textController.text}",
                  );
                  textController.clear();
                },
                child: Center(
                  child: Text(
                    'Tap For Speak',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                padding: EdgeInsets.all(8.0),
                color: Color(0xff6809e0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
