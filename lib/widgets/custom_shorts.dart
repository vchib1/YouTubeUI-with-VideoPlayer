import 'package:flutter/material.dart';

class CustomShorts extends StatelessWidget {

  final String shortThumbnail;
  final String title;
  final String views;

  const CustomShorts({Key? key,required this.shortThumbnail,required this.views,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            width: 175,
            padding: const EdgeInsets.all(0),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(shortThumbnail)
              )
            ),
          ),
          Positioned(
            left: 140,
            child: IconButton(
              onPressed: (){},
              icon: const Icon(Icons.more_vert,),
            ),
          ),
          Positioned(
              top: 215,
              left: 12,
              child: SizedBox(
                width: 160,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                    Text("$views views",style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                  ],
                ),
              ),
          ),
        ],
      ),
    );
  }
}
