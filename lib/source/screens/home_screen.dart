import 'package:flutter/material.dart';

import '../widgets/background.dart';
import '../widgets/card_table.dart';
import '../widgets/custom_bottom_navigation.dart';
import '../widgets/page_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          //Background
          Background(),
          //Home body
          _HomeBody()
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: const [
        //Titles
        PageTitle(),
        //Card Table
        CardTable()
      ]),
    );
  }
}
