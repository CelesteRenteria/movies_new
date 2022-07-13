import 'package:flutter/material.dart';
import 'dart:math';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);
  final boxDecoration = const BoxDecoration(
    gradient:LinearGradient(
      begin: Alignment.topCenter, 
      end: Alignment.bottomCenter, 
      stops:[0.2,0.8], 
      colors: [Color(0xff2E305F),
      Color(0xFF412B6A)]
      )
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: boxDecoration,
        ),
        const Positioned(
          top: -100,
          left: -30,
          child: _ColorBox())
      ],
    );
  }
}




class _ColorBox extends StatelessWidget {
  const _ColorBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi/5,
      child: Container(width: 360, height: 360, decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
      gradient: const LinearGradient(colors: [Color.fromARGB(122, 78, 226, 191), Color.fromARGB(145, 145, 18, 135), Color.fromARGB(45,122,15, 45)])),),
    );
  }
}