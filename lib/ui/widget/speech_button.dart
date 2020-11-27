import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechButton extends StatefulWidget {
  ValueChanged onTextChange;

  SpeechButton({this.onTextChange});

  @override
  _SpeechButtonState createState() => _SpeechButtonState();
}

class _SpeechButtonState extends State<SpeechButton> {
  stt.SpeechToText _speech;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: _isListening
            ? Icon(Icons.mic, color: Colors.blue)
            : Icon(Icons.mic_none),
        onPressed: _listen);
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) {
          setState(() {
            _isListening = _speech.isListening;
          });
        },
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(onResult: (val) {
          //to get last word
          widget.onTextChange(val.recognizedWords.split(" ").last);

          //listening time
        },listenFor: Duration(seconds: 15));
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }
}
