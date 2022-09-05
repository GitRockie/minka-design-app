import 'dart:math';

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    const boxDecoration = BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.2, 0.8],
          colors: [Color(0xff2E305F), Color(0xff202333)]),
    );
    return Stack(
      children: [
        //Body purple gradient
        Container(
          decoration: boxDecoration,
        ),
        //rose Box on background
        const Positioned(top: -90, left: -30, child: _RoseBox()),
      ],
    );
  }
}

class _RoseBox extends StatelessWidget {
  const _RoseBox();

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        width: 330,
        height: 330,
        decoration: BoxDecoration(
            color: Colors.pink,
            gradient: const LinearGradient(colors: [
              Color.fromRGBO(236, 98, 188, 1),
              Color.fromRGBO(241, 142, 172, 1),
            ]),
            borderRadius: BorderRadius.circular(60)),
      ),
    );
  }
}
