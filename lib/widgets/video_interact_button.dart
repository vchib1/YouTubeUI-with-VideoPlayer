import 'package:flutter/material.dart';

class VideoInteractButton extends StatelessWidget {

  final IconData icon;
  final String text;

  const VideoInteractButton({Key? key,required this.text,required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Icon(icon),
          Text(text),
        ],
      ),
    );
  }
}
