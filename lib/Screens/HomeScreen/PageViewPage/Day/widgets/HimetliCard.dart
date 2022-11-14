import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayer_time_gi/StateManagement/StateManagement.dart';
import '../../../../../Constants.dart';
import 'package:get_storage/get_storage.dart';
import 'package:share_plus/share_plus.dart';

class HikmetliSozCard extends StatefulWidget {
  @override
  State<HikmetliSozCard> createState() => _HikmetliSozCardState();
}

class _HikmetliSozCardState extends State<HikmetliSozCard> {
  Controller c = Get.put(Controller());
  GetStorage box = GetStorage();
  int maxLines = 4;
  var visual = "Oxu";
  var zor = false;
  @override
  Widget build(BuildContext context) {
    final Controller c = Get.find();

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
                  Icon(
                    Icons.legend_toggle,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Hikmətli sözlər",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Constants.primaryColor),
                  ),
                ],
              ),
              Text(
                " Hikmət əhli buyurdu ki,",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  maxLines: 1000,
                  box.read('hikmetlisoz').toString() ??
                      "Kim olduğu deyil kiminlə olduğun önəmlidir",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(.8),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  TextButton(
                      onPressed: () async {
                        await Share.share(
                            "Hikmət əhli buyurdu ki, \n ${box.read("hikmetlisoz")} "
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
