import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import '../../../../../Constants.dart';

class ShareCard extends StatelessWidget {
  const ShareCard({Key? key}) : super(key: key);

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
                children: [
                  Icon(Icons.share_outlined, color: Colors.blue),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Tətbiqi paylaş",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Constants.primaryColor),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Abdullah İbn Amr İbn Âs -radıyallahu anhumâ-'dan- "
                "rəvayət edildiyinə görə, Nəbi -səllallahu aleyhi və səlləm- belə buyurdu: "
                """'Mənim tərəfimdən bir âyət belə olsa insanlara çatdırın'.""",
                textAlign: TextAlign.justify,
                style: TextStyle(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  TextButton(
                      onPressed: () async {
                  await Share.share(
                      "Azərbaycan üçün Namaz Vaxtı tətbiqi https://play.google.com/store/apps/details?id=com.turkiyetakvimi&gl=US");
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
    ;
  }
}
