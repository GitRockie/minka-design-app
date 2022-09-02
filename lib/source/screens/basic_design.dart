import 'package:flutter/material.dart';

class BasicDesignScreen extends StatelessWidget {
  const BasicDesignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const Image(
          image: AssetImage('assets/port-bay.jpg'),
        ),

        //Title Widget
        const Title(),

        //Button section
        const ButtonSection(),

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: const Text(
              'Officia in aliquip consectetur nostrud id deserunt reprehenderit nulla ea. Esse aute id nulla exercitation mollit voluptate sit aute sunt excepteur deserunt officia est. Irure enim officia consequat nisi et in eiusmod id aliqua. Reprehenderit magna proident labore magna sunt. Lorem esse esse aute ea ex officia sit eiusmod esse. Aliqua proident nisi esse voluptate ullamco et mollit occaecat labore Lorem aute occaecat eiusmod.'),
        )
      ],
    ));
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'TMA | Puerto de Barcelona',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Barcelona, Spain',
                style: TextStyle(color: Colors.black45),
              ),
            ],
          ),
          Expanded(child: Container()),
          const Icon(Icons.star, color: Colors.red),
          const Text('42'),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          CustomButton(
            icon: Icons.call,
            text: 'Llama',
          ),
          CustomButton(
            icon: Icons.near_me,
            text: 'Llega',
          ),
          CustomButton(
            icon: Icons.share,
            text: 'Comparte',
          ),

          //Description
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;

  const CustomButton({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.blue,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 14, color: Colors.blue),
        )
      ],
    );
  }
}
