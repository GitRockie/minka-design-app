import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('menu-img.jpg'))),
            child: Container(),
          )
        ],
      ),
    );
  }
}
