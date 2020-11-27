import 'package:flutter/material.dart';
import 'package:numerus/numerus.dart';
class DetailArray extends StatelessWidget {
  List<String> dataList;
  TextStyle textStyle;

  DetailArray(this.dataList,{this.textStyle});

  @override
  Widget build(BuildContext context) {
    return dataList!=null?ListView.builder(
      shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: dataList.length,
        itemBuilder: (context,position){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: RichText(
          // text: TextSpan(text: "${(position+1).toRomanNumeralString()} ",
          text: TextSpan(text:"",
          style: TextStyle(color: Colors.black),
          children: [
            TextSpan(text: dataList[position],style: textStyle,)
          ]
          ),
        ),
      );
    }):Container();
  }
}
