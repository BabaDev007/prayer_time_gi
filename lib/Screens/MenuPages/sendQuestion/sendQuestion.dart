import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:prayer_time_gi/Constants.dart';
import 'package:get/get.dart';

import '../../HomeScreen/PageViewPage/PageViewPage.dart';

class SendEmail extends StatefulWidget {
  @override
  _SendEmailState createState() => _SendEmailState();
}

class _SendEmailState extends State<SendEmail> {
  List<String>? attachment;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    attachment= <String>[];
  }
  final _nameController = TextEditingController(
  
  );
  final _emailController = TextEditingController(

  );

  final _subjectController = TextEditingController();

  final _bodyController = TextEditingController(
    
  );

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> send() async {
    final Email email = Email(
      body: "\n \n Email adresi: ${_emailController.text} \n \n Ad: ${_nameController.text} \n \n" + _bodyController.text ,
      subject: _subjectController.text,
      recipients: ['gozelislam@hotmail.com'],
      attachmentPaths: attachment,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }
    if (!mounted) return;
    Get.snackbar("www.namazvaxti.org", "Sualınız uğurla göndərildi", colorText: Colors.white);




  }

  @override
  Widget build(BuildContext context) {
    final Widget imagePath = Text(attachment!.length>0 ? attachment![0]: '');

    return  Scaffold(
      backgroundColor: Constants.primaryColor,
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(onPressed: () {      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return PageViewPage(); }));
          }, icon: Icon(Icons.chevron_left, size: 30,),),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text('Dini Sual Göndər', style: TextStyle(fontFamily: "Oswald"),),
          actions: <Widget>[
            IconButton(
              onPressed: send,
              icon: Icon(Icons.send),
            )
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Constants.primaryColor),
                        hintText: "Adınız",
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),

                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Constants.primaryColor),
                        hintText: "E-Poçt(mail) adresi",
                        fillColor: Colors.white,
                        filled: true,
                        errorText: "* E-mail adresinizi qeyd etmək mütləqdir",
                        border: OutlineInputBorder(),

                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _subjectController,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Constants.primaryColor),
                        fillColor: Colors.white,
                        hintText: "Mövzu adı",
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _bodyController,
                      
                      decoration: InputDecoration(
                          hintText: "Sualınız",
                          fillColor: Colors.white,
                          filled: true,
                          hintStyle: TextStyle(color: Constants.primaryColor),
                           border: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("* Dini sual soruşarkən aşağıdakı qaydalara riayət etməyiniz rica olunur:\n \n"
                        "1.Sual göndərməmişdən əvvəl o mövzu ilə bağlı məlumatı saytdan oxumaq (www.gozelislam.com).\n \n"
                        "2.Dolğun cavab almaq üçün sualı geniş şəkildə yazmaq.\n \n"
                    "3.Namaz vaxtı ilə bağlı sualların cavablarını www.namazvakti.com www.namazvaxti.org saytından və ya bilgi@namazvakti.com elektron ünvana e-mail göndərməklə əldə edə bilərsiniz.\n \n"
                        "4.Sualınıza cavab almaq üçün e-mail-ı DÜZGÜN qeyd etmək.", style: TextStyle(color: Colors.white, fontSize: 13),),
                  ),
                ],
              ),
            ),
          ),
        ),


    );
  }


  }
