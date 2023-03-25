import 'package:flutter/material.dart';
import '../constants/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      title: Padding(
        padding: const EdgeInsets.only(left: 3.0),
        child: Theme.of(context).colorScheme.primary == Colors.black ? Image.asset("assets/yt_logo_dark.png",height: 22) : Image.asset("assets/yt_logo_light.png",height: 22),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(35),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 8,bottom: 8),
            child: SizedBox(
              height: 40,
              child: Row(
                children: [
                  Container(
                    height: 30,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.explore,size: 20,),
                        SizedBox(width: 5,),
                        Text("Explore")
                      ],
                    ),
                  ),

                  VerticalDivider(
                    color: Theme.of(context).colorScheme.onSecondary,
                    width: 30,
                    indent: 5,
                    endIndent: 5,
                  ),

                  ListView.builder(
                    itemCount: categoryNames.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: index == 0 ? Theme.of(context).colorScheme.secondary : null,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Theme.of(context).colorScheme.onSecondary),
                        ),
                        child: Text(categoryNames[index]),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      actions: const [
        Icon(Icons.cast,size: 25,),
        appBarSpace,
        Icon(Icons.notifications_none_sharp,size: 25,),
        appBarSpace,
        Icon(Icons.search,size: 25,),
        appBarSpace,
        CircleAvatar(radius: 14,backgroundImage: NetworkImage("https://yt3.googleusercontent.com/yti/AHXOFjXg5pXmsoETs2xzqNxsNQhMxpABqkecsgE3TCIZkw=s88-c-k-c0x00ffffff-no-rj-mo"),),
        SizedBox(width: 10,),
      ],
    );
  }
}
