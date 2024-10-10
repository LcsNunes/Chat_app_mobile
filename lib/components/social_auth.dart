import 'package:flutter/material.dart';

class SocialAuth extends StatelessWidget {

  String image;

  SocialAuth({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(10),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          //begin: Alignment.topCenter,
          colors: [
            const Color.fromARGB(255, 36, 152, 156),
            const Color.fromARGB(255, 99, 197, 241),
          ])
      ),
      child: Image.network(
        image,
        color: Colors.white,
        fit: BoxFit.fill)
      
    );
  }
}