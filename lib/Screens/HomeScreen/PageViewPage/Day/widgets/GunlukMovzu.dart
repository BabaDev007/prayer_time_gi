import 'package:flutter/material.dart';

import '../../../../../Constants.dart';

class GunlukMovzuCard extends StatefulWidget {

  @override
  State<GunlukMovzuCard> createState() => _GunlukMovzuCardState();
}

class _GunlukMovzuCardState extends State<GunlukMovzuCard> {
  int maxLines = 4;
var visual = "Oxu";

  var zor = false;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(4.0),
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
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
                    Icon(Icons.view_day_outlined, color: Colors.blue,),
                    SizedBox(width: 10,),
                    Text("Günün mövzusu", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "GentiumBookPlus", color: Constants.primaryColor ),),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text("Allahü təala, insanları Müsəlman etməyə məcbur deyildir", maxLines: 2 , overflow: TextOverflow.ellipsis, textAlign: TextAlign.justify,
                    style: TextStyle(fontFamily: "GentiumBookPlus", fontWeight: FontWeight.bold, color: Colors.black),),
                ),

                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: AnimatedCrossFade(
                    firstChild: Text( maxLines: 4, "Allahu təalanın mərhəməti sonsuz olduğu kimi, əzabı da sonsuzdur, ədaləti də sonsuzdur. İstədiyi quluna səbəbsiz və qul özü istəmədən iman verir, ehsan edir. Səlim ağlına tabe olaraq əxlaqı və işləri yaxşı olanlara da, doğru olan, məqbul olan imanı verəcəyini bildirilmişdir. Bir insanın imanlı olaraq ölüb-ölməyəcəyi son nəfəsdə bəlli olur. Bütün ömrü iman ilə keçib, son günlərində imanı gedən, imansız ölən insan qiyamətdə imansızlar arasında olacaq. İmanla ölmək üçün hər gün dua etmək lazımdır. Allahü təala sonsuz mərhəmətilə Peyğəmbərlər göndərərək, var və bir olduğunu və inanılması lazım olan şeyləri qullarına bildirdi. İman, Peyğəmbərin (sallallahü aleyhi və səlləm) bildirdiklərini təsdiq etmək deməkdir. Peyğəmbəri təsdiq etməyən, inkar edən kafir olur. Kafirlər Cəhənnəmdə sonsuz yanacaqlar. Peyğəmbəri (aleyhissaləvətü vəttəslimat) eşitməyən insan Allahü təalanın var və bir olduğunu düşünərək, yalnız Ona iman etsə və Peyğəmbəri (aleyhissaləvətü vəttəslimat) eşitmədən ölsə, o da Cənnətə girəcəkdir. Bunları düşünmədən iman etməsə, Cənnətə girməyəcək. Peyğəmbəri (aleyhissaləvətü vəttəslimat) inkar etmədiyi üçün Cəhənnəmə də girməyəcəkdir. Qiyamət günü hesabdan sonra təkrar yox ediləcəkdir. Cəhənnəmdə sonsuz yanmaq, Peyğəmbəri (фleyhissaləvətü vəttəslimat) eşidib, amma inkar etməyin cəzasıdır. Bu alimlər arasında (rahimə-hümullahü təala) “Allahü təalanın varlığını düşünməyərək iman etməyən insan Cəhənnəmə girəcəkdir” deyənlər olsa da, bu söz Peyğəmbəri (sallallahü təala фleyhi və səlləm) eşitdikdən sonra düşünməyən deməkdir. (Hər kəsə Lazım Olan Iman s. 465)",  overflow: TextOverflow.ellipsis, textAlign: TextAlign.justify,
                      style: TextStyle(fontFamily: "GentiumBookPlus", fontWeight: FontWeight.w300, color: Colors.black.withOpacity(.8), ),),
                    secondChild: Text( maxLines: 1000,"Allahu təalanın mərhəməti sonsuz olduğu kimi, əzabı da sonsuzdur, ədaləti də sonsuzdur. İstədiyi quluna səbəbsiz və qul özü istəmədən iman verir, ehsan edir. Səlim ağlına tabe olaraq əxlaqı və işləri yaxşı olanlara da, doğru olan, məqbul olan imanı verəcəyini bildirilmişdir. Bir insanın imanlı olaraq ölüb-ölməyəcəyi son nəfəsdə bəlli olur. Bütün ömrü iman ilə keçib, son günlərində imanı gedən, imansız ölən insan qiyamətdə imansızlar arasında olacaq. İmanla ölmək üçün hər gün dua etmək lazımdır. Allahü təala sonsuz mərhəmətilə Peyğəmbərlər göndərərək, var və bir olduğunu və inanılması lazım olan şeyləri qullarına bildirdi. İman, Peyğəmbərin (sallallahü aleyhi və səlləm) bildirdiklərini təsdiq etmək deməkdir. Peyğəmbəri təsdiq etməyən, inkar edən kafir olur. Kafirlər Cəhənnəmdə sonsuz yanacaqlar. Peyğəmbəri (aleyhissaləvətü vəttəslimat) eşitməyən insan Allahü təalanın var və bir olduğunu düşünərək, yalnız Ona iman etsə və Peyğəmbəri (aleyhissaləvətü vəttəslimat) eşitmədən ölsə, o da Cənnətə girəcəkdir. Bunları düşünmədən iman etməsə, Cənnətə girməyəcək. Peyğəmbəri (aleyhissaləvətü vəttəslimat) inkar etmədiyi üçün Cəhənnəmə də girməyəcəkdir. Qiyamət günü hesabdan sonra təkrar yox ediləcəkdir. Cəhənnəmdə sonsuz yanmaq, Peyğəmbəri (фleyhissaləvətü vəttəslimat) eşidib, amma inkar etməyin cəzasıdır. Bu alimlər arasında (rahimə-hümullahü təala) “Allahü təalanın varlığını düşünməyərək iman etməyən insan Cəhənnəmə girəcəkdir” deyənlər olsa da, bu söz Peyğəmbəri (sallallahü təala фleyhi və səlləm) eşitdikdən sonra düşünməyən deməkdir. (Hər kəsə Lazım Olan Iman s. 465)",  overflow: TextOverflow.ellipsis, textAlign: TextAlign.justify,
                  style: TextStyle(fontFamily: "GentiumBookPlus", fontWeight: FontWeight.w300, color: Colors.black.withOpacity(.8), ),) ,
                    crossFadeState: zor ?  CrossFadeState.showSecond : CrossFadeState.showFirst,
                    duration: Duration(milliseconds: 300),

                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(onPressed: () {
                      setState(() {
                       zor = !zor;
                       zor ? visual = "Bağla" : visual = "Oxu";                      });
                    },
                        child:Row(
                          children: [
                            Icon(Icons.chrome_reader_mode_outlined),
                            SizedBox(width: 10,),
                            Text(visual, style: TextStyle(fontWeight: FontWeight.bold, color: Constants.primaryColor.withOpacity(.5)),),
                          ],
                        )),
                    TextButton(onPressed: () {  },
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.share, color: Constants.primaryColor,),
                            SizedBox( width: 20,),
                            Text("Paylaş", style: TextStyle(fontWeight: FontWeight.bold, color: Constants.primaryColor.withOpacity(.5)),)

                          ],
                        )),


                  ],
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
