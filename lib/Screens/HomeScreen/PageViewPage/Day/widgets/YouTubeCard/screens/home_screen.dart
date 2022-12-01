import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prayer_time_gi/PageTransition/PageTransition.dart';
import 'package:prayer_time_gi/Screens/HomeScreen/PageViewPage/Day/widgets/YouTubeCard/screens/video_screen.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../../../../Constants.dart';
import '../models/channel_model.dart';
import '../models/video_model.dart';
import '../services/api_service.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';



class YouTubeCard extends StatefulWidget {
  @override
  _YouTubeCardState createState() => _YouTubeCardState();
}

class _YouTubeCardState extends State<YouTubeCard> {
  Channel? _channel;
  bool _isLoading = false;

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
    });
  }
  void _launchUrl(String patha) async {
    if (!await launch(Uri.parse(patha).toString(), forceSafariVC: true, forceWebView: false )) throw 'Could not launch $patha';
  }
  _buildProfileInfo() {
    return Container(
      height: 250,
      width: 330,
      margin: EdgeInsets.all(3.0),
      padding: EdgeInsets.all(10.0),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 60.0,
                backgroundImage: AssetImage("assets/chanel_logo.jpg"),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _channel!.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${_channel!.subscriberCount} abunəçi',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${_channel!.videoCount} video',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  ElevatedButton( style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: (){
                    _launchUrl("https://www.youtube.com/channel/UCV5G4F5n17ZCVWtGUxJ6z4A");

                  }, child: Text("Abunə Ol"),)
                ],
              )
            ],
          ),
          SizedBox(height: 3,),
          Text("Əhli-sünnət alimlərinin qiymətli əsərlərini qaynaq alaraq "
              "əhli-sünnət etiqadına uyğun olaraq hazırlanmışdır. Kanalımızdakı məlumatlar bütün insanların "
              "istifadəsi üçün hazırlanmışdır. Əslinə(Orijinallığına) sadiq qalmaq şərtilə ,izin almadan hər kəs istədiyi kimi "
              "istifadə edə bilər.", style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.black, fontSize: 13),)
        ],
      ),
    );
  }

  _buildVideo(Video video) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        SizeTransition2(
           VideoScreen(id: video),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 5.0),
        padding: EdgeInsets.all(5.0),
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
          Expanded(
            flex: 2,
            child: Stack(
             children: [
               FittedBox(child: Image.asset("assets/pngmosque.png")),
               ClipRRect(child:
               Image.network(video.thumbnailUrl),
                 borderRadius: BorderRadius.circular(10),
               ),
             ],
         ),
          ),
            Expanded(
              flex: 3,
              child: Text(
                video.title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 15.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _loadMoreVideos() async {
    setState((){
      _isLoading = true;

    });

   var moreVideos = await APIService.instance
        .fetchVideosFromPlaylist(playlistId: _channel!.uploadPlaylistId);
    List<Video> allVideos = _channel!.videos..addAll(moreVideos);
    setState(() {
      _channel!.videos = allVideos;
      _isLoading = false;
    });

  }

  @override
  Widget build(BuildContext context) {
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

              leading: IconButton(onPressed: () {      Navigator.pop(context);
              }, icon: Icon(Icons.chevron_left, size: 30,),),
              elevation: 0,

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))
              ),

              backgroundColor: Constants.primaryColor.withOpacity(.6),
              centerTitle: true,
              shadowColor: Colors.transparent,
              title: Text("Dini Videolar", style: TextStyle(fontFamily: "Oswald", color: Colors.white.withOpacity(.8)),),
            ),
          ),

        ),
      ) ,
      body: _channel != null
          ? NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollDetails) {
                if (!_isLoading &&
                    _channel!.videos.length != int.parse(_channel!.videoCount) &&
                    scrollDetails.metrics.pixels ==
                        scrollDetails.metrics.maxScrollExtent) {
                  _loadMoreVideos();
                }
                return false;
              },
              child: Stack(
                children: [
                  Scrollbar(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width /30, vertical: 100),
                      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      itemCount: 1 + _channel!.videos.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          return _buildProfileInfo();
                        }
                        Video video = _channel!.videos[index - 1];
                        return _buildVideo(video);
                      },
                    ),
                  ),
                  _isLoading ? Container(
                    child: Center(
                      child: Lottie.asset("assets/loding.json", height: 80),
                    ),
                    color: Colors.black54,
                    width: double.infinity,
                    height: double.infinity,
                  ) : SizedBox()
                ],
              ),
            )
          : Center(
              child: Lottie.asset("assets/loding.json", height: 80),
            ),
    );
  }
}
