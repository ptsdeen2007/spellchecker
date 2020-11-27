

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
    return IconButton(icon: Icon(_isListening ? Icons.mic : Icons.mic_none), onPressed: _listen);
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            widget.onTextChange(val.recognizedWords);
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }
}