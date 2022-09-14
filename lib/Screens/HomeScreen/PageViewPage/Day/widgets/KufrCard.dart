
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../Constants.dart';

class KufrCard extends StatefulWidget {

  @override
  State<KufrCard> createState() => _KufrCardState();
}

class _KufrCardState extends State<KufrCard> {
  int maxLines = 4;
  var visual = "Oxu";
  var zor = true;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              AnimatedSwitcher(
                duration: Duration(milliseconds: 400),
                child:  zor ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Row(
                  children: [
                    Icon(Icons.info_outline_rounded, color: Colors.blue),
SizedBox(width: 10,),
                    Text("Çox mühüm açıqlama", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "GentiumBookPlus", color: Constants.primaryColor ),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(onPressed: () {
                      setState(() {
                        zor = !zor;

                      });
                    },
                        child: Row(
                          children: [
                            Icon(Icons.chrome_reader_mode_outlined),
                            SizedBox(width: 10,),
                            Text("Oxu", style: TextStyle(fontWeight: FontWeight.bold, color: Constants.primaryColor.withOpacity(.5)),),
                          ],
                        )),



                  ],
                )
            ],
          )


          
       :   Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text("Çox mühüm açıqlama", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "GentiumBookPlus", color: Colors.red ),),
              SizedBox(height: 10,),
              Text("Küfrə düşən nə etməlidir?",
                style: TextStyle( fontFamily: "GentiumBookPlus", fontWeight: FontWeight.bold  ),),
              SizedBox(height: 20,),
              Text("Sual",
                style: TextStyle( fontFamily: "GentiumBookPlus", fontWeight: FontWeight.bold  ),),
              Text("  Bilib-bilmədən çox söz danışır, doğru-yanlış çox iş görürük. Özümüz də bilmədən küfrə düşmüşüksə nə etməliyik?",
                style: TextStyle( fontFamily: "GentiumBookPlus", ),),
              SizedBox(height: 10,),

              Text("Cavab",
                style: TextStyle( fontFamily: "GentiumBookPlus", fontWeight: FontWeight.bold  ),),
              Text("""  İslam alimləri buyururlar ki:"""
                """Hər Müsəlman Allahü təalanın əmrlərinə tabe olmalı, qadağan etdiyi şeylərdən çəkinməlidir. İbadətləri yerinə yetirməyə, haramlardan çəkinməyə əhəmiyyət verməyənin imanı gedər, kafir olar. Kafir olaraq ölən insan axirətdə sonsuz olaraq Cəhənnəmdə çeşidli əzablara məruz qalar. Əfv edilməsinə və Cəhənnəmdən çıxmasına imkan və ehtimal yoxdur.
   Bir Müsəlmanın küfrə düşməsi, yəni kafir olması çox asanlıqla olur. Çünki hər sözdə və hər işdə kafir olmaq ehtimalı çoxdur. Buna görə də küfrün səbəbi bilinməsə də, hər gün bir dəfə “Ya Rəbbi, bilərək və ya bilməyərək küfrə [kafirliyə] səbəb olan bir söz söylədim və ya bir iş etdimsə, peşman oldum, məni əfv et” demək lazımdır. Belə tövbə edən Müsəlman mütləq ki, əfv olunar, Cəhənnəmdən xilas olar. Cəhənnəmdə sonsuz qalmamaq üçün hər gün mütləq tövbə etmək lazımdır. Müsəlmanın bu tövbədən daha vacib vəzifəsi yoxdur.""",
                style: TextStyle( fontFamily: "GentiumBookPlus", ),),
              SizedBox(height: 10,),
              Text("Bilmədən küfrə girmək",
                style: TextStyle( fontFamily: "GentiumBookPlus", fontWeight: FontWeight.bold  ),),
              SizedBox(height: 10,),

              Text("Sual",
                style: TextStyle( fontFamily: "GentiumBookPlus", fontWeight: FontWeight.bold  ),),
              Text("  Bir söz və ya işin küfür olduğunu bilmədən işləyən, sonra da, “Ya Rəbbi bilərək-bilməyərək işlədiyim küfürlərə tövbə etdim” desə, küfrü əfv olarmı?",
                style: TextStyle( fontFamily: "GentiumBookPlus", ),),
              SizedBox(height: 10,),

              Text("Cavab",
                style: TextStyle( fontFamily: "GentiumBookPlus", fontWeight: FontWeight.bold  ),),
              Text("  Bəli, əfv olar.",
                style: TextStyle( fontFamily: "GentiumBookPlus", ),),

              SizedBox(height: 10,),



              Text("Küfürdən, inkardan qorunmaq üçün", textAlign: TextAlign.justify,
                style: TextStyle( fontFamily: "GentiumBookPlus", fontWeight: FontWeight.bold  ),),
              SizedBox(height: 10,),

              Text("  Muhamməd əleyhissalamın Allahü təaladan gətirib bildirdiyi şeylərin hamısına qəlb ilə inanıb dil ilə söyləməyə iman deyilir. İmanın yeri qəlbdir. Qəlb, ürək adlanan ət parçasında olan bir qüvvədir, buna könül də deyilir. İmanı söyləməyə maneə olduğu zaman söyləməmək əfv olur. Məsələn, qorxudulduğu, xəstə, dilsiz olduğu, söyləyəcək vaxt olmadan öldüyü zaman söyləmək lazım gəlməz. Anlamadan, təqlid edərək inanmaq da iman sayılır. Allahü təalanın var olduğunu anlamamaq, düşünməmək günah olar. Peyğəmbər əfəndimiz tərəfindən açıq-aşkar bildirilənlərdən birinə belə inanmamaq, hamısına inanmamaq sayılır. Hər birini bilmədən “Hamısına inandım” demək də iman sayılır."""

              """İmanın hasil olması üçün İslamiyyətin küfür, inkar əlaməti dediyi şeylərdən çəkinmək də lazımdır. İslamiyyətin əmr və qadağalarından birini zəif görmək, Qurani-kərimlə, mələklərlə, Peyğəmbərlərdən biri ilə lağ etmək, küfür, inkar əlamətlərindəndir. İnkar etmək, yəni eşitdikdən sonra inanmamaq, təsdiq etməmək deməkdir. Şübhə etmək də inkar sayılır.
    Küfür, yəni imanın getməsinə səbəb olduğunu hər kəsin bildiyi bir şeyi, eşitmədiyi, düşünmədiyi üçün kafir olanların, imanı gedənlərin küfrü “küfri-cəhli”dir. Cəhalət də iki cürdür:
    Birincisi, cahil olduğunu bilir, lakin bu cəhalətinin getməsi üçün çalışmır. Belə olanlar üçün “Heyvan kimidirlər, hətta heyvandan da aşağıdırlar” deyilmişdir. Çünki insanı heyvandan ayıran elm və idrakdır. Heyvanlar yaradıldıqları şeydə irəlidədirlər. Özlərinə faydalı şeyləri anlayır və onlara yaxınlaşırlar. Zərərli olanları da anlayıb onlardan uzaqlaşırlar. Halbuki belə cahillər bilmədiklərini bildikləri halda bu çirkin haldan uzaqlaşmaz, elmə yaxınlaşmazlar. Cəhalətin ikincisi “cəhli-mürəkkəb”dir. Yunan filosoflarından və Müsəlmanlardan yetmiş iki bidət firqəsindən imanı gedənlər belədirlər. Bu cəhalət birincisindən daha pisdir. Əlacı bilinməyən bir xəstəlikdir. İsa əleyhissalam “Karı, lalı müalicə etdim, ölünü diriltdim, ancaq cəhli-mürəkkəbin əlacını tapa bilmədim” buyurmuşdur. Çünki belə adamlar cəhalətini elm və kamillik, üstünlük zənn edir. Cahil və ruh xəstəsi olduğunu bilmir ki, əlacını axtarsın! Ancaq Allahü təalanın hidayəti ilə xəstəliyini anlayan adam bu dərddən qurtula bilər.
    İman ediləcək şeyləri və fərzlərdən, haramlardan məşhur olanları, lazımi qədər öyrənmək fərzdir. Bunları öyrənməmək haramdır. Eşidib, amma öyrənməyə əhəmmiyyət, dəyər verməmək küfrə, yəni imanın getməsinə səbəb olur. Cəhalətdən qurtulmağın əlacı isə Əhli-sünnət alimlərinin kitablarını oxuyaraq öyrənməkdir.""",
                style: TextStyle( fontFamily: "GentiumBookPlus", ),),




              SizedBox(height: 10,),
              Text("Küfrə düşməmək üçün",
                style: TextStyle( fontFamily: "GentiumBookPlus", fontWeight: FontWeight.bold  ),),
              SizedBox(height: 10,),

              Text("Sual",
                style: TextStyle( fontFamily: "GentiumBookPlus", fontWeight: FontWeight.bold  ),),
              Text("  Küfrə düşməmək üçün nə etmək lazımdır?",
                style: TextStyle( fontFamily: "GentiumBookPlus", ),),
              SizedBox(height: 10,),

              Text("Cavab",
                style: TextStyle( fontFamily: "GentiumBookPlus", fontWeight: FontWeight.bold  ),),
              Text("  Küfrə salan söz və işləri öyrənərək bunlardan çəkinmək lazımdır. Müsəlman bilə-bilə küfrə düşməz, qəsdən özünü kafir etməz, amma bilmədən düşə bilər. Bilmədən küfrə düşən bu duanı ixlasla oxuyarsa, imanı təkrar geri gələr:",
                style: TextStyle( fontFamily: "GentiumBookPlus", ),),
              SizedBox(height: 10,),
              Text("“Allahümmə inni ə'uzü bikə min ən üşrikə bikə şəy'ən və ənə əa'ləmü və əstəğfirükə li-mə lə əa'ləmü innəkə əntə allamül quyub.”",
                style: TextStyle( fontFamily: "GentiumBookPlus", fontWeight: FontWeight.bold  ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(onPressed: () {
                    setState(() {
                      zor = !zor;

                    });
                  },
                      child: Text("Bağla", style: TextStyle(fontWeight: FontWeight.bold, color: Constants.primaryColor.withOpacity(.5)),)),



                ],
              )





            ],
          ),
              )),
      ),
    );
  }
}
