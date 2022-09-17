import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(children: [
          _SingleCard(
              colorContent: Colors.amber,
              icon: Icons.engineering_outlined,
              text: 'Project Now'),
          _SingleCard(
              colorContent: Colors.pinkAccent,
              icon: Icons.person_search_outlined,
              text: 'Match Finder'),
        ]),
        TableRow(children: [
          _SingleCard(
              colorContent: Colors.cyan,
              icon: Icons.hotel_class_outlined,
              text: 'Raitings'),
          _SingleCard(
              colorContent: Colors.teal,
              icon: Icons.qr_code_outlined,
              text: 'QR-Reader'),
        ]),
        TableRow(children: [
          _SingleCard(
              colorContent: Colors.indigo,
              icon: Icons.support_agent_outlined,
              text: 'Minka Support'),
          _SingleCard(
              colorContent: Colors.orange,
              icon: Icons.notifications_active_outlined,
              text: 'Notifications'),
        ]),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final Color colorContent;
  final String text;

  const _SingleCard(
      {required this.icon, required this.colorContent, required this.text});

  @override
  Widget build(BuildContext context) {
    return _CardBackground(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: colorContent,
          radius: 30,
          child: Icon(
            icon,
            size: 35,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        Text(
          text,
          style: TextStyle(color: colorContent, fontSize: 14),
        )
      ],
    ));
  }
}

class _CardBackground extends StatelessWidget {
  final Widget child;

  const _CardBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(62, 67, 107, 0.7),
                borderRadius: BorderRadius.circular(20)),
            child: child,
          ),
        ),
      ),
    );
  }
}
