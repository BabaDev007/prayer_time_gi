import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import '../../../../../Constants.dart';
import 'package:share_plus/share_plus.dart';


class JumahCard extends StatelessWidget {

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
                    "Cüməniz mübarək olsun",
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
                "${liste[Jiffy().week]}",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontWeight: FontWeight.w500,

                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  TextButton(
                      onPressed: () async {
                        await Share.share(
                            "${liste[Jiffy().week]}"
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
  var liste = [
    CumaWords().soz1, CumaWords().soz2, CumaWords().soz3 ,CumaWords().soz4 ,CumaWords().soz5,CumaWords().soz6,CumaWords().soz7,CumaWords().soz8,CumaWords().soz9, CumaWords().soz10 ,CumaWords().soz11,CumaWords().soz12,CumaWords().soz13,CumaWords().soz14,CumaWords().soz15,CumaWords().soz17,CumaWords().soz18,CumaWords().soz19,
    CumaWords().soz20,CumaWords().soz21,CumaWords().soz22,
    CumaWords().soz23, CumaWords().soz2, CumaWords().soz3 ,CumaWords().soz4 ,CumaWords().soz5,CumaWords().soz6,CumaWords().soz7,CumaWords().soz8,CumaWords().soz9, CumaWords().soz10 ,CumaWords().soz11,CumaWords().soz12,CumaWords().soz13,CumaWords().soz14,CumaWords().soz15,CumaWords().soz17,CumaWords().soz18,CumaWords().soz19,
    CumaWords().soz20,CumaWords().soz21,CumaWords().soz22,
    CumaWords().soz1, CumaWords().soz2, CumaWords().soz23 ,CumaWords().soz4 ,CumaWords().soz5,CumaWords().soz6,CumaWords().soz7,CumaWords().soz8,CumaWords().soz9, CumaWords().soz10 ,CumaWords().soz11,CumaWords().soz12,CumaWords().soz13,CumaWords().soz14,CumaWords().soz15,CumaWords().soz17,CumaWords().soz18,CumaWords().soz19,
    CumaWords().soz20,CumaWords().soz21,CumaWords().soz22,
    CumaWords().soz1, CumaWords().soz2, CumaWords().soz3 ,CumaWords().soz4 ,CumaWords().soz23,CumaWords().soz6,CumaWords().soz7,CumaWords().soz8,CumaWords().soz9, CumaWords().soz10 ,CumaWords().soz11,CumaWords().soz12,CumaWords().soz13,CumaWords().soz14,CumaWords().soz15,CumaWords().soz17,CumaWords().soz18,CumaWords().soz19,
    CumaWords().soz20,CumaWords().soz21,CumaWords().soz22,
  ];
}


class CumaWords {

var soz1 = """
  Cümə gününün ədəbləri
             
  1. Cüməni cümə axşamından qarşılamaq.
  2. Cümə günü qüsl almaq.
  3. Başı taraş etmək. Saqqalın bir tutamdan artığını və dırnaqları kəsmək. Təmiz paltar geyinmək.
  4. Cümə namazına mümkün olduğu qədər erkən getmək.
  5. Ön sıraya keçmək üçün camaatın çiyinlərindən aşmamalıdır.
  6. Məsciddə namaz qılanın önündən keçməmək.
  7. Xatib əfəndi minbərə çıxdıqdan sonra heç bir şey söyləməmək, danışana işarət ilə belə cavab verməmək və azanı təkrarlamamaq.
  8. Cümə namazından sonra Fatihə, Kafirun, İxlas, Fəlaq və Nas surələrini yeddi dəfə oxumaq
  9. Əsr qədər məsciddə qalıb ibadət etmək.
  10.Əhli-sünnət alimlərinin kitablarından anladılan alimlərin dərsində, vazında olmaq.
  11.Cümə gününü həmişə ibadət ilə keçirmək.
  12.Cümə günü salavatı-şərifə gətirmək.
  13.Qurani-Kərim oxumaq. “Kəhf” surəsini oxumalıdır.
  14.Sədəqə vermək.
  15.Ana-atanı və ya qəbrlərini ziyarət etmək.
  16.Evin yeməklərini bol və şirin etmək.
  17.Çox namaz qılmaq. Qəzaya qalmış namazı olanlar qəza namazı qılmalıdır""";

var soz2 = """
(Allah qatında günlərin əfəndisi Cümə’dır. O Qurban və Ramazan bayramı günlərindən də fəzilətlidir. Cümə günündə bu beş xüsusiyyət vardır: 1- Həzrət-i Adəm o gün yaradıldı. 2- O gün yer üzünə endirildi. 3- O gün vəfat etdi. 4- O gündə elə bir an vardır ki, günah və ya qohumlarla əlaqəni kəsmək mövzularında olmamaq şərti ilə qul Allahü təaladan bir şey istəyərsə Allahü təala mütləq onu verər. 5- Qiyamət o gün qopacaqdır. Allah’a yaxın heç bir mələk, heç bir göy, heçbir yer yoxdur, heçbir külək, heç bir dağ və daş yoxdur ki, qiyamətin qopmasına səhnə olacağı üçün Cümə gününün heybətindən qorxmasın.) [Buxari, İ. Əhməd]
            """;
var soz3 = """
Cümə, möminlərin bayramıdır. Bugün edilən ibadətlərə ən az, iki qat səvab verilir. Bugün işlənən günahlar da, iki qat yazılır. Hədis-i şəriflərdə buyurulur ki:
(Səvablar içində Cümə günü və gecəsində edilən daha qiymətlisi, günahlar içində də, Cüma günü və gecəsində işleniləndən daha pisi yoxdur.) [Ramuz]
            """;
var soz4 = """
(Cümə günü günah işləmədən keçərsə, digər günlər də səlamətlə keçər.) [İ.Gazali]
            """;
var soz5 = """
(Cümə günü, quşlar, vəhşi heyvanlar bir birinə, “Salam sizə, bugün Cümədir” deyərlər.) [Dəyləmi]
            """;
var soz6 = """
(Cümə digər Cüməyə qədər və əlavə üç gün içində işlənən günahlara kəfarət olur. Çünkü yaxşı bir əməl işləyənə on qat səvab verilir.) [Taberani]
            """;
var soz7 = """
(Dört gecənin gündüzü de gecəsi kimi fəzilətlidir. Allahü təâlâ, o günlərdə dua edənin istəyini geri çevirməz, onları məğfirət edər və onlar bu günlərdə bol ehsana nail olarlar. Bunlar: Qədir gecəsi, Ərəfə gecəsi, Bəraət gecəsi, Cümə gecəsi və günləri.) [Dəyləmi]
            """;
var soz8 = """
(Cümə günü qüsl eden kimsənin günahları əvf olar.) [Tabərani]
            """;
var soz9 = """
(Cümə günü sübh namazından əvvəl, “Estagfirullahelazim ellezi la ilahe illa hüvel hayyel kayyume ve etubü ileyh” oxuyanın, dəniz köpüyü qədər də olsa, bütün günahları avf olar.) [İbni Sünni]
[Belə böyük mükafat veriləbilməsi üçün, o şəxsin, düzgün etiqada sahib olması, qul haqqını, qəzaya qalan fərzlərini ödəməsi və haramlardan əlçəkməsi şərtdir.]
            """;

var soz10 = """
(Ana-atanın qəbrini, Cümə günləri ziyarət edən kəsin günahları avf olar, haqlarını ödəmiş olar.) [Tirmizi]
            """;
var soz11 = """
(Cümə günü 80 salavat gətirənin, 80 illik günahı avf olar.) [Darə Kutni]
            """;
var soz12 = """
(Cümə gecəsi Yasin surəsini oxuyanın günahları avf edilər.) [İsfəhani]
            """;
var soz13 = """
(Cümə günü və ya gecəsi Duhan suresini oxuyana Cənnətdə bir malikanə verilər.) [Taberani]
            """;
var soz14 = """
Özünə Cümə namazı fərz olan hər müsəlmanın alış verişini buraxıb namaza getməsi fərzdir. Üzürsüz Cüməya getməmək haramdır. Əzan oxunarkən də, alışveriş etmək məkruhdur. Halbuki alış verişin özü halaldır. Yəni alınan mal məkruh deyil, halaldır. Fəqət əzan oxunarkən alış veriş edilməsi məkruhdur. (Dürər)
            """;
var soz15 = """
(Cümə gecəsi Yasin suresini oxuyanın günahları avf edilər.) [İsfəhani]
            """;
// var soz16 = """
// Hadis-i şəriflərdə buyurulur ki:
// (Allahü teâlâ, bugündən etibarən qiyamətə qədər sizə Cümə namazını fərz qıldı. Ədalətli ve ya zalim bir imam [başçı] vaxtında küçümsəyərək ve ya inkâr edərək Cümə namazını tərk edənin iki yaxası bir araya gəlməsin! Belə bir kimsə tövbə etməz ise, onun namazı, zəkatı, həcci, orucu və heçbir ibadəti qəbul olmaz.) [İbni Macə]
//             """;
var soz17 = """
(Allah’a və axirətə inanan, Cümə namazına getsin!) [Tabərani]
            """;
var soz18 = """
(Cümə namazından sonra, yeddi dəfə ixlas və muavvizəteyn [yəni iki Qul əuzunu] oxuyan kəsi, Allahü teâlâ, bir həftə, qəzadan, bəladan, pis işlərdən qoruyar.) [İbni Sünni]
            """;
var soz19 = """
(Böyük günah işlənmədiyi müddətcə, beş vaxt namaz ilə Cümə namazı, növbəti Cüməyə qədər aralarda işlənən günahlara kəffarədir.) [Müslim]
          """;


var soz20 = """
Səfəri olana Cümə qılmaq fərz deyildir, qılarsa fərz səvabını alar. (Hindiyyə)      """;

var soz21 = """
 Cümə günü oruc tutmaq müstəhabdır. Hədis-i şərifde buyuruldu ki:
(Cümə günü oruc tutana, on axirət günü oruc səvabı verilər.) [Beyhəki]

Bəzi âlimlərə göre də yalnız Cümə günü oruc tutmaq məkruhdur. Hədis-i şərifde buyuruldu ki:
(Yalnız Cümə günü oruc tutmayın! Bir gün əvvəli və ya bir gün sonrası ilə tutun.) [Buxari]

(Sünnə və məkruh olduğu bildirilən bir işi etməməlidir! Bunun üçün Cümə günü orucu cümə axşamı ve ya şənbə ilə birlikdə tutmaq lazımdır!) (Redd-ül Muhtar)    """;

var soz22 = """
(Cümə namazına gedərkən ayaqları tozlanan kəsə Cəhənnəm odu haramdır.) [Tirmizi]            """;
  var soz23 = """
Cüma günü və ya Cümə gecəsi ölən mömin, şəhid səvabına qovuşar və qəbir əzabından qorunar. Hədîs-i şərîf """;






}
