import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:prayer_time_gi/Constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jiffy/jiffy.dart';
import '../../HomeScreen/PageViewPage/PageViewPage.dart';

class SendEmail extends StatefulWidget {
  @override
  _SendEmailState createState() => _SendEmailState();
}

class _SendEmailState extends State<SendEmail> {
  GetStorage box = GetStorage();
  List<String>? attachment;
var isTrue = false;
var isSended = false;
  @override
  void initState() {
    isSended = box.read("${Jiffy().dateTime.month}" + "000" + "${Jiffy().dateTime.day}") ?? false;
    // TODO: implement initState
    super.initState();
    attachment= <String>[];
  }
  final _nameController = TextEditingController(
  
  );
  final _emailController = TextEditingController(

  );

  final _subjectController = TextEditingController();
  final _numberController = TextEditingController();

  final _bodyController = TextEditingController(
    
  );

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  Future sendEmail(
  {
  required String name,
  required String email,
    required String subject,
    required String message,
    required String number
  }
      )async{
    setState(() {
      isTrue = true;

    });
    final serviceId = 'service_ffloc2x';
    final templateId = 'template_byawngf';
    final userId = 'Cz3d9Z4CSm0dv4RhJ';
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    final response = await http.post(url, headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'service_id': serviceId, 'template_id': templateId, 'user_id': userId,
      'template_params': {'user_name': name, 'user_email': email, 'user_subject': subject, 'user_message': message, 'user_number': number
    }
    }), );
    setState(() {
      isTrue = false;
    });
    if(response.body == "OK"){
      setState(() {
        _bodyController.text = "";
        _emailController.text = "";
        _subjectController.text = "";
        _nameController.text = "";
        _numberController.text = "";
        box.write("${Jiffy().dateTime.month}" + "000" + "${Jiffy().dateTime.day}", true);

      });
      Get.snackbar("Namaz Vaxtı", "Sualınız uğurla göndərildi", colorText: Colors.white);
    }else{
      Get.snackbar("Namaz Vaxtı", "Xəta baş verdi", colorText: Colors.red);

    }

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
          title: Text('Sual Göndər', style: TextStyle(fontFamily: "Oswald"),),
          actions: <Widget>[

            IconButton(
              onPressed:()async{
                if(isSended == false){
                  if(_emailController.text.isEmail){
                    if(_emailController.text != "" && _numberController.text != ""  ){
                      await sendEmail(name: _nameController.text , subject: _subjectController.text, email: _emailController.text, message: _bodyController.text, number: _numberController.text);
                    } else{
                      Get.snackbar("Namaz Vaxtı", "E-mail və nömrəni daxil edin", colorText: Colors.white);
                    }
                  }else{
                    Get.snackbar("Namaz Vaxtı", "E-mail-i düzgün daxil edin", colorText: Colors.white);
                  }
                }else{
                  Get.snackbar("Namaz Vaxtı", "Bir gün ərzində yalnız bir sual göndərmək haqqınız var", colorText: Colors.white);
                }



    } ,
              icon: Icon(Icons.send),
            )
          ],
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
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
                            hintText: "E-mail adresi",
                            fillColor: Colors.white,
                            filled: true,
                            errorText: "* Bu xananı doldurmaq mütləqdir",
                            border: OutlineInputBorder(),

                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          controller: _numberController,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Constants.primaryColor),
                            hintText: "WhatsApp nömrəsi",
                            fillColor: Colors.white,
                            filled: true,
                            errorText: "* Bu xananı doldurmaq mütləqdir",
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
                          maxLines: 10,
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
                        child: Text("* Dini sual soruşarkən sizdən aşağıdakı qaydalara riayət etməyiniz xahiş olunur:\n \n"
                            "1.Sual göndərməmişdən əvvəl o mövzu ilə bağlı məlumatı saytdan oxumaq (www.gozelislam.com).\n \n"
                            "2.Dolğun cavab almaq üçün sualı geniş şəkildə yazmaq.\n \n"
                        "3.Namaz vaxtı ilə bağlı sualların cavablarını www.namazvakti.com, www.namazvaxti.org saytından və ya bilgi@namazvakti.com elektron ünvana e-mail göndərməklə əldə edə bilərsiniz.\n \n"
                            "4.Sualınıza cavab almaq üçün E-Mail və Whatsapp nömrənizi DÜZGÜN qeyd etmək.\n \n"
                            "5. E-mail və nömrəniz sualınızın cavabını göndərməyimiz üçün lazımdır"


                          , style: TextStyle(color: Colors.white, fontSize: 13),),
                      ),
                    ],
                  ),
                ),
              ),
            ),
           isTrue ? Center(child: Container(
             height: Get.height,
               width: Get.width,
               color: Colors.black26,
               child: Center(child: CircularProgressIndicator( color: Colors.white,))),) : SizedBox()
          ],
        ),


    );
  }


  }
