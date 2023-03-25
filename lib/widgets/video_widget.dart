import 'package:flutter/material.dart';
import 'package:youtubeuiproject/model/video_model.dart';

class VideoWidget extends StatelessWidget {

  final VideoModel video;

  const VideoWidget({Key? key,
    required this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          //Video with Duration
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(video.thumbnail,)
                  )
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(3)
                ),
                child: Text(video.duration,style: const TextStyle(color: Colors.white),),
              ),
            ],
          ),

          //Video Details
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 5,vertical: 3),
            leading: CircleAvatar(
              radius: 22,
              backgroundImage: NetworkImage(video.channelProfilePic),
            ),
            title: Text(video.title,style: const TextStyle(fontSize: 16,),maxLines: 2,overflow: TextOverflow.ellipsis),
            subtitle: Text("${video.channelName} • ${video.views} views • ${video.timeUploaded} ago",style: const TextStyle(fontSize: 13)),
            trailing: Icon(Icons.more_vert,color: Theme.of(context).iconTheme.color,),
          )
        ],
      ),
    );
  }
}
