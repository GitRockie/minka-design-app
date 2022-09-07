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
              icon: Icons.notifications_outlined,
              text: 'Notifications'),
        ]),
        TableRow(children: [
          _SingleCard(
              colorContent: Colors.indigo,
              icon: Icons.hotel_class_outlined,
              text: 'Raitings'),
          _SingleCard(
              colorContent: Colors.teal,
              icon: Icons.qr_code_outlined,
              text: 'Contracts'),
        ]),
        TableRow(children: [
          _SingleCard(
              colorContent: Colors.deepPurple,
              icon: Icons.support_agent_outlined,
              text: 'Support'),
          _SingleCard(
              colorContent: Colors.cyan,
              icon: Icons.person_search_outlined,
              text: 'Match Finder'),
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
    final boxDecoration = BoxDecoration(
        color: const Color.fromRGBO(62, 67, 107, 0.7),
        borderRadius: BorderRadius.circular(20));
    return Container(
      margin: const EdgeInsets.all(15),
      height: 180,
      decoration: boxDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: colorContent,
            radius: 30,
            child: Icon(
              icon,
              size: 35,
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
      ),
    );
  }
}
