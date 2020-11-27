import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:dictionary/model/DefinitionM.dart';
import 'package:dictionary/ui/widget/lexicalentry/entry/sense/detail_array.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PronounciationWidget extends StatelessWidget {
  Pronunciation pronunciation;

  PronounciationWidget(this.pronunciation);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: [
        // DetailArray(pronunciation.dialects),
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
         child: Wrap(
           crossAxisAlignment: WrapCrossAlignment.center,
           children: [
             Text(pronunciation.phoneticNotation),
             Text(" : "),
             Text(pronunciation.phoneticSpelling,style: TextStyle(fontFamily: ""),),
             pronunciation.audioFile!=null? InkWell(
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 8),
                   child: Icon(
                     CupertinoIcons.speaker_2,
                     size: 20,
                     color: Colors.blue,
                   ),
                 ),
                 onTap: () async {
                   final assetsAudioPlayer = AssetsAudioPlayer();
                   try {
                     await assetsAudioPlayer.open(
                       Audio.network(pronunciation.audioFile),
                     );
                   } catch (t) {
                     //mp3 unreachable
                   }
                 }):Container(),
           ],
         ),
       ),

      ],
    );
  }
}
