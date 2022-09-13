import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../Constants.dart';
import '../../../PaddingManager.dart';
import '../../HomeScreen/PageViewPage/PageViewPage.dart';
import 'EsmailHusnaClass.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:get/get.dart';
class EsmaScreen extends StatefulWidget {

  @override
  State<EsmaScreen> createState() => _EsmaScreenState();
}

class _EsmaScreenState extends State<EsmaScreen> {
  late ScrollController _controller;

  var hadis = [
    "Əbu Hürəyrə (ra)-dan rəvayət edilən bir hədisdə Peyğambərimiz (salallahu aleyhi və səlləm) buyurdu "
        "ki: “Həqiqətən Allah'ın 99 adı vardır-yüzdən bir əskik- Kim onu sayarsa cənnətə girər.”",
  "“Allah, özündən başqa ilâh olmayandır. Ən gözel adlar O’na məxsusdur.” \n (Tâhâ, 20/8)",
  "“…Ən gözel adlar O’nundur. Göylərdə və yerdə olanlar O’nun şanını ucaltma1tadırlar. O qalibdir, hikmət sahibidir.” \n (Həşr, 52/24)"
  ];
@override
  void initState() {
  _controller = ScrollController();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      extendBodyBehindAppBar: true,
      appBar:
      PreferredSize(
        preferredSize: Size(
          double.infinity,
          56.0,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),

          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: AppBar(
              leading: IconButton(onPressed: () {      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return PageViewPage(); }));
              }, icon: Icon(Icons.chevron_left, size: 30,),),
              elevation: 0,

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))
              ),

              backgroundColor: Constants.primaryColor.withOpacity(.6),
              centerTitle: true,
              shadowColor: Colors.transparent,
              title: Text("Esma-i Hüsna", style: TextStyle(fontFamily: "Oswald", color: Colors.white.withOpacity(.8)),),
            ),
          ),
        ),
      ) ,

      body:
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Swiper(
                    autoplayDelay: 10000,
                    indicatorLayout: PageIndicatorLayout.WARM,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(20),
                            color: Constants.primaryColor
                          ),

                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Opacity(opacity: .3,
                              child: ClipRRect(borderRadius: BorderRadius.circular(20)  ,child: Image.asset("assets/zorka.webp", fit: BoxFit.fitWidth, width: double.infinity, ))),
                              Text(textAlign: TextAlign.center,
                               "${hadis[index]}", style: TextStyle(fontFamily: "GentiumBookPlus", fontSize: 15, color: Colors.white),),
                            ],
                          ),
                        ),
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: hadis.length,
                    autoplay: true,
                    itemHeight: 200,
                    itemWidth: 370,
                    pagination: new SwiperPagination(),
                    layout: SwiperLayout.STACK,
                  ),
                ),

                AnimationLimiter(
                  child: Scrollbar(
                    child: ListView.builder(

                      controller: _controller ,
                      shrinkWrap: true,
                      padding: EdgeInsets.all(_w / 30),
                      itemCount: Esma.esmaTileListe.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          delay: Duration(milliseconds: 80),
                          child: SlideAnimation(
                            duration: Duration(milliseconds: 1800),
                            curve: Curves.fastLinearToSlowEaseIn,
                            horizontalOffset: 30,
                            verticalOffset: 300.0,
                            child: FlipAnimation(
                                duration: Duration(milliseconds: 3000),
                                curve: Curves.fastLinearToSlowEaseIn,
                                flipAxis: FlipAxis.y,
                                child: Padding(
                                  padding: PaddingManager().prayerTimeWidgetPadding,

                                  child: Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).errorColor,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.blue.withOpacity(.2),
                                            blurRadius: 30,
                                            offset: Offset(20, 30),
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(20),
                                      ),


                                      child: ListTile(
                                        leading: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Constants.primaryColor, width: .1),
                                            color: Constants.primaryColor,
                                            shape: BoxShape.circle,
                                            gradient: LinearGradient(colors: [Colors.lightBlueAccent, Constants.primaryColor]

                                            )
                                          ),
                                            child: FittedBox(child: Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Text('${index + 1}', style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white,  fontSize: 17, fontFamily: "Oswald"),),
                                            ))),
                                        title: Text(Esma.esmaTileListe[index], style: TextStyle(fontFamily: "GentiumBookPlus" ),),
                                        subtitle: Text('${Esma.mena[index]}'),
                                        trailing: Text(Esma.arabItem[index]),

                                      ))

                            )
                          ),
                        ));
                      },

                    ),
                  ),
                ),
              ],
            ),
          ));








  }
}


class EsmaInfo extends StatelessWidget {
  const EsmaInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title:
        Text("Esma-i Hüsna",style: TextStyle(fontFamily: "Oswald")),
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Constants.primaryColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Scrollbar(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Esmâ-i hüsnânı söyləmənin faydaları", style: TextStyle(fontFamily: "Oswald", fontSize: 20)),
                  ),
                  Text("""
  Yûsuf Nebhânî hazretleri, Esmai hüsna’yı söylemenin faydalarını şöyle bildirir: 
Kalbin temizlenmesi için 
El-Âhiru ismi şerîfini söyliyenin gönlü temizlenir. Safâya kavuşur. Günde yüz defa söylenirse, Allahü teâlâdan başka her şeyin sevgisi kalbden çıkar. 
Manevi sırların açılması için
El-Alîm ismi şerîfini söylemeye devâm edene mânevî sırlar açılır, hikmet ve mârifete kavuşur. 
Hastanın şifa bulması için
Cumâ günü namazdan önce abdestli, elbisesi temiz ve kalbinden dünyâ düşüncelerini çıkarmış olarak iki yüz kerre “Yâ Allahü el-mahmûdü fî fiâlihi” derse, Allahü teâlâ onun hastalığına şifâ verir. 
Elem ve kederden kurtulmak için 
El-Azîm ismi şerîfini söyleyen, elem ve kederden kurtulur. 
Muhtaç olmamak için 
Bir kimse kırk gün günde kırk kerre el-Azîz ismi şerîfini söylerse Allahü teâlâ 
ona yardım eder ve onu üstün kılar. Mahlûkattan hiç birine muhtaç olmaz. 
İlim ve hikmet için 
Kim uyumadan önce elini göğsüne koyar ve yüz kerre el-Bâisü ismi şerîfini söylerse, Allahü teâlâ onun kalbini nurlandırır, ilim ve hikmet ile doldurur. 
Zarardan kurtulmak için 
El-Bâkî ismi şerîfini bin kerre söyleyen kimse, zarar ve kederden korunmuşolur. 
Belalardan selamet için Yedi gün arka arkaya yüz defâ el-Bârî ism-i şerîfine devam eden belâlardan selâmet bulur, kurtulur. Kalb gözünün açılması için Bir kimse Cumâ namazından sonra yüz kerre el-Basîr ism-i şerîfini söylerse, 
Allahü teâlâ onun kalb gözünü açar. 
Bol rızık için Bir kimse ellerini açıp, el-Bâsit ismi şerîfini söylese geçimi genişler. Bol rızka kavuşur. Musibetlerden kurtulmak için El-Bedî’ ismi şerîfini yetmiş bin kerre söyleyen kimse, kendisine gelecek olan musîbetten kurtulur. İşte başarı için 
El-Alî ism-i şerîfini söyleyen, işlerinde muvafak olup ilerler. 
Zalimlerden korunmak için Sabah ve akşam el-Cebbâr ismi şerîfini okumaya devâm eden kimse zâlimlerin zulmünden korunmuş olur. Yolculukta da olsa zarar görmez. 
Af ve magfirete kavuşmak için Cumâ namazından sonra yüz defâ el-Gaffâr ism-i şerîfini söyleyen, Allahü teâlânın af ve mağfiretine kavuşur. 
Ölümün kolay olması için El-Gafûr ism-i şerîfini söyleyenin son nefeste Kelime-i tevhîdi söylemesi ve ölümü kolay olur. 
Belalardan muhafaza için Hastalık veya bir musîbet geldiğinde el-Ganîyyü ism-i şerîfi okunduğunda, Allahü teâlâ âfiyet verir ve o belâdan muhâfaza eder. Zarardan korunmak için 
El-Hâfid ism-i şerîfini söyliyen zararlardan korunmuş olur. Yüzün nurlanması için Gece yarısı bir miktar zaman el-Hâlık ism-i şerîfini söyleyen kimsenin kalbi ve yüzü nûrlanır. 
Yolculuğun emin olması için 
El-Halîm ism-i şerîfini okuyan denizde ise boğulmaktan, bir vâsıtada ise helak olmaktan kurtulur. 
Takdir kazanmak için 
El-Hamîd ism-i şerîfini söyleyen, işinde, sözünde ve ahlâkında başkalarının övgüsünü kazanır. 
Şifa bulmak için Hastalanan kimse, el-Hayyü ism-i şerîfini bir tabağa yazar ve ona su koyar ve ondan üç gün içerse, Allahü teâlânın izniyle şifâ bulur. 
Sıkıntılardan kurtulmak için El-Kâbid ism-i şerîfini söyleyen, elem ve sıkıntılardan kurtulur. 
Dünya sevgisinden kurtulmak için El-Kahhâr ism-i şerîfini çok söylemekle kalbden dünyâ sevgisi çıkar. 
Bedenin kuvvetli olması için El-Kavî ism-i şerîfini söyleyenin cismine, bedenine kuvvet gelir. 
Hâfızanın kuvvetlenmesi için Hergün on altı defâ tenhâ bir yerde El-Kayyûm ismi şerîfi ahmağa okunursa, Allahü teâlânın izniyle abtallığı gider, hâfızası kuvvetlenir. 
İlim ve magfiret için El-Kebîr ism-i şerîfini söyliyene, ilim ve mârifet kapısı açılır. Dağınıklıktan kurtulmak için Her gün bin defâ el-Kuddûs ism-i şerîfini söyliyen kimsenin gönlü dağınıklıktan kurtulur. 
Huzur ve rahat için 
El-Latîf ism-i şerîfini söylemeye devâm edenin üzüntü ve elemi gider, rahat ve huzur bulur. 
Kalbin nurlanması için 
El-Mâcid ism-i şerîfini okuyanın kalbi nurlanır. 
Çok mal, mülk için:
Kim Mâlik-ül Mülk ism-i şerîfine devâm ederse, Allahü teâlâ ona çok mal ve mülk ihsân eder. Onu kimseye muhtaç etmez. 
Beladan korunmak için 
El-Mâni’ ism-i şerîfini söyleyen kimse, kendisine gelecek belâdan korunmuşolur. Üzüntüyü gidermek için Her gün öğle vakti kim el-Melik ism-i şerîfini yüz kere söylerse, kalbi temizlenir ve üzüntüsü gider. 
Kolay tevbe için 
El-Muahhir ism-i şerîfini söyleyenin tövbe etmesi kolay olur. İtaat altına almak için
Muhsî ism-i şerifini söyliyen kimse, Allahü teâlânın izniyle başkalarınıcezbeder, itâati altına alır. Korkulan kimse için El-Muhyî ismi şerîfini söyleyen kimsenin korktuğu kimselerle arasında ülfet meydana gelir. 
Heybetli görünmek için El-Muizz ismi şerîfini akşam namazından sonra veya cumâ gecesi kırk defâ söyliyen, başkalarına heybetli görünür. Zafer için Muhârebe ânında bir kimse el-Mukaddim ism-i şerîfini söylediğinde kuvvet ve zafer bulur. 
Vesveseden kurtulmak için El-Muksit ismi şerîfine devâm eden, ibâdette vesveseden kurtulur. Unutkanlık için Her kim gusül abdesti aldıktan veya namazdan sonra el-Müheymin ism-i şerîfini söylerse, kalbi aydınlanır, himmet ve şerefe kavuşur. Hâfızası kuvvetlenir, unutkanlığı gider. 
 
Nefsin itaati için 
El-Mümît ism-i şerîfini söyleyenin nefsi itâate gelir. 
Hâlin düzelmesi için 
El-Müte’âl ism-i şerîfini söyleyenin hâli düzelir, derecesi yükselir. 
Hayırlı rızk için 
El-Mütekebbir ism-i şerîfini söylemeye devâm eden kimse, hayırlı rızık ve bereketlere kavuşur. Allahü teâlâ bu ism-i şerîfi okuyanlara hayırlı evlâd nasîb eder. Zulümden emin olmak için El-Müzill ism-i şerîfini yetmiş beş kere söyliyen ve sonra duâ eden kimse, hased edenin hasedinden ve zâlimin zulmünden emin olur. 
Kalbin nurlanması için En-Nûr ism-i şerîfini söyleyenin kalbi nurlanır. Maddi-manevi ihtiyaç için Er-Râfi’ ism-i şerîfini söyleyen, zâlimlerin zulmünden emin olur. Beş yüz kere söyleyenin maddî mânevî ihtiyâcı giderilir. 
Kalbin merhameti için 
Her kim her gün yüz kere Rahîm ism-i şerîfini söylerse, kalbinde rikkat ve mahlûkâta karşı merhamet peydâ olur 
Gafletten kurtulmak için 
Her kim namazdan sonra yüz defâ Rahmân ism-i şerîfini söylerse, Allahü teâlâ onun kalbinden nisyan ve gafleti çıkarır. 
Öfkeden kurtulmak için 
Kızgınlık ânında kim on defâ er-Raûf ism-i şerîfini söyler ve Peygamber efendimize salevât-ı şerîfe okursa öfkesi geçer, sâkinleşir. 
Amellerin kabul olması için 
Er-Reşîd ism-i şerîfini söyleyenin yaptığı ameller kabûl olur. 
Rızık genişliği için
Sabah namazından sonra er-Rezzâk ism-i şerîfini söyleyenin rızkı genişler. Cumâ namazından sonra yüz defâ er-Rezzâk ism-i şerîfi söylendiğinde hastanın sıkıntısı geçer. 
Belalardan kurtulmak için 
Güneş doğduktan sonra yüz kere es-Sabûr ism-i şerîfini söyleyen kimse, belâlardan kurtulur. 
Şifa bulmak için 
Eceli gelmeyen bir hastaya elem ve hastalıkları için yüz yirmi bir defâ (esSelâm) ism-i şerîfi okunursa, Allahü teâlânın izniyle o kimse şifâ bulur veya hastalığı hafifler. 
Murada kavuşmak için 
Duhâ namazından sonra beş yüz kere Semî’ ism-i şerîfini okuyan kimsenin duâsı kabûl olur ve Allahü teâlânın izniyle murâdına kavuşur. 
 Çocuğun itaatkâr olması için 
Ana-baba, isyankâr evlâdının alnından tutar ve Allahü teâlânın eş-Şehîd ismi şerîfini okursa, o çocuk Allahü teâlânın izniyle itâatkâr olur. 
Sıhhat ve selamet için 
Eş-Şekûr ism-i şerîfini söyleyenin vücûduna âfiyet gelir, sıhhat ve selâmete kavuşur. Geçimi bollaşır. 
Zalimin zulmünden kurtulmak için 
Bir kimse duhâ namazından sonra üç yüz altmış defâ et-Tevvâb ism-i şerîfini 
söylerse tövbesi kabûl olur. On defâ bir zâlim üzerine söylendiğinde zâlimin zulmünden kurtulur. 
Kalbin kuvvetli olması için 
El-Vâcid ism-i şerîfini okuyanın kalbi kuvvet bulur. 
Afetlerden kurtuluş için 
El-Vâlî ism-i şerîfini söyleyen, yıldırım ve başka âfetlerden kurtulmuş olur. 
Fakir olmamak için 
El-Vâsi’ ism-i şerîfini söyleyen, fakirlik sıkıntısına düşmez. Hırs, gayz ve hasedden kurtulur. 
Karı-koca muhabbeti için 
El-Vedûd ism-i şerîfini söyliyen karı-kocanın birbirine karşı sevgi ve muhabbeti çoğalır. 
Muhtaç olmamak için 
El-Vehhâb ism-i şerîfini kim duhâ (kuşluk) namazından sonra söylerse, başkasına muhtaç olmaz. Kalblerde heybet hâsıl eder. 
Rızık kapısı açılması için 
Bir şeyden korkan el-Vekîl ism-i şerîfini söylerse, emniyet bulur. Kendisine hayır ve rızk kapıları açılır. 
Evliyalık nuru için 
İşrak vaktinde ez-Zâhir ism-i şerîfi söylendiğinde kalbde evliyâlık nûru meydana gelir. 
 Kıymet ve şeref için 
Zülcelâli ve’l-ikrâm ism-i şerîfini söyliyenin kıymet ve şerefi artar.
                  
                  
                  
                  """, style: TextStyle(fontSize: 17, fontFamily: "GentiumBookPlus"),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
