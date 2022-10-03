import 'package:flutter/material.dart';

import 'package:minka_design_app/source/screens/screens.dart';

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

    if (documentsService.isLoading) {
      return const LoadingScreen();
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('My Documents'),
      ),
      drawer: const SideMenu(),
      body: ListView.builder(
          itemCount: documentsService.documents.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () {
                documentsService.selectedDocument =
                    documentsService.documents[index].copy();
                Navigator.pushNamed(context, DocumentScreen.routerName);
              },
              child: DocumentCard(
                document: documentsService.documents[index],
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_a_photo_outlined),
      ),
    );
  }
}
