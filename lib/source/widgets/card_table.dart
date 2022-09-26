import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:minka_design_app/source/screens/documents_screen.dart';
import 'package:minka_design_app/source/screens/screens.dart';

class CardTable extends StatelessWidget {
  const CardTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, BasicDesignScreen.routerName);
            },
            child: const _SingleCard(
                colorContent: Colors.amber,
                icon: Icons.engineering_outlined,
                text: 'Project Now'),
          ),
          const _SingleCard(
              colorContent: Colors.pinkAccent,
              icon: Icons.person_search_outlined,
              text: 'Match Finder'),
        ]),
        TableRow(children: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, BasicDesignScreen.routerName);
            },
            child: const _SingleCard(
                colorContent: Colors.cyan,
                icon: Icons.hotel_class_outlined,
                text: 'Raitings'),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, QrReaderScreen.routerName);
            },
            child: const _SingleCard(
                colorContent: Colors.teal,
                icon: Icons.qr_code_outlined,
                text: 'QR-Reader'),
          ),
        ]),
        TableRow(children: [
          const _SingleCard(
              colorContent: Colors.indigo,
              icon: Icons.support_agent_outlined,
              text: 'Minka Support'),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, DocumentsScreen.routerName);
            },
            child: const _SingleCard(
                colorContent: Colors.orange,
                icon: Icons.source_sharp,
                text: 'Documents'),
          ),
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
