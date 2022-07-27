import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

import '../../../Constants.dart';
class DiniBilgiler extends StatefulWidget {

  @override
  State<DiniBilgiler> createState() => _DiniBilgilerState();
}
var _url = Uri.parse("http://www.gozelislam.com");
class _DiniBilgilerState extends State<DiniBilgiler> {
  var _metin;

  var _bashliq;
  // _bashliq =  element.children[0].text.toString();
  // _bashliq =  element.children[1].text.toString();   movzu adi
  // _bashliq =  element.children[2].text.toString();
  // _bashliq =  element.children[0].children[0].children[0].children[0].attributes["href"].toString();  link



  Future<void>getData()async{
    var response = await http.get(_url);
    final body = response.body;
    final document = parser.parse(body);
    var res = document.getElementsByClassName("card2").forEach((element)async {
      setState((){
        _bashliq =  element.children[0].children[0].children[4].children[0].attributes["href"].toString();

         print(_bashliq);




      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      appBar: AppBar(
        title: Text("Dini Bilgilər", style: TextStyle(fontFamily: "Oswald"),),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {
          getData();
        }, child: Text(""),

        ),
      ),
    );
  }
}
