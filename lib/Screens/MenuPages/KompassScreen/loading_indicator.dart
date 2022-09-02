import 'package:lottie/lottie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Container(
      alignment: Alignment.center,
      child:  Lottie.asset("assets/loding.json", height: 80),
    );
  }
}