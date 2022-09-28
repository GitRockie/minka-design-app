import 'package:flutter/material.dart';
import 'package:minka_design_app/source/widgets/widgets.dart';

class DocumentScreen extends StatelessWidget {
  static const String routerName = 'document';

  const DocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: const [
              DocumentImage(),
            ],
          )
        ],
      ),
    ));
  }
}
