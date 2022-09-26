import 'package:flutter/material.dart';
import 'package:minka_design_app/source/widgets/document_card.dart';

import '../widgets/side_menu.dart';

class DocumentsScreen extends StatelessWidget {
  static const String routerName = 'documents';
  const DocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('My Documents'),
      ),
      drawer: const SideMenu(),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) =>
              const DocumentCard()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_a_photo_outlined),
      ),
    );
  }
}
