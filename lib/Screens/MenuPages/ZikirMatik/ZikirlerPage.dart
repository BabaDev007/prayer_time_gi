import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../Constants.dart';
import '../../../PageTransition/PageTransition.dart';
import '../../../StateManagement/StateManagement.dart';
import 'ZikirMatik2.dart';
import 'ZikrTile.dart';
import 'package:get_storage/get_storage.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:get/get.dart';
class ZikirlerPage extends StatefulWidget {

  @override
  State<ZikirlerPage> createState() => _ZikirlerPageState();
}

class _ZikirlerPageState extends State<ZikirlerPage> {
  var zikrTile = [
    ZikrTile(name: 'SübhanAllah', zikrSayisi: 33, subtitle: '', siraSayi: 1, ),
    ZikrTile(name: 'Əlhəmdülillah', zikrSayisi: 33 , subtitle: '',siraSayi: 2),
    ZikrTile(name: 'Allahü Əkbər', zikrSayisi: 33 , subtitle: '',siraSayi: 3),
    ZikrTile(name: 'La ilahə illallah', zikrSayisi: 100 , subtitle: '',siraSayi: 4),
    ZikrTile(name: 'La havlə və la quvvətə illa billah', zikrSayisi: 100, subtitle: '',siraSayi: 5),
    ZikrTile(name: 'Sübhanallahi və bihamdihi', zikrSayisi: 100 , subtitle: '',siraSayi: 6),
    ZikrTile(name: 'Bismillahirrahmanirrahim və la havlə və la quvvətə illa billahil aliyyil azim', zikrSayisi:100 , subtitle: '',siraSayi: 7),
    ZikrTile(name: 'Sübhanallahi vəlhamdülillahi və la ilahə illallahü vəllahü əkbər, və la havlə və la quvvətə illa billah', zikrSayisi: 100 , subtitle: '',siraSayi: 8),
    ZikrTile(name: 'Sübhanallahi və bihamdihi, Sübhanallahilazim', zikrSayisi: 100 , subtitle: '',siraSayi: 9),
    ZikrTile(name: 'La ilahə illallah və La havlə vəla quvvətə illa billah',zikrSayisi: 100 , subtitle: '',siraSayi: 10),
    ZikrTile(name: 'Lə ilahə illəllahül məlikül haqqul mübin',zikrSayisi: 100 , subtitle: '',siraSayi: 11),
    ZikrTile(name: "Lə iləhə illəlahü vəhdəhü lə şərikə ləh, ləhül mülku və ləhül həmdü və hüvə alə külli şey'in qadir"
      ,zikrSayisi: 10 , subtitle: '',siraSayi: 12),
    ZikrTile(name: 'Əstağfirullah',zikrSayisi: 70 , subtitle: '',siraSayi: 13),
    ZikrTile(name: 'Ya zəl-cəlali vəl-ikram', zikrSayisi: 100, subtitle: '',siraSayi: 14),
    ZikrTile(name: 'Allahümme salli ala Muhammed ve ala âli Muhammed', zikrSayisi: 100, subtitle: '',siraSayi: 15),
    ZikrTile(name: 'Allahümme ecirnî minennâr', zikrSayisi: 7, subtitle: '',siraSayi: 16),
    ZikrTile(name: 'Bismillahillezî lâ yedurru ma’asmihî şey’ün fil erdı ve lâ fissemâi ve hüvessemî’ul alîm', zikrSayisi: 3, subtitle: '',siraSayi: 17),
    ZikrTile(name: 'Eûzü billahis-semî’il alîmi mineşşeytânirracîm', zikrSayisi: 3, subtitle: '',siraSayi: 18),
    ZikrTile(name: 'İxlas sürəsi', zikrSayisi: 11, subtitle: '',siraSayi: 19),
    ZikrTile(name: 'La ilahe illallahü vahdehü la-şerikeleh lehül-mülkü ve lehül-hamdü yuhyi ve yümit ve hüve ala külli şeyin kadir', zikrSayisi: 10, subtitle: '',siraSayi: 20),
    ZikrTile(name: 'Hasbiyallahü lâ ilahe illâ hü, aleyhi tevekkeltü ve hüve Rabbül-arşil-azîm', zikrSayisi: 7, subtitle: '',siraSayi: 21),
    ZikrTile(name: 'Allahümme bâriklî fil mevt ve fî mâ ba’del-mevt', zikrSayisi: 25, subtitle: '',siraSayi: 22),
    ZikrTile(name: 'Estagfirullah el-azim ellezi lâ ilahe illâ hüvel hayyel kayyume ve etubü ileyh', zikrSayisi: 7, subtitle: '',siraSayi: 23),


  ];

  GetStorage box = GetStorage();
  Controller c = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    var _w = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:PreferredSize(
        preferredSize: Size(
          double.infinity,
          56.0,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),

          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: AppBar(
              leading:     IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.chevron_left, size: 30,),),
              elevation: 0,

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))
              ),

              backgroundColor: Constants.primaryColor.withOpacity(.6),
              centerTitle: true,
              shadowColor: Colors.transparent,
              title: Text("Zikrlər", style: TextStyle(fontFamily: "Oswald", color: Colors.white.withOpacity(.8)),),
            ),
          ),
        ),
      ) ,
      body: AnimationLimiter(
        child: Scrollbar(
          child: ListView.separated(

            padding: EdgeInsets.symmetric(horizontal: _w / 30, vertical: 100),
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemCount: zikrTile.length,
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
                      child: ListTile(
                        leading: FittedBox(
                          child: CircularPercentIndicator(
                            center: Text('${zikrTile[index].zikrSayisi}/${((box.read("${index + 1}")?? 0))}'),
                            progressColor: Constants.primaryColor,
                            radius: 40,
                            percent: ((box.read("${index + 1}")?? 0)/ zikrTile[index].zikrSayisi),
                          ),
                        ),
                        subtitle: Text("Bugün ${box.read("0${index+1}${c.difference2}")??0}  Ümumi ${box.read("00${index+1}")??0}" ),
                        title: Text( '${zikrTile[index].name}', maxLines: 1, overflow: TextOverflow.ellipsis, ),
                        onTap: (){
                          Navigator.of(context).pushReplacement(SizeTransition2(ZikrPage1(isim: zikrTile[index].name, siraSayi: zikrTile[index].siraSayi, zikirSayisi: zikrTile[index].zikrSayisi,)));
                        },
                      )
                  ),
                ),
              );
            }, separatorBuilder: (BuildContext context, int index) {
              return
                AnimationConfiguration.staggeredList(
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
                        child: Divider()
                    ),
                  ),
                );

          },

          ),
        ),
      ),
    );
  }
}


