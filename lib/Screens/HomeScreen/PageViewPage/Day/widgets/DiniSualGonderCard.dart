import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../Constants.dart';

class SualGonder extends StatefulWidget {

  @override
  State<SualGonder> createState() => _SualGonderState();
}

class _SualGonderState extends State<SualGonder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.question_answer, color: Colors.blue,),
                  SizedBox(width: 10,),
                  Expanded(child: Text("Sual Cavab Formu", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "GentiumBookPlus", color: Constants.primaryColor ),)),
                ],
              ),
              SizedBox(height: 20,),
          Text.rich(
              textAlign: TextAlign.justify ,

              TextSpan(
                  text: 'Tətbqimizdə olan bütün dini mövzularla bağlı olan məlumatları ',
                  style: TextStyle( fontFamily: "GentiumBookPlus",  ),
                  children: [
                    TextSpan(
                      text: 'www.gozelislam.com',
                      style: TextStyle( color: Colors.blue,),
                    ),
                    TextSpan(
                      text: " saytının axtar bölümündən tapa bilərsiniz. Tapa bilmədiyiniz sualların cavablarını aşağıdakı düyməyə basmaqla açılan pəncərədə qrafaları doldurmaqla əldə edə bilərsiniz və ya sualınızı birbaşa olaraq "
                    ),
                    TextSpan(
                      text: "gozelislam@hotmail.com",
                      style: TextStyle( color: Colors.blue,),
                    ),
                    TextSpan(
                      text: " elektron ünvanına göndərə bilərsiniz."
                    )
                  ]
              )
          ),




              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  TextButton(onPressed: () {  },
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.send_outlined, color: Constants.primaryColor,),
                          SizedBox( width: 20,),
                          Text("Göndər", style: TextStyle(fontWeight: FontWeight.bold, color: Constants.primaryColor.withOpacity(.5)),)

                        ],
                      )),


                ],
              )





            ],
          ),
        ),
      ),
    );;
  }
}
