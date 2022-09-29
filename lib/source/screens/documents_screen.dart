import 'package:flutter/material.dart';
import 'package:minka_design_app/source/screens/document_screen.dart';

import 'package:minka_design_app/source/widgets/document_card.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';
import '../widgets/side_menu.dart';

class DocumentsScreen extends StatelessWidget {
  static const String routerName = 'documents';

  const DocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final documentsService = Provider.of<DocumentsService>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('My Documents'),
      ),
      drawer: const SideMenu(),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, DocumentScreen.routerName),
              child: DocumentCard())),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_a_photo_outlined),
      ),
    );
  }
}
