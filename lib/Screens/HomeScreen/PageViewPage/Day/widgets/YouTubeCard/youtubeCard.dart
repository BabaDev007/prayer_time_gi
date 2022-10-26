import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/Day/widgets/YouTubeCard/screens/home_screen.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/Day/widgets/YouTubeCard/services/api_service.dart';
import '../../../../../../Constants.dart';
import 'package:shimmer/shimmer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../../../PageTransition/PageTransition.dart';
import '../../../../../MenuPages/Books/PdfViewer.dart';
import 'models/channel_model.dart';
import 'models/video_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SohbetCard extends StatefulWidget {

  @override
  State<SohbetCard> createState() => _SohbetCardState();
}

class _SohbetCardState extends State<SohbetCard> {
  Channel? _channel;
  bool _isLoading = false;
  late YoutubePlayerController _controller;
  Video? video;
  @override
  void initState() {
    super.initState();

    _initChannel();

  }

  _initChannel() async {
    Channel channel = await APIService.instance
        .fetchChannel(channelId: 'UCV5G4F5n17ZCVWtGUxJ6z4A');
    setState(() {
      _channel = channel;
       video = _channel!.videos[0];
    });
  }
  Future<void>sss()async{
   _controller.pause();}



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child:


      Container(


        child: Stack(
          alignment: Alignment.center,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              color: Colors.white,
              child: Container(

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(FontAwesomeIcons.video, color: Colors.blue, size: 20,),
                          SizedBox(width: 10,),
                          Text("Dini videolar", style: TextStyle(fontWeight: FontWeight.bold, color: Constants.primaryColor ),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      _isLoading ?  YoutubePlayer(
                        topActions: [],
                        bottomActions: [
                          CurrentPosition(),
                          ProgressBar(isExpanded: true),
                          RemainingDuration()

                        ],
                        controller: _controller,
                        showVideoProgressIndicator: true,
                        onReady: () {
                          print('Player is ready.');
                        },
                      ) :
                      InkWell(
                        onTap: (){
                          setState(() {

                            _isLoading = true;
                            _controller = YoutubePlayerController(
                              initialVideoId: video!.id,
                              flags: YoutubePlayerFlags(
                                loop: true,
                                showLiveFullscreenButton: false,
                                mute: false,
                                autoPlay: true,
                              ),
                            );
                          });
                        },
                        child: ClipRRect(
                          // borderRadius: BorderRadius.only(topRight:  Radius.circular(10) , topLeft: Radius.circular(10)),
                          child: _channel != null  ? Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              CachedNetworkImage(
                                imageUrl:
                                "${video!.thumbnailUrl}",
                                placeholder: (context, url) => Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Shimmer(
                                      loop: 3,
                                      period: Duration(seconds: 5),
                                      direction: ShimmerDirection.ltr,
                                      enabled: true,
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          colors: [Colors.blueGrey, Constants.primaryColor, Colors.white, Colors.blueGrey]

                                      ), child: Container(
                                      width: double.infinity,
                                      height: 200,
                                      decoration: BoxDecoration(
                                          color: Constants.primaryColor,
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))

                                      ),
                                    ), ),
                                    Image.asset("assets/pngmosque.png", width: MediaQuery.of(context).size.width/3,) ,
                                  ],
                                ),
                                errorWidget: (context, url, error) => Icon(Icons.error, size: 100,),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [Constants.primaryColor, Constants.primaryColor.withOpacity(.3)]
                                    , begin: Alignment.bottomCenter, end: Alignment.topCenter
                                    )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("${video!.title}", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: "Oswald"),),
                                  ),
                                  // color: Constants.primaryColor.withOpacity(.3),
                                  height: 50,
                                  width: double.infinity,
                                ),
                              )
                            ],
                          ) :


                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Shimmer(
                                period: Duration(seconds: 5),
                                direction: ShimmerDirection.ltr,
                                enabled: true,
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    colors: [ Constants.primaryColor,  Constants.primaryColor.withOpacity(.7), Constants.primaryColor,]

                                ), child: Container(
                                width: double.infinity,
                                height: 300,
                                decoration: BoxDecoration(
                                    color: Constants.primaryColor,
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))

                                ),
                              ), ),
                              Image.asset("assets/pngmosque.png", width: MediaQuery.of(context).size.width/3,) ,
                            ],
                          ) ,
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlinedButton(onPressed: () async{
                              sss();
                                 Navigator.push(
                                 context, SizeTransition2(YouTubeCard()));
                            },
                                child: Text("Daha çox", style: TextStyle(fontWeight: FontWeight.bold, color: Constants.primaryColor.withOpacity(.5)),)),
                            TextButton(onPressed: () {

                            },
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.share, color: Constants.primaryColor,),
                                    SizedBox( width: 20,),
                                    Text("Paylaş", style: TextStyle(fontWeight: FontWeight.bold, color: Constants.primaryColor.withOpacity(.5)),)

                                  ],
                                )),


                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),





          ],
        ),
      ),

    );

  }
}
