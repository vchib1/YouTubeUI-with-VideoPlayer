import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtubeuiproject/model/video_model.dart';
import 'package:youtubeuiproject/widgets/custom_appbar.dart';
import 'package:youtubeuiproject/widgets/custom_shorts.dart';
import 'package:youtubeuiproject/widgets/video_page.dart';
import 'package:youtubeuiproject/widgets/video_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  VideoModel? selectedVideo;
  final MiniplayerController controller = MiniplayerController();
  final double minHeight = 60;

  bool hideBottomNavBar = false;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              //App Bar
              const CustomAppBar(),

              //Shorts ListView
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  const EdgeInsets.only(left: 8.0,bottom: 5),
                      child:  Row(
                        children: [
                          Image.asset("assets/shorts_icon.png",height: 20),
                          const SizedBox(width: 10,),
                          const Text("Shorts",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(0),
                      height: 275,
                      child: ListView.builder(
                        itemCount: shortList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CustomShorts(
                            title: shortList[index].title,
                            views: shortList[index].views,
                            shortThumbnail: shortList[index].thumbnail,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              //Video ListView
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom:10.0),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            selectedVideo = videoList[index];
                            controller.animateToHeight(state: PanelState.MAX,);
                          });
                        },
                        child: VideoWidget(video: videoList[index],),
                      ),
                    );
                  },
                  childCount: videoList.length,
                ),
              ),
            ],
          ),

          selectedVideo != null ? Miniplayer(
            maxHeight: MediaQuery.of(context).size.height,
            minHeight: minHeight,
            controller: controller,
            builder: (double height, double percentage) {
              if(height > minHeight + MediaQuery.of(context).size.height * .1){
                return VideoPage(
                  video: selectedVideo,
                );
              }else{
                return Container(
                  alignment: Alignment.center,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.network(
                            selectedVideo!.thumbnail,
                            height: minHeight - 4.0,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            width: 175,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(selectedVideo!.title,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis),
                                Text(selectedVideo!.channelName,style: const TextStyle(fontSize: 12,color: Colors.grey)),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.play_arrow),
                          ),
                          IconButton(
                            onPressed: () => setState(() {
                              selectedVideo = null;
                            }),
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                      const LinearProgressIndicator(value: 0.1, valueColor: AlwaysStoppedAnimation<Color>(Colors.red),)
                    ],
                  ),
                );
              }
            },
          ) : const SizedBox.shrink()
        ],
      ),
      bottomNavigationBar: AnimatedContainer(
        height: hideBottomNavBar ? 0 : kBottomNavigationBarHeight,
        duration: const Duration(milliseconds: 100),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined,),label: "Home",activeIcon: Icon(Icons.home,)),
            BottomNavigationBarItem(icon: Icon(Icons.video_call_outlined,),label: "Shorts",activeIcon: Icon(Icons.video_call_rounded,)),
            BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline,),label: "Add",activeIcon: Icon(Icons.add_circle,)),
            BottomNavigationBarItem(icon: Icon(Icons.subscriptions_outlined,),label: "subscriptions",activeIcon: Icon(Icons.subscriptions,)),
            BottomNavigationBarItem(icon: Icon(Icons.video_collection_outlined,),label: "Library",activeIcon: Icon(Icons.video_collection,)),
          ],
        ),
      ),
    );
  }
}
