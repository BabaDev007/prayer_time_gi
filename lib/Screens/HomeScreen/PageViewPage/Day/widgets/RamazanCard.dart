import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import '../../../../../Constants.dart';
import 'package:share_plus/share_plus.dart';
import 'package:get/get.dart';

import '../../../../../PageTransition/PageTransition.dart';
import '../../../../../StateManagement/StateManagement.dart';
import '../../../../MenuPages/DiniBilgiler/Dini1.dart';
import '../../../../MenuPages/DiniBilgiler/DiniBilgiler.dart';


class RamadanCard extends StatefulWidget {

  @override
  State<RamadanCard> createState() => _RamadanCardState();
}

class _RamadanCardState extends State<RamadanCard> {
  Controller c = Get.put(Controller());
  String? ramadanDay;
  String ramadanText = "İbadətlərinizi tərk etməyiniz! Çünki, Cənnətə gedəcək olanlara, Cənnətə aparacaq işlər gördürülər. Hədîs-i şərîf";
  @override
  void initState() {

    if(c.globalHicriTime.toString().contains("1 ")){
      ramadanDay = "Ramazan ayının 1-ci günü";
      ramadanText = """"Şübhəsiz Allahü təâlâ, Ramazan orucunu fərz qıldı. Mən də sizə Təravihi sünnə qıldım. Hədîs-i şərîf" 
  
“Ramazan ayı mübarək bir aydır. Allahu təala sizə Ramazan orucunu fərz etdi. O ayda rəhmət qapıları açılar, Cəhənnəm qapıları bağlanar, şeytanlar bağlanar. O ayda bir gecə vardır ki, min aydan daha qiymətlidir. O gecənin [Qədr gecəsinin] xeyirindən məhrum qalan hər xeyirdən məhrum qalmış sayılar”. [Nəsai]
      
      """"";
    }else if(c.globalHicriTime.toString().contains("2 ")){
      ramadanDay = "Ramazan ayının 2-ci günü";
      ramadanText = """"Bir Müsəlmana faydalı ola bilmirsənsə zərərli olma! Sevindirə bilmirsənsə heç olmasa incitmə! Yahyâ bin Muâz-ı Râzî “Rəhmətullahi aleyh”
     
“Ramazan ayında oruc tutmağı fərz bilib, savabını da Allahu təaladan gözləyərək oruc tutanın günahları bağışlanar”. [Buxari]      
      
      """;

    }else if(c.globalHicriTime.toString().contains("3 ")){
      ramadanDay = "Ramazan ayının 3-cü günü";
      ramadanText = """"Ramazânda bir orucluya iftar verənin, günahları avf olar. Cəhennəmdən azad olar. Hədîs-i şərîf
      
“Ramazan orucunu tutub ölən adam Cənnətə girər”. [Deyləmi]
   """"";

    }else if(c.globalHicriTime.toString().contains("4 ")){
      ramadanDay = "Ramazan ayının 4-cü günü";
      ramadanText = """"Bu dünya işləmək yeridir. Qarşılıq alınacak yer, axirətdir. İmâm-ı Rabbânî “Rəhmetullahi aleyh”
      
“Ramazan ayı gəlincə "Ey xeyir əhli xeyirə qaç! Şər əhli sən də pisliklərdən əl çək" deyilir”. [Nəsai]
      """"";

    }else if(c.globalHicriTime.toString().contains("5 ")){
      ramadanDay = "Ramazan ayının 5-ci günü";
      ramadanText = """"Bir insanın övlâdı ibadət etdiyində, qazandığı səvab qədər, atasına da verilər. Hədîs-i şərîf
      
“Ramazan bərəkət ayıdır. Allahu təala bu ayda günahları bağışlayar, duaları qəbul edər. Bu ayın haqqını güdün! Ancaq Cəhənnəmə gedəcək olan bu ayda rəhmətdən məhrum qalar”. [Təbərani]
      """"";

    }else if(c.globalHicriTime.toString().contains("6 ")){
      ramadanDay = "Ramazan ayının 6-cı günü";
      ramadanText = """"Şərif Ramazanda oruc tutmaq çox savabdır. Üzrsüz oruc tutmamaq böyük günahdır. Hədisi-şərifdə “Üzrsüz Ramazanda bir gün oruc tutmayan bunun yerinə bütün il boyu oruc tutsa, Ramazandakı o bir günkü savaba qovuşa bilməz” buyuruldu. [Tirmizi]
“Amma dini bir üzür varsa, oruc tutmamaq günah olmaz”.
      
“Şərif Ramazan ayı gəldiyi zaman Allahu təala mələklərə möminlərə istigfar etmələrini əmr edər”. [Deyləmi]
      """"";

    }else if(c.globalHicriTime.toString().contains("7 ")){
      ramadanDay = "Ramazan ayının 7-ci günü";
      ramadanText = "“Fərz namaz sonrakı namaza qədər; Cümə sonrakı Cüməyə qədər; Ramazan ayı sonrakı Ramazana qədər olan günahlara kəffarə olar”. [Təbərani]";

    }else if(c.globalHicriTime.toString().contains("8 ")){
      ramadanDay = "Ramazan ayının 8-ci günü";
      ramadanText = """"Hər günün gecəsi vardır. Arxasından gecə gəlməyəcək gün, qiyâmet günüdür. Abdullah-ı Ənsârî “Rəhmətullahi aleyh”
      
“Arxa-arxaya üç gün oruc tuta bilən Ramazan orucunu tutmalıdır”. [Əbu Nuaym]
      """"";

    }else if(c.globalHicriTime.toString().contains("9 ")){
      ramadanDay = "Ramazan ayının 9-cu günü";
      ramadanText = "“Ramazan orucu fərz, təravih sünnədir. Bu ayda oruc tutub gecələrini də ibadətlə keçirənin günahları bağışlanar”. [Nəsai]";

    }else if(c.globalHicriTime.toString().contains("10 ")){
      ramadanDay = "Ramazan ayının 10-cu günü";
      ramadanText = """"
Elmi olmayan bir bədən, suyu olmayan şəhərə bənzəyər. Şəms-i Təbrizî “Rəhmətullahi aleyh”
  

“Bu aya Ramazan deyilməsinin səbəbi günahları yandırıb əritdiyi üçündür”. [i. Mənsur]  """"";

    }else if(c.globalHicriTime.toString().contains("11 ")){
      ramadanDay = "Ramazan ayının 11-ci günü";
      ramadanText = "Ramazân ayında verilən bir sədəqə, başqa aylarda verilən min sədəqədən daha xeyirlidir. Hədîs-i şərîf";

    }else if(c.globalHicriTime.toString().contains("12 ")){
      ramadanDay = "Ramazan ayının 12-ci günü";
      ramadanText = "“Ramazan ayında ailənizin nəfəqəsini bol edin! Bu ayda çəkilən xərclər Allah yolunda çəkilən xərclər kimi savabdır”. [İbni Əbiddünya]";

    }else if(c.globalHicriTime.toString().contains("13 ")){
      ramadanDay = "Ramazan ayının 13-cü günü";
      ramadanText = "“Ramazanın əvvəli rəhmət, ortası bağışlama, sonu isə Cəhənnəmdən qurtuluşdur”. [i. Əbiddünya]";

    }else if(c.globalHicriTime.toString().contains("14 ")){
      ramadanDay = "Ramazan ayının 14-cü günü";
      ramadanText = "“İslam kəlmeyi-şəhadət gətirmək, namaz qılmaq, zəkat vermək, Ramazan orucunu tutmaq və həcc etməkdir”. [Müslim]";

    }else if(c.globalHicriTime.toString().contains("15 ")){
      ramadanDay = "Ramazan ayının 15-ci günü";
      ramadanText = "“Cənnətdəki gözəl köşklər sözü xoş, salamı çox, yemək yedirən, oruca davam edən və gecə namazı qılan kəslərə verilər”. [İbni Nəsr]";

    }else if(c.globalHicriTime.toString().contains("16 ")){
      ramadanDay = "Ramazan ayının 16-cı günü";
      ramadanText = "“Oruc tutan möminin susması təsbih, yuxusu ibadət, duası müstəcəb və əməlinin savabı da çoxdur”. [Deyləmi]";

    }else if(c.globalHicriTime.toString().contains("17 ")){
      ramadanDay = "Ramazan ayının 17-ci günü";
      ramadanText = """“Xüsusilə oruclu ikən çirkin, pis söz söyləməyin! Biri sizə sataşsa, ona "Mən orucluyam" deyin!” [Buxari]""";

    }else if(c.globalHicriTime.toString().contains("18 ")){
      ramadanDay = "Ramazan ayının 18-ci günü";
      ramadanText = "“Gerçək oruc yalnız yeyib-içməyi deyil, boş və həyasızca sözləri də tərk edərək tutulan orucdur”. [Hakim]";

    }else if(c.globalHicriTime.toString().contains("19 ")){
      ramadanDay = "Ramazan ayının 19-cu günü";
      ramadanText = "“Allahu təalanın gözlərin görmədiyi, qulaqların eşitmədiyi və heç kimin xəyalina belə gəlməyən nemət dolu süfrəsinə ancaq oruclular oturar”. [Təbərani]";

    }else if(c.globalHicriTime.toString().contains("20 ")){
      ramadanDay = "Ramazan ayının 20-ci günü";
      ramadanText = "“Allah yolunda bir gün oruc tutanı Allahu təala yetmiş illik məsafə qədər Cəhənnəmdən uzaqlaşdırar”. [Buxari]";

    }else if(c.globalHicriTime.toString().contains("21 ")){
      ramadanDay = "Ramazan ayının 21-ci günü";
      ramadanText = "“Təmizlik imanın yarısı, oruc da səbrin yarısıdır”. [Müslim]";

    }else if(c.globalHicriTime.toString().contains("22 ")){
      ramadanDay = "Ramazan ayının 22-ci günü";
      ramadanText = "“Oruclu ikən ölənə qiyamətə qədər oruc tutmuş kimi savab yazılar”. [Deyləmi]";

    }else if(c.globalHicriTime.toString().contains("23 ")){
      ramadanDay = "Ramazan ayının 23-cü günü";
      ramadanText = "Oruclu ikən ölən Cənnətə girər";

    }else if(c.globalHicriTime.toString().contains("24 ")){
      ramadanDay = "Ramazan ayının 24-cü günü";
      ramadanText = "“Oruc tutan, namaz qılan kimsə mükafatını qiyamətdə ağlı qədər alar”. [Xatib]";

    }else if(c.globalHicriTime.toString().contains("25 ")){
      ramadanDay = "Ramazan ayının 25-ci günü";
      ramadanText = "“Oruc şəhvəti kəsər”. [İ. Əhməd]";

    }else if(c.globalHicriTime.toString().contains("26 ")){
      ramadanDay = "Ramazan ayının 26-cı günü";
      ramadanText = "Hər geceni Qadir, hər gördüğünü Xızır bil! Süleyman Ata “Rəhmətullahi aleyh”,"
          "Qədir gecəniz mübarək olsun!";

    }else if(c.globalHicriTime.toString().contains("27 ")){
      ramadanDay = "Ramazan ayının 27-ci günü";
      ramadanText = "Qurani-kərim Ramazanda endi. Qədr gecəsi bu aydadır. Şərif Ramazanda iftarı erkən açmaq, sahuru gecikdirmək sünnədir. Rəsulullah bu iki sünnəyə çox əhəmiyyət verərdi.";

    }else if(c.globalHicriTime.toString().contains("28 ")){
      ramadanDay = "Ramazan ayının 28-ci günü";
      ramadanText = "İftarda tələsmək və sahuru gecikdirmək bəlkə insanın acizliyini, yeyib-içməyə və dolayısi ilə hər şeyə möhtac olduğunu göstərmək üçündür. İbadət etmək onsuz da bu deməkdir.";

    }else if(c.globalHicriTime.toString().contains("29 ")){
      ramadanDay = "Ramazan ayının 29-cu günü";
      ramadanText = "Bu ayda hər gecə Cəhənnəmə girməsi lazım olan minlərlə müsəlman bağışlanar, azad olar. Bu ayda Cənnət qapıları açılar. Cəhənnəm qapıları bağlanar. Şeytanlar zəncirlərə bağlanar. Rəhmət qapıları açılar. Allahu təala bu mübarək ayda Onun şanına yaraşacaq qulluq etməyi və Rəbbimizin razı olduğu, bəyəndiyi yolda olmağı hamımıza nəsib etsin! Amin. “Məktubat 1.c. 45.m”.";

    }else if(c.globalHicriTime.toString().contains("30 ")){
      ramadanDay = "Ramazan ayının 30-cu günü";
      ramadanText = "Sabah Ramazan bayramının 1-ci günüdür";

    }else if(c.globalHicriTime.toString().contains("1  ŞEVVÂL")){
      ramadanDay = "Ramazan bayramınız mübarək";
      ramadanText = "Bügün Ramazan bayramının 1-ci günüdür";

    }
    else if(c.globalHicriTime.toString().contains("2  ŞEVVÂL")){
      ramadanDay = "Ramazan bayramınız mübarək";
      ramadanText = "Bügün Ramazan bayramının 2-ci günüdür";

    }
    else if(c.globalHicriTime.toString().contains("3  ŞEVVÂL")){
      ramadanDay = "Ramazan bayramınız mübarək";
      ramadanText = "Bügün Ramazan bayramının 3-cü günüdür";

    }
    else if(c.globalHicriTime.toString().contains("4  ŞEVVÂL")){
      ramadanDay = "Ramazan bayramınız mübarək";
      ramadanText = "Bügün Ramazan bayramının 4-cü günüdür";

    }else{
      ramadanText = "";

      ramadanDay = "son";
    }



    // TODO: implement initState
    super.initState();
  }

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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/jummah.png", width: 25,),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${ramadanDay}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Constants.primaryColor),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                ramadanText,style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(.8),
              ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: (){
                        Navigator.push(context, SizeTransition2(DiniBilgilerPage1(Uri.parse("https://www.gozelislam.com/oruc-ve-ramazan/"), "Ramazan ayı və oruc bilgiləri")));

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("assets/dinibilgiler.png", color: Constants.primaryColor, width: 20,),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Ramazan ayı və oruc bilgiləri",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Constants.primaryColor.withOpacity(.5)),
                          )
                        ],
                      )),                  TextButton(
                      onPressed: () async {
                        await Share.share(
                            "$ramadanDay"
                            "\n$ramadanText"
                                "\n https://play.google.com/store/apps/details?id=com.turkiyetakvimi&gl=US");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.share,
                            color: Constants.primaryColor,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Paylaş",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Constants.primaryColor.withOpacity(.5)),
                          )
                        ],
                      )),
                ],
              )


            ],
          ),
        ),
      ),
    );
  }
}


