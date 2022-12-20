import 'dart:ui';
import 'package:jiffy/jiffy.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:prayer_time_gi/StateManagement/StateManagement.dart';
import '../../../Constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../HomeScreen/PageViewPage/PageViewPage.dart';

class DataTable1 extends StatefulWidget {
  @override
  _DataTable1 createState() => _DataTable1();
}

class _DataTable1 extends State<DataTable1> {
  var date = "data";
  var sayi;
  List months =
  ['Yanvar', 'Fevral', 'Mart', 'Aprel', 'May','İyun','İyul','Avqust','Sentyabr','Oktyabr','Noyabr','Dekabr'];
  List weekday = ["Bzr.ertəsi", "Çər.axşamı", "Çərşənbə", "Cümə.axşamı", "Cümə", "Şənbə", "Bazar"];
  Controller c = Get.put(Controller());
  GetStorage box = GetStorage();
  var zor;
  @override
  void initState() {

    zor = box.read("time");
    sayi = c.difference2.toInt();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final Controller c = Get.find();

    return
      Scaffold(
        appBar:  PreferredSize(
          preferredSize: Size(
            double.infinity,
            56.0,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),

            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: AppBar(

                elevation: 0,

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))
                ),

                backgroundColor: Constants.primaryColor.withOpacity(.6),
                centerTitle: true,
                shadowColor: Colors.transparent,
                title: Text("Namaz Cədvəli", style: TextStyle(fontFamily: "Oswald", color: Colors.white.withOpacity(.8)),),
              ),
            ),
          ),
        ) ,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: DataTable2(
              columnSpacing: 12,
              horizontalMargin: 1,
              minWidth: 900,
              columns: [
                DataColumn2(
                  label: Text('Tarix'),
                  size: ColumnSize.L,
                ),
                DataColumn2(
                  label: Text('Həftə Günü'),
                  size: ColumnSize.L,
                ),
                DataColumn2(
                  label: Text('İmsaq'),
                  size: ColumnSize.L,

                ),
                DataColumn2(
                  label: Text('Sübh'), size: ColumnSize.L,
                ),
                DataColumn2(
                  label: Text('Günəş'), size: ColumnSize.L,
                ),
                DataColumn2(
                  label: Text('Zöhr'), size: ColumnSize.L,
                ),
                DataColumn2(
                  label: Text('Əsr'), size: ColumnSize.L,
                ),
                DataColumn2(
                  label: Text('Axşam'), size: ColumnSize.L,
                ),
                DataColumn2(
                  label: Text('İşa'), size: ColumnSize.L,
                ),

                DataColumn2(
                  label: Text('Gecə yarısı'), size: ColumnSize.L,
                ),
              ],
              rows:
              List<DataRow>.generate(
               Jiffy().month == 12 ? Jiffy().daysInMonth-Jiffy().date + 1 : 30,
                      (index) => DataRow(
                        selected: true,
                          cells: [
                        DataCell(
                            Text("${DateTime.parse("${zor['${sayi+index}']['baseTime']["todayDate"]}").day} ${months[DateTime.parse("${zor[''
                                '${sayi+index}']['baseTime']["todayDate"]}").month - 1]}" ?? "Tapılmadı",
                            )),
                        DataCell(Text(weekday[DateTime.parse("${zor['${sayi+index}']['baseTime']["todayDate"]}").weekday - 1].toString() ?? "Tapılmadı")) ,
                        DataCell(Text(zor['${sayi+index}']['baseTime']['imsaq'].toString()?? "Tapılmadı")),
                        DataCell(Text(zor['${sayi+index}']['baseTime']['sabah'].toString()?? "Tapılmadı")),
                        DataCell(Text(zor['${sayi+index}']['baseTime']['gunes'].toString()?? "Tapılmadı")),
                        DataCell(Text(zor['${sayi+index}']['baseTime']['gunorta'].toString()?? "Tapılmadı")),
                        DataCell(Text(zor['${sayi+index}']['baseTime']['ikindi'].toString()?? "Tapılmadı")),
                        DataCell(Text(zor['${sayi+index}']['baseTime']['axsam'].toString()?? "Tapılmadı")),
                        DataCell(Text(zor['${sayi+index}']['baseTime']['yatsi'].toString()?? "Tapılmadı")),
                        DataCell(Text(zor['${sayi+index}']['extraTime']['midnight'].toString()?? "Tapılmadı")),


                      ]))),




             ),
        );

  }
}