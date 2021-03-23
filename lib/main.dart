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
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
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
              padding: const EdgeInsets.only(left: 50.0, right: 50.0),
              child: ElevatedButton(
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
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
