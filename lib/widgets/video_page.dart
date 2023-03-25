import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtubeuiproject/model/video_model.dart';
import 'package:youtubeuiproject/widgets/video_interact_button.dart';
import 'package:youtubeuiproject/widgets/video_widget.dart';

import '../constants/constants.dart';

class VideoPage extends StatefulWidget {

  final VideoModel? video;
  const VideoPage({Key? key, required this.video}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {

  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.video!.videoUrl);

    controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: false
      )
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Video Player
              YoutubePlayer(
                controller: controller,
                showVideoProgressIndicator: true,
                thumbnail: Image.network(widget.video!.thumbnail),
                topActions: [
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.arrow_drop_down,color: Colors.white,),
                  ),
                  const Expanded(child: SizedBox.shrink()),
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.cast,color: Colors.white,),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.closed_caption,color: Colors.white,),
                  ),
                  const PlaybackSpeedButton(
                    icon: Icon(Icons.settings,color: Colors.white,),
                  ),
                ],
                bottomActions: [
                  CurrentPosition(
                    controller: controller,
                  ),
                  ProgressBar(
                    isExpanded: true,
                    colors: const ProgressBarColors(
                      playedColor: Colors.red,
                      handleColor: Colors.grey
                    ),
                  ),
                  FullScreenButton(),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    //Title
                    Text(widget.video!.title,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                    //Views count and Time
                    Text("${widget.video!.views} views • ${widget.video!.timeUploaded} ago",style: const TextStyle(fontSize: 14)),

                  ],
                ),
              ),

              //Video Actions
              SizedBox(
                height: 60,
                child: ListView.builder(
                  itemCount: videoInteractIcons.length+2,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if(index == 0){
                      return VideoInteractButton(
                          text: widget.video!.likes,
                          icon: Icons.thumb_up_alt_outlined
                      );
                    }
                    if(index == 1){
                      return VideoInteractButton(
                          text: widget.video!.dislikes,
                          icon: Icons.thumb_down_alt_outlined
                      );
                    }else{
                      return VideoInteractButton(
                        text: videoInteractionText[index-2],
                        icon: videoInteractIcons[index-2],
                      );
                    }

                  },
                ),
              ),

              //Channel Info
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(widget.video!.channelProfilePic),
                ),
                title: Text(widget.video!.channelName),
                subtitle: Text("${widget.video!.subscribers} subscribers"),
                trailing: const Text("SUBSCRIBE",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 16),),
              ),

              //Comments
              ListTile(
                leading: const Text("Comments"),
                title: const Text("677",style: TextStyle(fontSize: 12),),
                horizontalTitleGap: 10,
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.arrow_drop_up),
                    Icon(Icons.arrow_drop_down_outlined),
                  ],
                ),
              ),


              //Suggested Videos
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: videoList.length,
                itemBuilder: (context, index) {
                  if(widget.video == videoList[index]){
                    return const SizedBox.shrink();
                  }else{
                    return VideoWidget(
                        video: videoList[index]
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
