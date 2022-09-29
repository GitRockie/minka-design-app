import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/models.dart';
import 'package:http/http.dart' as http;

class DocumentsService extends ChangeNotifier {
  final String _baseUrl =
      'minka-app-40353-default-rtdb.europe-west1.firebasedatabase.app';

  final List<Document> documents = [];
  bool isLoading = true;

  DocumentsService() {
    loadDocuments();
  }

  Future loadDocuments() async {
    final url = Uri.https(_baseUrl, 'documents.json');
    final resp = await http.get(url);

    final Map<String, dynamic> documentsMap = json.decode(resp.body);

    documentsMap.forEach((key, value) {
      final tempDocument = Document.fromMap(value);
      tempDocument.id = key;
      documents.add(tempDocument);
    });

    print(documents[0].name);
  }
}
